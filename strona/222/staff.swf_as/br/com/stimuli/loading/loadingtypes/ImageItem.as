package br.com.stimuli.loading.loadingtypes 
{
    import br.com.stimuli.loading.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    
    public class ImageItem extends br.com.stimuli.loading.loadingtypes.LoadingItem
    {
        public function ImageItem(arg1:flash.net.URLRequest, arg2:String, arg3:String)
        {
            specificAvailableProps = [br.com.stimuli.loading.BulkLoader.CONTEXT];
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

        public override function load():void
        {
            var loc1:*;
            super.load();
            this.loader = new flash.display.Loader();
            this.loader.contentLoaderInfo.addEventListener(flash.events.ProgressEvent.PROGRESS, onProgressHandler, false, 0, true);
            this.loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.onCompleteHandler, false, 0, true);
            this.loader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.onInitHandler, false, 0, true);
            this.loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.onErrorHandler, false, 100, true);
            this.loader.contentLoaderInfo.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onSecurityErrorHandler, false, 0, true);
            this.loader.contentLoaderInfo.addEventListener(flash.events.Event.OPEN, onStartedHandler, false, 0, true);
            this.loader.contentLoaderInfo.addEventListener(flash.events.HTTPStatusEvent.HTTP_STATUS, super.onHttpStatusHandler, false, 0, true);
            try 
            {
                this.loader.load(url, _context);
            }
            catch (e:SecurityError)
            {
                onSecurityErrorHandler(_createErrorEvent(e));
            }
            return;
        }

        public override function destroy():void
        {
            this.stop();
            this.cleanListeners();
            _content = null;
            this.loader = null;
            return;
        }

        public override function _parseOptions(arg1:Object):Array
        {
            _context = arg1[br.com.stimuli.loading.BulkLoader.CONTEXT] || null;
            return super._parseOptions(arg1);
        }

        public function getDefinitionByName(arg1:String):Object
        {
            if (this.loader.contentLoaderInfo.applicationDomain.hasDefinition(arg1)) 
            {
                return this.loader.contentLoaderInfo.applicationDomain.getDefinition(arg1);
            }
            return null;
        }

        public override function isImage():Boolean
        {
            return type == br.com.stimuli.loading.BulkLoader.TYPE_IMAGE;
        }

        public override function onCompleteHandler(arg1:flash.events.Event):void
        {
            var evt:flash.events.Event;

            var loc1:*;
            evt = arg1;
            try 
            {
                _content = this.loader.content;
                super.onCompleteHandler(evt);
            }
            catch (e:SecurityError)
            {
                _content = loader;
                super.onCompleteHandler(evt);
            }
            return;
        }

        public override function cleanListeners():void
        {
            var loc1:*=null;
            if (this.loader) 
            {
                loc1 = this.loader.contentLoaderInfo;
                loc1.removeEventListener(flash.events.ProgressEvent.PROGRESS, onProgressHandler, false);
                loc1.removeEventListener(flash.events.Event.COMPLETE, this.onCompleteHandler, false);
                loc1.removeEventListener(flash.events.Event.INIT, this.onInitHandler, false);
                loc1.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.onErrorHandler, false);
                loc1.removeEventListener(br.com.stimuli.loading.BulkLoader.OPEN, onStartedHandler, false);
                loc1.removeEventListener(flash.events.HTTPStatusEvent.HTTP_STATUS, super.onHttpStatusHandler, false);
            }
            return;
        }

        public override function isSWF():Boolean
        {
            return type == br.com.stimuli.loading.BulkLoader.TYPE_MOVIECLIP;
        }

        public function _onHttpStatusHandler(arg1:flash.events.HTTPStatusEvent):void
        {
            _httpStatus = arg1.status;
            dispatchEvent(arg1);
            return;
        }

        public function onInitHandler(arg1:flash.events.Event):void
        {
            dispatchEvent(arg1);
            return;
        }

        public var loader:flash.display.Loader;
    }
}
