package br.com.stimuli.loading.loadingtypes 
{
    import br.com.stimuli.loading.*;
    import br.com.stimuli.loading.utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    
    public class LoadingItem extends flash.events.EventDispatcher
    {
        public function LoadingItem(arg1:flash.net.URLRequest, arg2:String, arg3:String)
        {
            super();
            this._type = arg2;
            this.url = arg1;
            this._parsedURL = new br.com.stimuli.loading.utils.SmartURL(arg1.url);
            if (!this.specificAvailableProps) 
            {
                this.specificAvailableProps = [];
            }
            this._uid = arg3;
            return;
        }

        public function onSecurityErrorHandler(arg1:flash.events.ErrorEvent):void
        {
            this.status = STATUS_ERROR;
            this.errorEvent = arg1 as flash.events.ErrorEvent;
            arg1.stopPropagation();
            this._dispatchErrorEvent(this.errorEvent);
            return;
        }

        public function stop():void
        {
            if (this._isLoaded) 
            {
                return;
            }
            this.status = STATUS_STOPPED;
            this._isLoading = false;
            return;
        }

        public function get startTime():int
        {
            return this._startTime;
        }

        public function isSound():Boolean
        {
            return false;
        }

        public function onCompleteHandler(arg1:flash.events.Event):void
        {
            this._totalTime = flash.utils.getTimer();
            this._timeToDownload = (this._totalTime - this._responseTime) / 1000;
            if (this._timeToDownload == 0) 
            {
                this._timeToDownload = 0.1;
            }
            this._speed = br.com.stimuli.loading.BulkLoader.truncateNumber(this.bytesTotal / 1024 / this._timeToDownload);
            this.status = STATUS_FINISHED;
            this._isLoaded = true;
            dispatchEvent(arg1);
            arg1.stopPropagation();
            return;
        }

        public function get weightPercentLoaded():Number
        {
            return this._weightPercentLoaded;
        }

        public function get bytesLoaded():int
        {
            return this._bytesLoaded;
        }

        public function get id():String
        {
            return this._id;
        }

        public function isImage():Boolean
        {
            return false;
        }

        public function _dispatchErrorEvent(arg1:flash.events.ErrorEvent):void
        {
            this.status = STATUS_ERROR;
            dispatchEvent(new flash.events.ErrorEvent(br.com.stimuli.loading.BulkLoader.ERROR, true, false, arg1.text));
            return;
        }

        public function isText():Boolean
        {
            return false;
        }

        public function onHttpStatusHandler(arg1:flash.events.HTTPStatusEvent):void
        {
            this._httpStatus = arg1.status;
            dispatchEvent(arg1);
            return;
        }

        public function onStartedHandler(arg1:flash.events.Event):void
        {
            this._responseTime = flash.utils.getTimer();
            this._latency = br.com.stimuli.loading.BulkLoader.truncateNumber((this._responseTime - this._startTime) / 1000);
            this.status = STATUS_STARTED;
            dispatchEvent(arg1);
            return;
        }

        public function get hostName():String
        {
            return this._parsedURL.host;
        }

        public function get humanFiriendlySize():String
        {
            var loc1:*=this._bytesTotal / 1024;
            if (loc1 < 1024) 
            {
                return int(loc1) + " kb";
            }
            return (loc1 / 1024).toPrecision(3) + " mb";
        }

        public override function toString():String
        {
            return "LoadingItem url: " + this.url.url + ", type:" + this._type + ", status: " + this.status;
        }

        public function onProgressHandler(arg1:*):void
        {
            this._bytesLoaded = arg1.bytesLoaded;
            this._bytesTotal = arg1.bytesTotal;
            this._bytesRemaining = this._bytesTotal - this.bytesLoaded;
            this._percentLoaded = this._bytesLoaded / this._bytesTotal;
            this._weightPercentLoaded = this._percentLoaded * this.weight;
            dispatchEvent(arg1);
            return;
        }

        public function get totalTime():int
        {
            return this._totalTime;
        }

        public function get type():String
        {
            return this._type;
        }

        public function isVideo():Boolean
        {
            return false;
        }

        public function get speed():Number
        {
            return this._speed;
        }

        public function get content():*
        {
            return this._content;
        }

        public function _parseOptions(arg1:Object):Array
        {
            var loc2:*=null;
            this.preventCache = arg1[br.com.stimuli.loading.BulkLoader.PREVENT_CACHING];
            this._id = arg1[br.com.stimuli.loading.BulkLoader.ID];
            this._priority = int(arg1[br.com.stimuli.loading.BulkLoader.PRIORITY]) || 0;
            this.maxTries = arg1[br.com.stimuli.loading.BulkLoader.MAX_TRIES] || 3;
            this.weight = int(arg1[br.com.stimuli.loading.BulkLoader.WEIGHT]) || 1;
            var loc1:*=br.com.stimuli.loading.BulkLoader.GENERAL_AVAILABLE_PROPS.concat(this.specificAvailableProps);
            this.propertyParsingErrors = [];
            var loc3:*=0;
            var loc4:*=arg1;
            for (loc2 in loc4) 
            {
                if (loc1.indexOf(loc2) != -1) 
                {
                    continue;
                }
                this.propertyParsingErrors.push(this + ": got a wrong property name: " + loc2 + ", with value:" + arg1[loc2]);
            }
            return this.propertyParsingErrors;
        }

        public function isXML():Boolean
        {
            return false;
        }

        public function get bytesTotal():int
        {
            return this._bytesTotal;
        }

        public function get httpStatus():int
        {
            return this._httpStatus;
        }

        public function onErrorHandler(arg1:flash.events.ErrorEvent):void
        {
            var loc1:*;
            var loc2:*=((loc1 = this).numTries + 1);
            loc1.numTries = loc2;
            arg1.stopPropagation();
            if (this.numTries < this.maxTries) 
            {
                this.status = null;
                this.load();
            }
            else 
            {
                this.status = STATUS_ERROR;
                this.errorEvent = arg1;
                this._dispatchErrorEvent(this.errorEvent);
            }
            return;
        }

        public function isStreamable():Boolean
        {
            return false;
        }

        public function get percentLoaded():Number
        {
            return this._percentLoaded;
        }

        public function get responseTime():Number
        {
            return this._responseTime;
        }

        public function get priority():int
        {
            return this._priority;
        }

        public function get bytesRemaining():int
        {
            return this._bytesRemaining;
        }

        public function get isLoaded():Boolean
        {
            return this._isLoaded;
        }

        public function get timeToDownload():int
        {
            return this._timeToDownload;
        }

        public function isLoader():Boolean
        {
            return false;
        }

        public function load():void
        {
            var loc1:*=null;
            if (this.preventCache) 
            {
                loc1 = "BulkLoaderNoCache=" + this._uid + "_" + int(Math.random() * 100 * flash.utils.getTimer());
                if (this.url.url.indexOf("?") != -1) 
                {
                    this.url.url = this.url.url + "&" + loc1;
                }
                else 
                {
                    this.url.url = this.url.url + "?" + loc1;
                }
            }
            this._isLoading = true;
            this._startTime = flash.utils.getTimer();
            return;
        }

        public function getStats():String
        {
            return "Item url: " + this.url.url + "(s), total time: " + (this._totalTime / 1000).toPrecision(3) + "(s), download time: " + this._timeToDownload.toPrecision(3) + "(s), latency:" + this._latency + "(s), speed: " + this._speed + " kb/s, size: " + this.humanFiriendlySize;
        }

        public function get addedTime():int
        {
            return this._addedTime;
        }

        public function _createErrorEvent(arg1:Error):flash.events.ErrorEvent
        {
            return new flash.events.ErrorEvent(br.com.stimuli.loading.BulkLoader.ERROR, false, false, arg1.message);
        }

        public function cleanListeners():void
        {
            return;
        }

        public function isSWF():Boolean
        {
            return false;
        }

        public function destroy():void
        {
            this._content = null;
            return;
        }

        public function get latency():Number
        {
            return this._latency;
        }

        public static const STATUS_FINISHED:String="finished";

        public static const STATUS_STOPPED:String="stopped";

        public static const STATUS_STARTED:String="started";

        public static const STATUS_ERROR:String="error";

        public var _parsedURL:br.com.stimuli.loading.utils.SmartURL;

        public var _isLoaded:Boolean;

        public var _context:*=null;

        public var _isLoading:Boolean;

        public var _additionIndex:int;

        public var _percentLoaded:Number;

        public var _bytesTotal:int=-1;

        public var _totalTime:int;

        public var numTries:int=0;

        public var _id:String;

        public var _httpStatus:int=-1;

        public var _content:*;

        public var status:String;

        public var _speed:Number;

        public var _startTime:int;

        public var _weightPercentLoaded:Number;

        public var url:flash.net.URLRequest;

        public var errorEvent:flash.events.ErrorEvent;

        public var weight:int=1;

        public var _bytesRemaining:int=10000000;

        public var _addedTime:int;

        public var _latency:Number;

        public var propertyParsingErrors:Array;

        public var preventCache:Boolean;

        public var _responseTime:Number;

        public var specificAvailableProps:Array;

        public var _uid:String;

        public var _priority:int=0;

        public var maxTries:int=3;

        public var _bytesLoaded:int=0;

        public var _type:String;

        public var _timeToDownload:Number;
    }
}
