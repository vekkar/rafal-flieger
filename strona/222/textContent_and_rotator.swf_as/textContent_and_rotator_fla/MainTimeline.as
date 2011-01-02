package textContent_and_rotator_fla 
{
    import adobe.utils.*;
    import br.com.stimuli.loading.*;
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

        public function calcScroll(arg1:flash.events.Event):void
        {
            var loc1:*=(this.mainTxtMc.mainTxt.height - this.mainTxtMc.scrollBar.height) / (this.mainTxtMc.scrollBar.height - this.mainTxtMc.scrollBtn.height);
            var loc2:*=(-this.mainTxtMc.scrollBtn.y + this.mainTxtMc.mainTxt.startY) * loc1 + this.mainTxtMc.mainTxt.startY;
            this.mainTxtMc.mainTxt.y = this.mainTxtMc.mainTxt.y + Math.round((loc2 - this.mainTxtMc.mainTxt.y) / this._scrollEase);
            this._mouseScrollRatio = this.mainTxtMc.mainTxt.height / this.mainTxtMc.scrollBar.height;
            return;
        }

        public function imageLoaded(arg1:flash.events.Event):void
        {
            var loc3:*=undefined;
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=undefined;
            var loc7:*=NaN;
            var loc8:*=undefined;
            caurina.transitions.Tweener.addTween(this.imagesHolder.preloader, {"width":0, "time":0.5, "transition":"easeOutExpo"});
            this.swapImageHolders();
            if (this.curImageHolder.numChildren != 0) 
            {
                loc3 = this.curImageHolder.getChildAt(0);
                this.curImageHolder.removeChild(loc3);
                loc3 = null;
            }
            if (this.xmlList[this.curImage].path.split(".")[1] != "swf") 
            {
                (loc5 = this.imageLoader.content as flash.display.Bitmap).smoothing = true;
                this.curImageHolder.addChildAt(loc5, 0);
            }
            else 
            {
                loc4 = this.imageLoader.content as flash.display.MovieClip;
                this.curImageHolder.addChildAt(loc4, 0);
            }
            caurina.transitions.Tweener.removeTweens(this.curImageHolder, "alpha");
            caurina.transitions.Tweener.addTween(this.lastImageHolder, {"alpha":0, "time":3, "transition":"strongEaseOut"});
            this.curImageHolder.alpha = 1;
            this.imagesHolder.myMask.cacheAsBitmap = true;
            this.curImageHolder.cacheAsBitmap = true;
            this.curImageHolder.mask = this.imagesHolder.myMask;
            this.imagesHolder.myMask.visible = true;
            var loc1:*=this.imagesHolder.myMask.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                (loc6 = this.imagesHolder.myMask.getChildAt(loc2)).cacheAsBitmap = true;
                var loc9:*;
                loc6.alpha = loc9 = 0;
                loc6.scaleY = loc9 = loc9;
                loc6.scaleX = loc9;
                caurina.transitions.Tweener.addTween(loc6, {"scaleY":1.1, "scaleX":1.1, "delay":loc2 * 0.02, "time":1.5, "transition":"strongEaseOut"});
                caurina.transitions.Tweener.addTween(loc6, {"alpha":1, "time":1.5, "delay":0.2, "transition":"strongEaseOut"});
                caurina.transitions.Tweener.addTween(loc6, {"_Blur_blurX":10, "_Blur_blurY":10, "_Blur_quality":2, "time":0.7, "transition":"linear"});
                caurina.transitions.Tweener.addTween(loc6, {"_Blur_blurX":0, "_Blur_blurY":0, "time":0.7, "delay":0.7, "transition":"linear"});
                ++loc2;
            }
            this.imagesHolder.imageTitleMc.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.imagesHolder.imageTitleMc.txt.htmlText = this.xmlList[this.curImage].title;
            this.imagesHolder.imageTitleMc.bg.width = this.imagesHolder.imageTitleMc.txt.textWidth + 10;
            this.imagesHolder.imageTitleMc.bg.height = this.imagesHolder.imageTitleMc.txt.textHeight + 10;
            this.imagesHolder.imageTitleMc.txt.x = (this.imagesHolder.imageTitleMc.bg.width - this.imagesHolder.imageTitleMc.txt.textWidth) / 2 - 2;
            this.imagesHolder.imageTitleMc.txt.y = (this.imagesHolder.imageTitleMc.bg.height - this.imagesHolder.imageTitleMc.txt.textHeight) / 2;
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc.bg, {"_color":"0x" + this.xmlList[this.curImage].title.@bgColour, "alpha":this.xmlList[this.curImage].title.@bgAlpha, "time":0});
            if (this.xmlList[this.curImage].description == "") 
            {
                this.imagesHolder.imageDescMc.visible = false;
            }
            else 
            {
                this.imagesHolder.imageDescMc.visible = true;
                this.imagesHolder.imageDescMc.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
                this.imagesHolder.imageDescMc.txt.width = this.xmlList[this.curImage].description.@txtWidth;
                this.imagesHolder.imageDescMc.txt.htmlText = this.xmlList[this.curImage].description;
                this.imagesHolder.imageDescMc.bg.width = this.imagesHolder.imageDescMc.txt.textWidth + 20;
                this.imagesHolder.imageDescMc.bg.height = this.imagesHolder.imageDescMc.txt.textHeight + 10;
                this.imagesHolder.imageDescMc.txt.x = (this.imagesHolder.imageDescMc.bg.width - this.imagesHolder.imageDescMc.txt.textWidth) / 2 - 2;
                this.imagesHolder.imageDescMc.txt.y = (this.imagesHolder.imageDescMc.bg.height - this.imagesHolder.imageDescMc.txt.textHeight) / 2 - 2;
                caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc.bg, {"_color":"0x" + this.xmlList[this.curImage].description.@bgColour, "alpha":this.xmlList[this.curImage].description.@bgAlpha, "time":0});
            }
            this.imagesHolder.imageTitleMc.y = this.xmlList[this.curImage].title.@Ypos;
            this.imagesHolder.imageDescMc.y = this.imagesHolder.imageTitleMc.y + this.imagesHolder.imageTitleMc.height + 5;
            this.imagesHolder.imageDescMc.x = loc9 = this.imageWidth * 2;
            this.imagesHolder.imageTitleMc.x = loc9;
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"x":this.xmlList[this.curImage].title.@Xpos, "alpha":1, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"_Blur_blurX":150, "_Blur_quality":2, "time":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"_Blur_blurX":0, "time":0.2, "delay":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"x":this.xmlList[this.curImage].title.@Xpos, "alpha":1, "time":1, "delay":0.2, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"_Blur_blurX":150, "_Blur_quality":2, "delay":0.2, "time":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"_Blur_blurX":0, "time":0.2, "delay":0.2, "delay":0.2, "transition":"linear"});
            if (this.isRotating && this.numImages > 1) 
            {
                this.rotatorDelay = Number(this.xmlList[this.curImage].path.@slideShowDelay * 1000);
                this.rotatorTimer = new flash.utils.Timer(this.rotatorDelay, 1);
                this.rotatorTimer.addEventListener(flash.events.TimerEvent.TIMER, this.rotatorTimerHandler, false, 0, true);
                this.rotatorTimer.start();
                this.startTime = flash.utils.getTimer();
                this.imagesHolder.preloader.addEventListener(flash.events.Event.ENTER_FRAME, this.countDown, false, 0, true);
            }
            if (this.xmlList[this.curImage].text != "") 
            {
                this.mainTxtMc.scrollBtn.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
                stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
                this.mainTxtMc.scrollBtn.visible = false;
                this.mainTxtMc.scrollBar.visible = false;
                this.mainTxtMc.scrollBtn.y = 0;
                this.mainTxtMc.mainTxt.y = 0;
                this.mainTxtMc.mainTxt.startY = this.mainTxtMc.mainTxt.y;
                this.mainTxtMc.mainTxt.startX = this.mainTxtMc.mainTxt.x;
                this.mainTxtMc.mainTxtMask.width = this.imageWidth - 40;
                this.mainTxtMc.mainTxtMask.height = stage.stageHeight - (this.imageHeight + 115);
                this.mainTxtMc.mainTxt.txt.width = this.imageWidth - 40;
                this.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
                this.mainTxtMc.mainTxt.txt.htmlText = this.xmlList[this.curImage].text;
                loc7 = this.mainTxtMc.mainTxt.txt.height;
                this.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
                this.mainTxtMc.mainTxt.txt.height = loc7;
                this.mainTxtMc.scrollBar.x = this.imageWidth - 20;
                this.mainTxtMc.scrollBar.height = stage.stageHeight - (this.imageHeight + 115);
                this.mainTxtMc.scrollBtn.x = this.imageWidth - 23;
                this.setTextScroll();
                this.mainTxtMc.visible = true;
                loc8 = this.transArray[this.xmlList[this.curImage].text.@transition];
                fl.transitions.TransitionManager.start(this.mainTxtMc, {"type":loc8, "direction":fl.transitions.Transition.IN, "duration":1, "easing":fl.transitions.easing.Strong.easeOut});
            }
            return;
        }

        public function toggleRotatorPause(arg1:flash.events.MouseEvent):void
        {
            if (this.isRotating) 
            {
                this.rotatorTimer.stop();
                this.imagesHolder.preloader.removeEventListener(flash.events.Event.ENTER_FRAME, this.countDown);
                this.imagesHolder.preloader.width = 0;
                this.isRotating = false;
                arg1.currentTarget.playIcon.alpha = 1;
                arg1.currentTarget.pauseIcon.alpha = 0;
            }
            else 
            {
                this.isRotating = true;
                this.rotateForward = true;
                arg1.currentTarget.playIcon.alpha = 0;
                arg1.currentTarget.pauseIcon.alpha = 1;
                this.rotatorDelay = Number(this.xmlList[this.curImage].path.@slideShowDelay * 1000);
                this.rotatorTimer = new flash.utils.Timer(this.rotatorDelay, 1);
                this.rotatorTimer.addEventListener(flash.events.TimerEvent.TIMER, this.rotatorTimerHandler, false, 0, true);
                this.rotatorTimer.start();
                this.startTime = flash.utils.getTimer();
                this.imagesHolder.preloader.addEventListener(flash.events.Event.ENTER_FRAME, this.countDown, false, 0, true);
            }
            return;
        }

        public function nextHandler(arg1:flash.events.MouseEvent):void
        {
            this.rotateForward = true;
            this.rotatorTimer.stop();
            this.imagesHolder.preloader.removeEventListener(flash.events.Event.ENTER_FRAME, this.countDown);
            this.imagesHolder.preloader.width = 0;
            this.isRotating = false;
            this.rotatorControls.playBtn.playIcon.alpha = 1;
            this.rotatorControls.playBtn.pauseIcon.alpha = 0;
            this.removeDesc();
            return;
        }

        public function setTextScroll():void
        {
            if (this.mainTxtMc.mainTxt.height > this.mainTxtMc.scrollBar.height) 
            {
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

        public function rotatorTimerHandler(arg1:flash.events.TimerEvent):void
        {
            this.removeDesc();
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
                this.xmlLoader.load(new flash.net.URLRequest("xml/contentWindow.xml"));
            }
            return;
        }

        public function onCSSFileLoaded(arg1:flash.events.Event):void
        {
            this.cssloader.removeEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded);
            var loc1:*=new flash.text.StyleSheet();
            loc1.parseCSS(this.cssloader.data);
            this.imagesHolder.imageDescMc.txt.styleSheet = loc1;
            this.mainTxtMc.mainTxt.txt.styleSheet = loc1;
            return;
        }

        public function imageLoading(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=arg1.bytesLoaded / arg1.bytesTotal * 100;
            this.imagesHolder.preloader.width = loc1 * this.imageWidth / 100;
            return;
        }

        public function removedFromStage():void
        {
            flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = false;
            flash.display.MovieClip(stage.getChildAt(0)).loadSWF(flash.display.MovieClip(stage.getChildAt(0)).curModule);
            return;
        }

        function frame1():*
        {
            caurina.transitions.properties.ColorShortcuts.init();
            caurina.transitions.properties.CurveModifiers.init();
            caurina.transitions.properties.FilterShortcuts.init();
            this.bottomBg.visible = false;
            this.bottomBg.height = 0;
            this.leftBg.visible = false;
            this.leftBg.width = 0;
            this.mainTxtMc.visible = false;
            this.imagesHolder.myMask.visible = false;
            this.imagesHolder.visible = false;
            this.imagesHolder.imageDescMc.alpha = 0;
            this.imagesHolder.imageTitleMc.alpha = 0;
            this.imagesHolder.preloader.alpha = 0;
            this.imagesHolder.preloader.width = 0;
            this.rotatorControls.visible = false;
            this.rotatorControls.playBtn.playIcon.alpha = 0;
            this.rotatorControls.playBtn.pauseIcon.alpha = 1;
            this.mainTxtMc.scrollBtn.over.scaleY = 0;
            this.mainLoader = new br.com.stimuli.loading.BulkLoader("mainLoader");
            this.curImage = 0;
            this.curImageHolder = this.imagesHolder.imageHolder1;
            this.lastImageHolder = this.imagesHolder.imageHolder2;
            this.isRotating = true;
            this.rotateForward = true;
            this._rotatorHasStarted = false;
            this._scrollEase = 5;
            this._mouseScrollSpeed = 10;
            this._scrolling = false;
            this.setScrollTimer = new flash.utils.Timer(1000, 1);
            this.setScrollTimer.addEventListener(flash.events.TimerEvent.TIMER, this.setScrollTimerHandler);
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            return;
        }

        public function removeFromStage():void
        {
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
            stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
            stage.removeEventListener(flash.events.Event.RESIZE, this.resizeHandler);
            this.xmlLoader = null;
            this.cssloader = null;
            this.mainLoader = null;
            this.rotatorTimer.stop();
            this.rotatorTimer = null;
            this.imagesHolder.preloader.removeEventListener(flash.events.Event.ENTER_FRAME, this.countDown);
            caurina.transitions.Tweener.addTween(this.imagesHolder, {"x":stage.stageWidth + 500, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":-200, "time":1, "delay":0.2, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainTxtMc, {"alpha":0, "time":1, "delay":0.4, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.leftBg, {"width":0, "time":1, "delay":0.6, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.bottomBg, {"height":0, "time":1, "delay":0.8, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
            return;
        }

        public function scrollHandler(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = true;
            var loc1:*=this.mainTxtMc.scrollBtn.x;
            var loc2:*=this.mainTxtMc.scrollBar.height - this.mainTxtMc.scrollBtn.height + this._sbStartY;
            var loc3:*=new flash.geom.Rectangle(loc1, this._sbStartY, 0, loc2);
            this.mainTxtMc.scrollBtn.startDrag(false, loc3);
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
            return;
        }

        public function swapImageHolders():void
        {
            this.lastImageHolder = this.curImageHolder;
            if (this.curImageHolder != this.imagesHolder.imageHolder1) 
            {
                this.curImageHolder = this.imagesHolder.imageHolder1;
            }
            else 
            {
                this.curImageHolder = this.imagesHolder.imageHolder2;
            }
            this.imagesHolder.swapChildren(this.imagesHolder.getChildAt(0), this.imagesHolder.getChildAt(1));
            return;
        }

        public function startRotator():void
        {
            this.imagesHolder.preloader.height = this.imageHeight + 10;
            var loc2:*;
            this.imagesHolder.preloader.y = loc2 = -5;
            this.imagesHolder.preloader.x = loc2;
            this.mainTxtMc.x = (stage.stageWidth - (this.imageWidth + 10)) / 2 + 10;
            this.mainTxtMc.y = this.imageHeight + 85;
            this.mainTxtMc.scrollBar.y = 0;
            this.mainTxtMc.scrollBtn.y = 0;
            this.mainTxtMc.mainTxt.y = 0;
            this.mainTxtMc.mainTxtMask.y = 0;
            this.leftBg.height = this.imageHeight + 10;
            this.leftBg.y = 65;
            this.leftBg.visible = true;
            var loc1:*=(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth + 5;
            caurina.transitions.Tweener.addTween(this.leftBg, {"width":loc1, "time":1, "transition":"easeOutExpo"});
            this.bottomBg.width = this.imageWidth + 10;
            this.bottomBg.y = stage.stageHeight;
            this.bottomBg.x = (stage.stageWidth - this.bottomBg.width) / 2;
            this.bottomBg.visible = true;
            caurina.transitions.Tweener.addTween(this.bottomBg, {"height":stage.stageHeight - 65, "time":1, "transition":"easeOutExpo", "onComplete":this.rotateImage});
            this.imagesHolder.x = this.bottomBg.x + 5;
            this.imagesHolder.y = 70;
            this.imagesHolder.visible = true;
            this.imageLoader = new flash.display.Loader();
            this.transArray = [fl.transitions.Blinds, fl.transitions.Fade, fl.transitions.Fly, fl.transitions.Iris, fl.transitions.Photo, fl.transitions.PixelDissolve, fl.transitions.Rotate, fl.transitions.Squeeze, fl.transitions.Wipe, fl.transitions.Zoom];
            if (this.numImages > 1) 
            {
                this.rotatorControls.x = -(this.rotatorControls.width + 100);
                this.rotatorControls.y = this.leftBg.y + this.leftBg.height - 25;
                this.rotatorControls.visible = true;
                if (loc1 > this.imageWidth + 85) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.bottomBg.width) / 2 - 75, "y":this.leftBg.y + this.leftBg.height - 25, "time":1, "transition":"easeOutExpo"});
                }
                else 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.bottomBg.width) / 2 + 5, "y":this.leftBg.y + this.leftBg.height - 25, "time":1, "transition":"easeOutExpo"});
                }
                this.rotatorControls.buttonMode = true;
                this.rotatorControls.playBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                this.rotatorControls.playBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                this.rotatorControls.playBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.toggleRotatorPause, false, 0, true);
                this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.previousHandler, false, 0, true);
                this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.nextHandler, false, 0, true);
            }
            return;
        }

        public function controlsBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
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

        public function previousHandler(arg1:flash.events.MouseEvent):void
        {
            this.rotateForward = false;
            this.rotatorTimer.stop();
            this.imagesHolder.preloader.removeEventListener(flash.events.Event.ENTER_FRAME, this.countDown);
            this.imagesHolder.preloader.width = 0;
            this.isRotating = false;
            this.rotatorControls.playBtn.playIcon.alpha = 1;
            this.rotatorControls.playBtn.pauseIcon.alpha = 0;
            this.removeDesc();
            return;
        }

        public function nextImage():void
        {
            if (this.rotateForward) 
            {
                if (this.curImage < (this.numImages - 1)) 
                {
                    var loc1:*;
                    var loc2:*=((loc1 = this).curImage + 1);
                    loc1.curImage = loc2;
                }
                else 
                {
                    this.curImage = 0;
                }
            }
            else if (this.curImage > 0) 
            {
                loc2 = ((loc1 = this).curImage - 1);
                loc1.curImage = loc2;
            }
            else 
            {
                this.curImage = (this.numImages - 1);
            }
            this.rotateImage();
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            var loc1:*=(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth + 5;
            caurina.transitions.Tweener.addTween(this.leftBg, {"width":loc1, "time":1, "transition":"easeOutExpo"});
            this.bottomBg.y = stage.stageHeight;
            if (this._rotatorHasStarted) 
            {
                caurina.transitions.Tweener.addTween(this.bottomBg, {"x":(stage.stageWidth - this.bottomBg.width) / 2, "height":stage.stageHeight - 65, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.bottomBg, {"x":(stage.stageWidth - (this.imageWidth + 10)) / 2, "height":stage.stageHeight - 65, "time":1, "transition":"easeOutExpo", "onComplete":this.rotateImage});
            }
            caurina.transitions.Tweener.addTween(this.imagesHolder, {"x":(stage.stageWidth - this.bottomBg.width) / 2 + 5, "time":1, "transition":"easeOutExpo"});
            if (loc1 > this.imageWidth + 85) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.bottomBg.width) / 2 - 75, "y":this.leftBg.y + this.leftBg.height - 25, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this.imageWidth + 10)) / 2 + 10, "y":this.leftBg.y + this.leftBg.height - 30, "time":1, "transition":"easeOutExpo"});
            }
            this.setScrollTimer.stop();
            this.mainTxtMc.x = (stage.stageWidth - (this.imageWidth + 10)) / 2 + 10;
            this.mainTxtMc.y = this.imageHeight + 85;
            this.mainTxtMc.scrollBtn.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
            stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
            this.mainTxtMc.scrollBtn.visible = false;
            this.mainTxtMc.scrollBar.visible = false;
            this.mainTxtMc.scrollBtn.y = 0;
            this.mainTxtMc.mainTxt.y = 0;
            this.mainTxtMc.mainTxtMask.height = stage.stageHeight - (this.imageHeight + 115);
            this.mainTxtMc.scrollBar.height = stage.stageHeight - (this.imageHeight + 115);
            this.setScrollTimer.start();
            return;
        }

        public function setScrollTimerHandler(arg1:flash.events.TimerEvent):void
        {
            this.setTextScroll();
            return;
        }

        public function removeDesc():void
        {
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"x":this.imageWidth * 2, "alpha":0, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"_Blur_blurX":150, "_Blur_quality":2, "time":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"_Blur_blurX":0, "time":0.2, "delay":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"x":this.imageWidth * 2, "alpha":0, "time":1, "delay":0.2, "transition":"easeOutExpo", "onComplete":this.nextImage});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"_Blur_blurX":150, "_Blur_quality":2, "delay":0.2, "time":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"_Blur_blurX":0, "time":0.2, "delay":0.2, "delay":0.2, "transition":"linear"});
            return;
        }

        public function scrollHandlerRemover(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = false;
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.over, {"scaleY":0, "time":0.5, "transition":"easeOutExpo"});
            this.mainTxtMc.scrollBtn.stopDrag();
            return;
        }

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xml = new XML(arg1.target.data);
            this.xmlList = this.xml.rotator.image;
            this.numImages = this.xmlList.length();
            this.imageWidth = this.xml.settings.@rotatorImageWidth;
            this.imageHeight = this.xml.settings.@rotatorImageHeight;
            this.imagesHolder.myMask.width = this.imageWidth;
            this.imagesHolder.myMask.height = this.imageHeight;
            if (this.xml.settings.@playRotator == "false") 
            {
                this.isRotating = false;
                this.rotatorControls.playBtn.playIcon.alpha = 1;
                this.rotatorControls.playBtn.pauseIcon.alpha = 0;
            }
            this.rotatorTimer = new flash.utils.Timer(1000, 1);
            caurina.transitions.Tweener.addTween(this.leftBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.bottomBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.imagesHolder.preloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.playBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.nextBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.previousBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.nextBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.playBtn.pauseIcon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.playBtn.playIcon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.previousBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            this.mainTxtMc.mainTxt.mask = this.mainTxtMc.mainTxtMask;
            this.mainTxtMc.mainTxt.txt.mouseWheelEnabled = false;
            this.startRotator();
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

        public function rotateImage():void
        {
            this._rotatorHasStarted = true;
            this.imageLoader.unload();
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.ProgressEvent.PROGRESS, this.imageLoading);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.imageLoaded);
            this.imageLoader.load(new flash.net.URLRequest(this.xmlList[this.curImage].path));
            return;
        }

        public function controlsBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0.55, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function scrollBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.over, {"scaleY":1, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function countDown(arg1:flash.events.Event):void
        {
            var loc1:*=flash.utils.getTimer();
            var loc2:*=loc1 - this.startTime;
            var loc3:*=loc2 * 100 / this.rotatorDelay;
            this.imagesHolder.preloader.width = loc3 * (this.imageWidth + 10) / 100;
            if (loc2 >= this.rotatorDelay) 
            {
                this.imagesHolder.preloader.removeEventListener(flash.events.Event.ENTER_FRAME, this.countDown);
                this.imagesHolder.preloader.width = 0;
            }
            return;
        }

        public var rotatorControls:flash.display.MovieClip;

        public var _scrolling:Boolean;

        public var curImageHolder:flash.display.MovieClip;

        public var xmlLoader:flash.net.URLLoader;

        public var _rotatorHasStarted:Boolean;

        public var xml:XML;

        public var rotatorTimer:flash.utils.Timer;

        public var _mouseScrollSpeed:uint;

        public var numImages:uint;

        public var isRotating:Boolean;

        public var transArray:Array;

        public var imageWidth:Number;

        public var leftBg:flash.display.MovieClip;

        public var setScrollTimer:flash.utils.Timer;

        public var _mouseScrollRatio:Number;

        public var imagesHolder:flash.display.MovieClip;

        public var xmlList:XMLList;

        public var _sbStartY:Number;

        public var rotateForward:Boolean;

        public var mainLoader:br.com.stimuli.loading.BulkLoader;

        public var mainTxtMc:flash.display.MovieClip;

        public var lastImageHolder:flash.display.MovieClip;

        public var imageLoader:flash.display.Loader;

        public var cssloader:flash.net.URLLoader;

        public var startTime:uint;

        public var imageHeight:Number;

        public var _scrollEase:uint;

        public var curImage:uint;

        public var bottomBg:flash.display.MovieClip;

        public var rotatorDelay:Number;
    }
}
