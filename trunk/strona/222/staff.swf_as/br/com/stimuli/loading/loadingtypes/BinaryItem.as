package br.com.stimuli.loading.loadingtypes 
{
    import br.com.stimuli.loading.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    
    public class BinaryItem extends br.com.stimuli.loading.loadingtypes.LoadingItem
    {
        public function BinaryItem(arg1:flash.net.URLRequest, arg2:String, arg3:String)
        {
            super(arg1, arg2, arg3);
            return;
        }

        public override function onErrorHandler(arg1:flash.events.ErrorEvent):void
        {
            super.onErrorHandler(arg1);
            return;
        }

        public override function stop():void
        {
            var loc1:*;
            try 
            {
                if (this.loader) 
                {
                    this.loader.close();
                }
            }
            catch (e:Error)
            {
            };
            super.stop();
            return;
        }

        public override function cleanListeners():void
        {
            if (this.loader) 
            {
                this.loader.removeEventListener(flash.events.ProgressEvent.PROGRESS, onProgressHandler, false);
                this.loader.removeEventListener(flash.events.Event.COMPLETE, this.onCompleteHandler, false);
                this.loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.onErrorHandler, false);
                this.loader.removeEventListener(br.com.stimuli.loading.BulkLoader.OPEN, this.onStartedHandler, false);
                this.loader.removeEventListener(flash.events.HTTPStatusEvent.HTTP_STATUS, super.onHttpStatusHandler, false);
                this.loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, super.onSecurityErrorHandler, false);
            }
            return;
        }

        public override function load():void
        {
            var loc1:*;
            super.load();
            this.loader = new flash.net.URLLoader();
            this.loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
            this.loader.addEventListener(flash.events.ProgressEvent.PROGRESS, onProgressHandler, false, 0, true);
            this.loader.addEventListener(flash.events.Event.COMPLETE, this.onCompleteHandler, false, 0, true);
            this.loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.onErrorHandler, false, 0, true);
            this.loader.addEventListener(flash.events.HTTPStatusEvent.HTTP_STATUS, super.onHttpStatusHandler, false, 0, true);
            this.loader.addEventListener(flash.events.Event.OPEN, this.onStartedHandler, false, 0, true);
            this.loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, super.onSecurityErrorHandler, false, 0, true);
            try 
            {
                this.loader.load(url);
            }
            catch (e:SecurityError)
            {
                onSecurityErrorHandler(_createErrorEvent(e));
            }
            return;
        }

        public override function onStartedHandler(arg1:flash.events.Event):void
        {
            super.onStartedHandler(arg1);
            return;
        }

        public override function onCompleteHandler(arg1:flash.events.Event):void
        {
            _content = arg1.target.data;
            super.onCompleteHandler(arg1);
            return;
        }

        public override function _parseOptions(arg1:Object):Array
        {
            return super._parseOptions(arg1);
        }

        public override function destroy():void
        {
            this.stop();
            this.cleanListeners();
            _content = null;
            this.loader = null;
            return;
        }

        public var loader:flash.net.URLLoader;
    }
}
