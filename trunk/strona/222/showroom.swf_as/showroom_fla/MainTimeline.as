package showroom_fla 
{
    import adobe.utils.*;
    import caurina.transitions.*;
    import caurina.transitions.properties.*;
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    public dynamic class MainTimeline extends flash.display.MovieClip
    {
        public function MainTimeline()
        {
            super();
            addFrameScript(0, this.frame1);
            return;
        }

        public function showInfo(arg1:uint):void
        {
            this._infoShowing = true;
            this.mainTxtMc.scrollBtn.y = 10;
            this.mainTxtMc.mainTxt.y = 10;
            this.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.mainTxtMc.mainTxt.txt.htmlText = this.xmlList[arg1].largeDesc;
            var loc1:*=this.mainTxtMc.mainTxt.txt.height;
            this.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.mainTxtMc.mainTxt.txt.height = loc1;
            if (this.mainTxtMc.mainTxt.height > this.mainTxtMc.scrollBar.height) 
            {
                this.mainTxtMc.mainTxt.startY = this.mainTxtMc.mainTxt.y;
                this.mainTxtMc.mainTxt.startX = this.mainTxtMc.mainTxt.x;
                this.mainTxtMc.scrollBtn.visible = true;
                this.mainTxtMc.scrollBar.visible = true;
                this.mainTxtMc.scrollBtn.buttonMode = true;
                this._sbStartY = this.mainTxtMc.scrollBtn.y;
                this.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.scrollBtnOver, false, 0, true);
                this.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.scrollBtnOut, false, 0, true);
                this.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler, false, 0, true);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover, false, 0, true);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll, false, 0, true);
                stage.addEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll, false, 0, true);
            }
            else 
            {
                this.mainTxtMc.scrollBtn.visible = false;
                this.mainTxtMc.scrollBar.visible = false;
                this.mainTxtMc.scrollBtn.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
                stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
            }
            this.mainTxtMc.alpha = 0;
            this.mainTxtMc.visible = true;
            this.txtBg.alpha = 0;
            this.txtBg.visible = true;
            caurina.transitions.Tweener.addTween(this.txtBg, {"alpha":this.xml.settings.@bgAlpha, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainTxtMc, {"alpha":1, "time":0.5, "transition":"easeOutExpo"});
            this.imagesHolder.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            this.txtBg.buttonMode = true;
            this.txtBg.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.hideInfo, false, 0, true);
            return;
        }

        public function thumbLoaded(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=null;
            if (!this.thisIsClosing) 
            {
                if (this.contentType != "image") 
                {
                    loc1 = arg1.currentTarget.content;
                }
                else 
                {
                    loc1 = arg1.currentTarget.content as flash.display.Bitmap;
                    loc1.smoothing = true;
                }
                this.thumbLoader.unload();
                loc2 = new imageItem();
                loc2.alpha = 0;
                loc2.name = "thumb" + this.thumbCount;
                loc2.id = this.thumbCount;
                loc2.clickOption = this.xmlList[this.thumbCount].src.@clickOption;
                loc2.addChild(loc1);
                if (this.xmlList[this.thumbCount].largeDesc != "") 
                {
                    loc2.buttonMode = true;
                    loc2.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbReleased);
                }
                loc2.x = this.thumbX;
                this.imagesHolder.addChild(loc2);
                caurina.transitions.Tweener.addTween(loc2, {"alpha":1, "time":3, "transition":"easeOutExpo"});
                fl.transitions.TransitionManager.start(loc2, {"type":fl.transitions.Wipe, "direction":fl.transitions.Transition.IN, "duration":1, "easing":fl.transitions.easing.Strong.easeOut});
                this.thumbX = this.thumbX + loc1.width + 5;
                if (this.thumbCount < (this.xmlList.length() - 1)) 
                {
                    var loc3:*;
                    var loc4:*=((loc3 = this).thumbCount + 1);
                    loc3.thumbCount = loc4;
                    this.loadThumbnails();
                }
                else 
                {
                    this.thumbLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.thumbLoaded);
                    this.thumbLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
                }
                if (this.thumbCount == 1) 
                {
                    if (this.imageMaxHeight == 0) 
                    {
                        this.imagesHolder.height = stage.stageHeight - 95;
                        this.imagesHolder.scaleX = this.imagesHolder.scaleY;
                    }
                    else if (stage.stageHeight - 85 <= this.imageMaxHeight + 10) 
                    {
                        this.imagesHolder.height = stage.stageHeight - 95;
                        this.imagesHolder.scaleX = this.imagesHolder.scaleY;
                    }
                    else 
                    {
                        this.imagesHolder.height = this.imageMaxHeight;
                        this.imagesHolder.scaleX = this.imagesHolder.scaleY;
                    }
                }
            }
            return;
        }

        public function scrollBtnOut(arg1:flash.events.MouseEvent):void
        {
            if (!this._scrolling) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget.over, {"scaleY":0, "time":0.5, "transition":"easeOutExpo"});
            }
            return;
        }

        public function scrollHandler(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = true;
            var loc1:*=this.mainTxtMc.scrollBtn.x;
            var loc2:*=this.mainTxtMc.scrollBar.height - this.mainTxtMc.scrollBtn.height + this._sbStartY - 10;
            var loc3:*=new flash.geom.Rectangle(loc1, this._sbStartY, 0, loc2);
            this.mainTxtMc.scrollBtn.startDrag(false, loc3);
            return;
        }

        public function thumbSliderHandler(arg1:flash.events.MouseEvent):void
        {
            this.imagesHolder.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler);
            this.imagesHolder.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover);
            this.imagesHolder.addEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            return;
        }

        public function removeFromStage():void
        {
            this.thisIsClosing = true;
            this.cssloader = null;
            this.thumbLoader = null;
            this.scrollTimer = null;
            this.imagesHolder.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
            stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
            if (this._infoShowing) 
            {
                caurina.transitions.Tweener.addTween(this.mainTxtMc, {"alpha":0, "time":0.5, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.txtBg, {"alpha":0, "time":0.5, "transition":"easeOutExpo"});
            }
            caurina.transitions.Tweener.addTween(this.imagesHolder, {"x":stage.stageWidth + 200, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainBg, {"width":0, "time":1, "delay":0.4, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
            return;
        }

        public function onMouseScroll(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=arg1.delta > 0 ? 1 : -1;
            if (this.mainTxtMc.scrollBtn.y >= this._sbStartY) 
            {
                this.mainTxtMc.scrollBtn.y = this.mainTxtMc.scrollBtn.y - loc1 * this._mouseScrollRatio * this._mouseScrollSpeed;
                if (this.mainTxtMc.scrollBtn.y < this._sbStartY) 
                {
                    this.mainTxtMc.scrollBtn.y = this._sbStartY;
                }
                else if (this.mainTxtMc.scrollBtn.y > this._sbStartY + this.mainTxtMc.scrollBar.height - this.mainTxtMc.scrollBtn.height) 
                {
                    this.mainTxtMc.scrollBtn.y = this._sbStartY + this.mainTxtMc.scrollBar.height - this.mainTxtMc.scrollBtn.height;
                }
            }
            return;
        }

        public function removedFromStage():void
        {
            flash.display.MovieClip(stage.getChildAt(0)).loadSWF(flash.display.MovieClip(stage.getChildAt(0)).curModule);
            return;
        }

        public function loadThumbnails():void
        {
            if (this.xmlList[this.thumbCount].src.split(".")[1] != "swf") 
            {
                this.contentType = "image";
            }
            else 
            {
                this.contentType = "swf";
            }
            this.thumbLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.thumbLoaded, false, 0, true);
            this.thumbLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.thumbLoader.load(new flash.net.URLRequest(this.xmlList[this.thumbCount].src));
            return;
        }

        function frame1():*
        {
            caurina.transitions.properties.ColorShortcuts.init();
            caurina.transitions.properties.CurveModifiers.init();
            this.transArray = [fl.transitions.Blinds, fl.transitions.Fade, fl.transitions.Fly, fl.transitions.Iris, fl.transitions.Photo, fl.transitions.PixelDissolve, fl.transitions.Rotate, fl.transitions.Squeeze, fl.transitions.Wipe, fl.transitions.Zoom];
            flash.system.Security.allowDomain("www.youtube.com");
            this.mainBg.visible = false;
            this.mainTxtMc.visible = false;
            this.txtBg.visible = false;
            this.thisIsClosing = false;
            this.thumbLoader = new flash.display.Loader();
            this.imageMaxHeight = 600;
            this.thumbCount = 0;
            this.thumbX = 5;
            this.scrollTimer = new flash.utils.Timer(300, 1);
            this.scrollTimer.addEventListener(flash.events.TimerEvent.TIMER, this.scrollTimerHandler);
            this._scrollEase = 5;
            this._mouseScrollSpeed = 5;
            this._scrolling = false;
            this.mainTxtMc.scrollBtn.over.scaleY = 0;
            this._infoShowing = false;
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            return;
        }

        public function onCSSFileLoaded(arg1:flash.events.Event):void
        {
            this.cssloader.removeEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded);
            var loc1:*=new flash.text.StyleSheet();
            loc1.parseCSS(this.cssloader.data);
            this.mainTxtMc.mainTxt.txt.styleSheet = loc1;
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
            return;
        }

        public function calcScroll(arg1:flash.events.Event):void
        {
            var loc1:*=(this.mainTxtMc.mainTxt.height - this.mainTxtMc.scrollBar.height) / (this.mainTxtMc.scrollBar.height - this.mainTxtMc.scrollBtn.height);
            var loc2:*=(-this.mainTxtMc.scrollBtn.y + this.mainTxtMc.mainTxt.startY) * loc1 + this.mainTxtMc.mainTxt.startY;
            this.mainTxtMc.mainTxt.y = this.mainTxtMc.mainTxt.y + Math.round((loc2 - this.mainTxtMc.mainTxt.y) / this._scrollEase);
            this._mouseScrollRatio = this.mainTxtMc.mainTxt.height / this.mainTxtMc.scrollBar.height;
            return;
        }

        public function thumbSliderRemover(arg1:flash.events.MouseEvent):void
        {
            this.imagesHolder.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover);
            this.imagesHolder.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            this.imagesHolder.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler);
            return;
        }

        public function init(arg1:flash.events.Event):void
        {
            this.removeEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            stage.align = flash.display.StageAlign.TOP_LEFT;
            stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
            stage.addEventListener(flash.events.Event.RESIZE, this.resizeHandler, false, 0, true);
            this.loadCSS();
            if (flash.display.MovieClip(stage.getChildAt(0)).curXML) 
            {
                this.xmlLoader.load(new flash.net.URLRequest(flash.display.MovieClip(stage.getChildAt(0)).curXML));
            }
            else 
            {
                this.xmlLoader.load(new flash.net.URLRequest("xml/showroom.xml"));
            }
            return;
        }

        public function hideInfo(arg1:flash.events.MouseEvent):void
        {
            var e:flash.events.MouseEvent;

            var loc1:*;
            e = arg1;
            this._infoShowing = false;
            caurina.transitions.Tweener.addTween(this.mainTxtMc, {"alpha":0, "time":0.5, "transition":"easeOutExpo", "onComplete":function ():*
            {
                mainTxtMc.visible = false;
                return;
            }})
            caurina.transitions.Tweener.addTween(this.txtBg, {"alpha":0, "time":0.5, "transition":"easeOutExpo", "onComplete":function ():*
            {
                txtBg.visible = false;
                return;
            }})
            this.txtBg.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.hideInfo);
            this.imagesHolder.addEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame, false, 0, true);
            return;
        }

        public function scrollHandlerRemover(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = false;
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.over, {"scaleY":0, "time":0.5, "transition":"easeOutExpo"});
            this.mainTxtMc.scrollBtn.stopDrag();
            return;
        }

        public function launch():void
        {
            if (this.imageMaxHeight == 0) 
            {
                this.mainBg.height = stage.stageHeight - 85;
            }
            else if (stage.stageHeight - 85 <= this.imageMaxHeight + 10) 
            {
                this.mainBg.height = stage.stageHeight - 85;
            }
            else 
            {
                this.mainBg.height = this.imageMaxHeight + 10;
            }
            this.mainBg.width = 0;
            this.mainBg.y = (stage.stageHeight - this.mainBg.height) / 2 + 18;
            this.mainBg.visible = true;
            caurina.transitions.Tweener.addTween(this.mainBg, {"width":stage.stageWidth, "time":0.5, "transition":"easeOutExpo"});
            this.imagesHolder.y = this.mainBg.y + 5;
            this.imagesHolder.x = 0;
            this.loadThumbnails();
            this.imagesHolder.addEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame, false, 0, true);
            return;
        }

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xmlLoader.close();
            this.xmlLoader = null;
            this.xml = new XML(arg1.target.data);
            this.xmlList = this.xml.image;
            this.imageMaxHeight = Math.round(Number(this.xml.settings.@imageMaxHeight));
            this.scrollSpeed = Number(this.xml.settings.@scrollSpeed);
            caurina.transitions.Tweener.addTween(this.mainBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.txtBg, {"_color":"0x" + this.xml.settings.@bgColor, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.textBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.over, {"_color":"0x" + this.xml.settings.@scrollBtnOverColor, "alpha":this.xml.settings.@scrollBtnAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBar, {"_color":"0x" + this.xml.settings.@scrollBarColor, "alpha":this.xml.settings.@scrollBarAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.bg, {"_color":"0x" + this.xml.settings.@scrollBtnColor, "alpha":this.xml.settings.@scrollBtnAlpha, "time":0});
            this.mainTxtMc.mainTxt.mask = this.mainTxtMc.mainTxtMask;
            this.mainTxtMc.mainTxt.txt.mouseWheelEnabled = false;
            this.mainTxtMc.x = (stage.stageWidth - 500) / 2;
            this.mainTxtMc.y = (stage.stageHeight - 320) / 2 + 18;
            this.txtBg.width = stage.stageWidth;
            this.txtBg.height = stage.stageHeight;
            this.launch();
            return;
        }

        public function scrollTimerHandler(arg1:flash.events.TimerEvent):void
        {
            caurina.transitions.Tweener.addTween(this.imagesHolder, {"alpha":1, "time":1, "transition":"easeOutExpo"});
            this.imagesHolder.addEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame, false, 0, true);
            return;
        }

        public function thumbReleased(arg1:flash.events.MouseEvent):void
        {
            if (arg1.currentTarget.clickOption != "text") 
            {
                flash.net.navigateToURL(new flash.net.URLRequest(this.xmlList[arg1.currentTarget.id].largeDesc));
            }
            else 
            {
                this.showInfo(arg1.currentTarget.id);
            }
            return;
        }

        public function thumbSliderEnterFrame(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=undefined;
            var loc3:*=undefined;
            if (this._infoShowing) 
            {
                this.imagesHolder.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            }
            if (this.imagesHolder.width > stage.stageWidth) 
            {
                loc1 = this.imagesHolder.width;
                loc2 = this.imagesHolder.width - stage.stageWidth;
                loc3 = stage.stageWidth / 2 - mouseX;
                this.imagesHolder.x = Math.round(this.imagesHolder.x + loc3 / 30 * this.scrollSpeed);
                if (this.imagesHolder.x > 0) 
                {
                    this.imagesHolder.x = 0;
                }
                else if (this.imagesHolder.x + loc1 < stage.stageWidth - 10) 
                {
                    this.imagesHolder.x = -loc2 - 10;
                }
            }
            return;
        }

        public function loadCSS():void
        {
            var loc1:*=new flash.net.URLRequest("styleCSS.css");
            this.cssloader = new flash.net.URLLoader();
            this.cssloader.addEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded, false, 0, true);
            this.cssloader.load(loc1);
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            this.imagesHolder.alpha = 0;
            this.imagesHolder.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            this.scrollTimer.stop();
            if (this.imageMaxHeight == 0) 
            {
                this.mainBg.height = stage.stageHeight - 85;
                this.mainBg.y = (stage.stageHeight - (stage.stageHeight - 85)) / 2 + 18;
                this.imagesHolder.height = stage.stageHeight - 95;
                this.imagesHolder.scaleX = this.imagesHolder.scaleY;
            }
            else if (stage.stageHeight - 85 <= this.imageMaxHeight + 10) 
            {
                this.mainBg.height = stage.stageHeight - 85;
                this.mainBg.y = (stage.stageHeight - (stage.stageHeight - 85)) / 2 + 18;
                this.imagesHolder.height = stage.stageHeight - 95;
                this.imagesHolder.scaleX = this.imagesHolder.scaleY;
            }
            else 
            {
                this.mainBg.height = this.imageMaxHeight + 10;
                this.mainBg.y = (stage.stageHeight - (this.imageMaxHeight + 10)) / 2 + 18;
                this.imagesHolder.height = this.imageMaxHeight;
                this.imagesHolder.scaleX = this.imagesHolder.scaleY;
            }
            this.mainBg.width = stage.stageWidth;
            this.imagesHolder.y = this.mainBg.y + 5;
            this.mainTxtMc.x = (stage.stageWidth - 500) / 2;
            this.mainTxtMc.y = (stage.stageHeight - 320) / 2 + 18;
            this.txtBg.width = stage.stageWidth;
            this.txtBg.height = stage.stageHeight;
            this.scrollTimer.start();
            return;
        }

        public function scrollBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.over, {"scaleY":1, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public var scrollSpeed:Number;

        public var scrollTimer:flash.utils.Timer;

        public var thumbLoader:flash.display.Loader;

        public var imageMaxHeight:uint;

        public var transArray:Array;

        public var xml:XML;

        public var thisIsClosing:Boolean;

        public var _mouseScrollRatio:Number;

        public var thumbCount:uint;

        public var xmlList:XMLList;

        public var imagesHolder:flash.display.MovieClip;

        public var _sbStartY:Number;

        public var thumbX:Number;

        public var contentType:String;

        public var mainTxtMc:flash.display.MovieClip;

        public var txtBg:flash.display.MovieClip;

        public var xmlLoader:flash.net.URLLoader;

        public var _scrolling:Boolean;

        public var _infoShowing:Boolean;

        public var _scrollEase:uint;

        public var _mouseScrollSpeed:uint;

        public var cssloader:flash.net.URLLoader;

        public var mainBg:flash.display.MovieClip;
    }
}
