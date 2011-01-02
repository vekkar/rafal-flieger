package br.com.stimuli.loading.loadingtypes 
{
    import br.com.stimuli.loading.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    
    public class VideoItem extends br.com.stimuli.loading.loadingtypes.LoadingItem
    {
        public function VideoItem(arg1:flash.net.URLRequest, arg2:String, arg3:String)
        {
            specificAvailableProps = [br.com.stimuli.loading.BulkLoader.CHECK_POLICY_FILE, br.com.stimuli.loading.BulkLoader.PAUSED_AT_START];
            super(arg1, arg2, arg3);
            var loc1:*;
            _bytesLoaded = loc1 = 0;
            _bytesTotal = loc1;
            return;
        }

        public function get checkPolicyFile():Object
        {
            return this._checkPolicyFile;
        }

        public override function onStartedHandler(arg1:flash.events.Event):void
        {
            _content = this.stream;
            if (this.pausedAtStart && this.stream) 
            {
                this.stream.pause();
            }
            super.onStartedHandler(arg1);
            return;
        }

        public override function stop():void
        {
            var loc1:*;
            try 
            {
                if (this.stream) 
                {
                    this.stream.close();
                }
            }
            catch (e:Error)
            {
            };
            super.stop();
            return;
        }

        public override function _parseOptions(arg1:Object):Array
        {
            this.pausedAtStart = arg1[br.com.stimuli.loading.BulkLoader.PAUSED_AT_START] || false;
            this._checkPolicyFile = arg1[br.com.stimuli.loading.BulkLoader.CHECK_POLICY_FILE] || false;
            return super._parseOptions(arg1);
        }

        internal function fireCanBeginStreamingEvent():void
        {
            if (this._canBeginStreaming) 
            {
                return;
            }
            this._canBeginStreaming = true;
            var loc1:*=new flash.events.Event(br.com.stimuli.loading.BulkLoader.CAN_BEGIN_PLAYING);
            dispatchEvent(loc1);
            return;
        }

        public function get metaData():Object
        {
            return this._metaData;
        }

        function onNetStatus(arg1:flash.events.NetStatusEvent):void
        {
            var loc1:*=null;
            if (!this.stream) 
            {
                return;
            }
            this.stream.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.onNetStatus, false);
            if (arg1.info.code != "NetStream.Play.Start") 
            {
                if (arg1.info.code == "NetStream.Play.StreamNotFound") 
                {
                    onErrorHandler(_createErrorEvent(new Error("[VideoItem] NetStream not found at " + this.url.url)));
                }
            }
            else 
            {
                _content = this.stream;
                loc1 = new flash.events.Event(flash.events.Event.OPEN);
                this.onStartedHandler(loc1);
            }
            return;
        }

        public override function isStreamable():Boolean
        {
            return true;
        }

        public override function load():void
        {
            var customClient:Object;

            var loc1:*;
            super.load();
            this.nc = new flash.net.NetConnection();
            this.nc.connect(null);
            this.stream = new flash.net.NetStream(this.nc);
            this.stream.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onErrorHandler, false, 0, true);
            this.stream.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.onNetStatus, false, 0, true);
            this.dummyEventTrigger = new flash.display.Sprite();
            this.dummyEventTrigger.addEventListener(flash.events.Event.ENTER_FRAME, this.createNetStreamEvent, false, 0, true);
            customClient = new Object();
            customClient.onCuePoint = function (... rest):void
            {
                return;
            }
            customClient.onMetaData = this.onVideoMetadata;
            customClient.onPlayStatus = function (... rest):void
            {
                return;
            }
            this.stream.client = customClient;
            try 
            {
                this.stream.play(url.url, this._checkPolicyFile);
            }
            catch (e:SecurityError)
            {
                onSecurityErrorHandler(_createErrorEvent(e));
            }
            this.stream.seek(0);
            return;
        }

        public function get canBeginStreaming():Boolean
        {
            return this._canBeginStreaming;
        }

        function onVideoMetadata(arg1:*):void
        {
            this._metaData = arg1;
            return;
        }

        public override function onCompleteHandler(arg1:flash.events.Event):void
        {
            _content = this.stream;
            super.onCompleteHandler(arg1);
            return;
        }

        public override function cleanListeners():void
        {
            if (this.stream) 
            {
                this.stream.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, onErrorHandler, false);
                this.stream.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.onNetStatus, false);
            }
            if (this.dummyEventTrigger) 
            {
                this.dummyEventTrigger.removeEventListener(flash.events.Event.ENTER_FRAME, this.createNetStreamEvent, false);
                this.dummyEventTrigger = null;
            }
            return;
        }

        public override function isVideo():Boolean
        {
            return true;
        }

        public function createNetStreamEvent(arg1:flash.events.Event):void
        {
            var loc1:*=null;
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=0;
            var loc5:*=NaN;
            var loc6:*=NaN;
            var loc7:*=NaN;
            if (_bytesTotal == _bytesLoaded && _bytesTotal > 8) 
            {
                if (this.dummyEventTrigger) 
                {
                    this.dummyEventTrigger.removeEventListener(flash.events.Event.ENTER_FRAME, this.createNetStreamEvent, false);
                }
                this.fireCanBeginStreamingEvent();
                loc1 = new flash.events.Event(flash.events.Event.COMPLETE);
                this.onCompleteHandler(loc1);
            }
            else if (_bytesTotal == 0 && this.stream && this.stream.bytesTotal > 4) 
            {
                loc2 = new flash.events.Event(flash.events.Event.OPEN);
                this.onStartedHandler(loc2);
                _bytesLoaded = this.stream.bytesLoaded;
                _bytesTotal = this.stream.bytesTotal;
            }
            else if (this.stream) 
            {
                loc3 = new flash.events.ProgressEvent(flash.events.ProgressEvent.PROGRESS, false, false, this.stream.bytesLoaded, this.stream.bytesTotal);
                if (this.isVideo() && this.metaData && !this._canBeginStreaming) 
                {
                    if ((loc4 = flash.utils.getTimer() - responseTime) > 100) 
                    {
                        loc5 = bytesLoaded / (loc4 / 1000);
                        _bytesRemaining = _bytesTotal - bytesLoaded;
                        loc6 = _bytesRemaining / (loc5 * 0.8);
                        if ((loc7 = this.metaData.duration - this.stream.bufferLength) > loc6) 
                        {
                            this.fireCanBeginStreamingEvent();
                        }
                    }
                }
                super.onProgressHandler(loc3);
            }
            return;
        }

        public override function destroy():void
        {
            if (!this.stream) 
            {
            };
            this.stop();
            this.cleanListeners();
            this.stream = null;
            super.destroy();
            return;
        }

        public var stream:flash.net.NetStream;

        public var dummyEventTrigger:flash.display.Sprite;

        public var pausedAtStart:Boolean=false;

        public var _metaData:Object;

        public var _canBeginStreaming:Boolean=false;

        internal var nc:flash.net.NetConnection;

        public var _checkPolicyFile:Boolean;
    }
}
