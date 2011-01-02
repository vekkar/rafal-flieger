package staff_fla 
{
    import adobe.utils.*;
    import br.com.stimuli.loading.*;
    import caurina.transitions.*;
    import caurina.transitions.properties.*;
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

        public function onItemProgress(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=this.thumbAll.thumbHolder.getChildByName(arg1.target.id);
            loc1.preloader.scaleX = (arg1.bytesLoaded / arg1.bytesTotal).toFixed(2);
            return;
        }

        public function addThumbsListeners():void
        {
            var loc3:*=undefined;
            var loc1:*=this.thumbAll.thumbHolder.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.thumbAll.thumbHolder.getChildAt(loc2);
                loc3.id = loc2;
                loc3.buttonMode = true;
                loc3.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbClicked, false, 0, true);
                ++loc2;
            }
            return;
        }

        public function calcScroll(arg1:flash.events.Event):void
        {
            var loc1:*=(this.mainContent.mainTxtMc.mainTxt.height - this.mainContent.mainTxtMc.scrollBar.height) / (this.mainContent.mainTxtMc.scrollBar.height - this.mainContent.mainTxtMc.scrollBtn.height);
            var loc2:*=(-this.mainContent.mainTxtMc.scrollBtn.y + this.mainContent.mainTxtMc.mainTxt.startY) * loc1 + this.mainContent.mainTxtMc.mainTxt.startY;
            this.mainContent.mainTxtMc.mainTxt.y = this.mainContent.mainTxtMc.mainTxt.y + Math.round((loc2 - this.mainContent.mainTxtMc.mainTxt.y) / this._scrollEase);
            this._mouseScrollRatio = this.mainContent.mainTxtMc.mainTxt.height / this.mainContent.mainTxtMc.scrollBar.height;
            return;
        }

        public function removedFromStage():void
        {
            flash.display.MovieClip(stage.getChildAt(0)).loadSWF(flash.display.MovieClip(stage.getChildAt(0)).curModule);
            return;
        }

        public function onPicComplete(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc4:*=undefined;
            this.mainContent.mainPicPreloader.alpha = 0;
            if (this._contentType != "image") 
            {
                loc1 = this.mainLoader.getMovieClip(arg1.target.id);
            }
            else 
            {
                loc1 = this.mainLoader.getBitmap(arg1.target.id);
            }
            this.mainContent.mainPicHolder.alpha = 0;
            if (this.mainContent.mainPicHolder.numChildren != 0) 
            {
                loc4 = this.mainContent.mainPicHolder.getChildAt(0);
                this.mainContent.mainPicHolder.removeChild(loc4);
                loc4 = null;
            }
            this.mainContent.mainPicHolder.addChild(loc1);
            this._imageWidth = loc1.width;
            this._imageHeight = loc1.height;
            var loc2:*=Number(this.staffList[this._staffIndex].textfieldWidth);
            if (loc2 == 0) 
            {
                caurina.transitions.Tweener.addTween(this.mainBg, {"height":this._imageHeight + 10, "width":loc2 + this._imageWidth + 190, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.mainBg, {"height":this._imageHeight + 10, "width":loc2 + this._imageWidth + 205, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            }
            this.mainContent.mainPicPreloader.height = this._imageHeight;
            this.mainContent.mainPicPreloader.width = this._imageWidth;
            this.curPreloaderWidth = this._imageWidth;
            this.mainContent.mainTxtMc.x = this._imageWidth + 10;
            this.mainContent.mainTxtMc.mainTxtMask.width = loc2;
            this.mainContent.mainTxtMc.mainTxtMask.height = this._imageHeight;
            this.mainContent.mainTxtMc.mainTxt.txt.width = loc2;
            this.mainContent.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.mainContent.mainTxtMc.mainTxt.txt.htmlText = this.staffList[this._staffIndex].largeDesc;
            var loc3:*=this.mainContent.mainTxtMc.mainTxt.txt.height;
            this.mainContent.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.mainContent.mainTxtMc.mainTxt.txt.height = loc3;
            this.mainContent.mainTxtMc.scrollBar.x = loc2 + 5;
            this.mainContent.mainTxtMc.scrollBar.height = this._imageHeight;
            this.mainContent.mainTxtMc.scrollBtn.x = loc2 + 2;
            caurina.transitions.Tweener.addTween(this.mainBg, {"y":(stage.stageHeight - this._imageHeight - 10) / 2 + 18, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent, {"y":(stage.stageHeight - this._imageHeight - 10) / 2 + 18, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent.mainPicHolder, {"x":5, "time":0.5, "delay":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent.mainPicHolder, {"alpha":1, "time":0.5, "delay":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent.mainTxtMc, {"alpha":1, "time":0.5, "delay":1, "transition":"easeOutExpo", "onComplete":this.addThumbsListeners});
            this.mainLoader.remove("picLoader");
            this.mainContent.mainTxtMc.scrollBtn.y = 0;
            this.mainContent.mainTxtMc.mainTxt.y = 0;
            if (this.mainContent.mainTxtMc.mainTxt.height > this.mainContent.mainTxtMc.scrollBar.height) 
            {
                this.mainContent.mainTxtMc.mainTxt.startY = this.mainContent.mainTxtMc.mainTxt.y;
                this.mainContent.mainTxtMc.mainTxt.startX = this.mainContent.mainTxtMc.mainTxt.x;
                this.mainContent.mainTxtMc.scrollBtn.visible = true;
                this.mainContent.mainTxtMc.scrollBar.visible = true;
                this.mainContent.mainTxtMc.scrollBtn.buttonMode = true;
                this._sbStartY = this.mainContent.mainTxtMc.scrollBtn.y;
                this.mainContent.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.scrollBtnOver, false, 0, true);
                this.mainContent.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.scrollBtnOut, false, 0, true);
                this.mainContent.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler, false, 0, true);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover, false, 0, true);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll, false, 0, true);
                stage.addEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll, false, 0, true);
            }
            else 
            {
                this.mainContent.mainTxtMc.scrollBtn.visible = false;
                this.mainContent.mainTxtMc.scrollBar.visible = false;
                this.mainContent.mainTxtMc.scrollBtn.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
                stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
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

        public function scrollHandlerRemover(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = false;
            caurina.transitions.Tweener.addTween(this.mainContent.mainTxtMc.scrollBtn.over, {"scaleY":0, "time":0.5, "transition":"easeOutExpo"});
            this.mainContent.mainTxtMc.scrollBtn.stopDrag();
            return;
        }

        public function loadThumbs():void
        {
            var loc1:*=0;
            var loc2:*=0;
            var loc3:*=null;
            var loc4:*=undefined;
            if (!this.thisIsClosing) 
            {
                this.thumbAll.x = 55;
                this.thumbAll.y = 65;
                this.thumbAll.mask.height = stage.stageHeight - 95;
                this.thumbAll.bg.height = stage.stageHeight - 95;
                loc1 = this.staffList.length();
                loc2 = 0;
                while (loc2 < loc1) 
                {
                    loc3 = new thumbItem();
                    loc3.id = loc2;
                    loc3.name = "thumbMc" + loc2;
                    loc3.y = loc2 * 95;
                    loc3.preloader.scaleX = 0;
                    caurina.transitions.Tweener.addTween(loc3.preloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
                    loc4 = String(this.staffList[loc2].thumb);
                    this.mainLoader.add(loc4, {"id":"thumbMc" + loc2});
                    this.mainLoader.get("thumbMc" + loc2).addEventListener(flash.events.ProgressEvent.PROGRESS, this.onItemProgress);
                    this.mainLoader.get("thumbMc" + loc2).addEventListener(flash.events.Event.COMPLETE, this.onItemComplete);
                    this.thumbAll.thumbHolder.addChild(loc3);
                    ++loc2;
                }
                this.mainLoader.start();
                this.thumbAll.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler, false, 0, true);
            }
            return;
        }

        public function onMouseScroll(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=arg1.delta > 0 ? 1 : -1;
            if (this.mainContent.mainTxtMc.scrollBtn.y >= this._sbStartY) 
            {
                this.mainContent.mainTxtMc.scrollBtn.y = this.mainContent.mainTxtMc.scrollBtn.y - loc1 * this._mouseScrollRatio * this._mouseScrollSpeed;
                if (this.mainContent.mainTxtMc.scrollBtn.y < this._sbStartY) 
                {
                    this.mainContent.mainTxtMc.scrollBtn.y = this._sbStartY;
                }
                else if (this.mainContent.mainTxtMc.scrollBtn.y > this._sbStartY + this.mainContent.mainTxtMc.scrollBar.height - this.mainContent.mainTxtMc.scrollBtn.height) 
                {
                    this.mainContent.mainTxtMc.scrollBtn.y = this._sbStartY + this.mainContent.mainTxtMc.scrollBar.height - this.mainContent.mainTxtMc.scrollBtn.height;
                }
            }
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
                this.xmlLoader.load(new flash.net.URLRequest("xml/staff.xml"));
            }
            return;
        }

        function frame1():*
        {
            caurina.transitions.properties.ColorShortcuts.init();
            caurina.transitions.properties.CurveModifiers.init();
            this.thumbBg.alpha = 0;
            this.thumbBg.width = 130;
            this.thumbBg.height = 0;
            this.mainBg.alpha = 0;
            this.mainBg.x = 0;
            this.mainBg.width = 0;
            this.mainBg.height = 300;
            this.mainContent.alpha = 0;
            this.mainContent.mainTxtMc.alpha = 0;
            this.mainContent.mainTxtMc.scrollBtn.over.scaleY = 0;
            this.mainLoader = new br.com.stimuli.loading.BulkLoader("mainLoader");
            this._thumbSpeed = 2;
            this.curPreloaderWidth = 290;
            this.thisIsClosing = false;
            this._scrollEase = 5;
            this._mouseScrollSpeed = 5;
            this._scrolling = false;
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            return;
        }

        public function showTextOnly():void
        {
            this.mainContent.mainPicPreloader.alpha = 0;
            var loc1:*=Number(this.staffList[this._staffIndex].textfieldWidth);
            this._imageHeight = Number(this.staffList[this._staffIndex].image);
            caurina.transitions.Tweener.addTween(this.mainBg, {"height":this._imageHeight + 10, "width":loc1 + 205, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            this.mainContent.mainPicPreloader.height = this._imageHeight;
            this.mainContent.mainPicPreloader.width = this._imageWidth;
            this.curPreloaderWidth = this._imageWidth;
            this.mainContent.mainTxtMc.x = 10;
            this.mainContent.mainTxtMc.mainTxtMask.width = loc1;
            this.mainContent.mainTxtMc.mainTxtMask.height = this._imageHeight;
            this.mainContent.mainTxtMc.mainTxt.txt.width = loc1;
            this.mainContent.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.mainContent.mainTxtMc.mainTxt.txt.htmlText = this.staffList[this._staffIndex].largeDesc;
            var loc2:*=this.mainContent.mainTxtMc.mainTxt.txt.height;
            this.mainContent.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.mainContent.mainTxtMc.mainTxt.txt.height = loc2;
            this.mainContent.mainTxtMc.scrollBar.x = loc1 + 5;
            this.mainContent.mainTxtMc.scrollBar.height = this._imageHeight;
            this.mainContent.mainTxtMc.scrollBtn.x = loc1 + 2;
            caurina.transitions.Tweener.addTween(this.mainBg, {"y":(stage.stageHeight - this._imageHeight - 10) / 2 + 18, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent, {"y":(stage.stageHeight - this._imageHeight - 10) / 2 + 18, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent.mainTxtMc, {"alpha":1, "time":0.5, "delay":1, "transition":"easeOutExpo", "onComplete":this.addThumbsListeners});
            this.mainContent.mainTxtMc.scrollBtn.y = 0;
            this.mainContent.mainTxtMc.mainTxt.y = 0;
            if (this.mainContent.mainTxtMc.mainTxt.height > this.mainContent.mainTxtMc.scrollBar.height) 
            {
                this.mainContent.mainTxtMc.mainTxt.startY = this.mainContent.mainTxtMc.mainTxt.y;
                this.mainContent.mainTxtMc.mainTxt.startX = this.mainContent.mainTxtMc.mainTxt.x;
                this.mainContent.mainTxtMc.scrollBtn.visible = true;
                this.mainContent.mainTxtMc.scrollBar.visible = true;
                this.mainContent.mainTxtMc.scrollBtn.buttonMode = true;
                this._sbStartY = this.mainContent.mainTxtMc.scrollBtn.y;
                this.mainContent.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.scrollBtnOver, false, 0, true);
                this.mainContent.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.scrollBtnOut, false, 0, true);
                this.mainContent.mainTxtMc.scrollBtn.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler, false, 0, true);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover, false, 0, true);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll, false, 0, true);
                stage.addEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll, false, 0, true);
            }
            else 
            {
                this.mainContent.mainTxtMc.scrollBtn.visible = false;
                this.mainContent.mainTxtMc.scrollBar.visible = false;
                this.mainContent.mainTxtMc.scrollBtn.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollHandler);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
                stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
            }
            return;
        }

        public function onCSSFileLoaded(arg1:flash.events.Event):void
        {
            this.cssloader.removeEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded);
            var loc1:*=new flash.text.StyleSheet();
            loc1.parseCSS(this.cssloader.data);
            this.mainContent.mainTxtMc.mainTxt.txt.styleSheet = loc1;
            return;
        }

        public function thumbOut(arg1:flash.events.MouseEvent):void
        {
            if (arg1.currentTarget != this._curThumb) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget.preloader, {"x":-120, "time":0.5, "transition":"easeOutExpo"});
            }
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
            return;
        }

        public function thumbSliderRemover(arg1:flash.events.MouseEvent):void
        {
            this.thumbAll.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover);
            this.thumbAll.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            this.thumbAll.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler, false, 0, true);
            return;
        }

        public function showStaff(arg1:uint):void
        {
            this._staffIndex = arg1;
            this.mainContent.x = this.thumbBg.x + this.thumbBg.width;
            this.mainContent.y = this.mainBg.y;
            this.mainContent.mainPicPreloader.width = 0;
            this.mainContent.mainPicPreloader.alpha = this.xml.settings.@preloaderAlpha;
            caurina.transitions.Tweener.addTween(this.mainContent, {"alpha":1, "time":1, "transition":"easeOut"});
            caurina.transitions.Tweener.addTween(this.mainContent.mainPicHolder, {"x":-(this.curPreloaderWidth + this.mainContent.x + 10), "time":0.5, "transition":"easeOutExpo"});
            var loc1:*=String(this.staffList[this._staffIndex].image);
            if (loc1.split(".")[1] == undefined) 
            {
                this.showTextOnly();
            }
            else 
            {
                if (loc1.split(".")[1] != "swf") 
                {
                    this._contentType = "image";
                }
                else 
                {
                    this._contentType = "swf";
                }
                this.mainLoader.add(loc1, {"id":"picLoader"});
                this.mainLoader.get("picLoader").addEventListener(flash.events.ProgressEvent.PROGRESS, this.onPicProgress);
                this.mainLoader.get("picLoader").addEventListener(flash.events.Event.COMPLETE, this.onPicComplete);
            }
            return;
        }

        public function onItemComplete(arg1:flash.events.Event):void
        {
            var loc1:*=this.thumbAll.thumbHolder.getChildByName(arg1.target.id);
            caurina.transitions.Tweener.addTween(loc1, {"x":-120, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(loc1.preloader, {"x":-120, "time":0.5, "transition":"easeOutExpo"});
            var loc2:*=this.mainLoader.getBitmap(arg1.target.id);
            loc1.picHolder.alpha = 0;
            loc1.picHolder.addChild(loc2);
            caurina.transitions.Tweener.addTween(loc1, {"x":0, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(loc1.picHolder, {"alpha":1, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            loc1.buttonMode = true;
            loc1.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbOver, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbOut, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbClicked, false, 0, true);
            if (arg1.target.id == "thumbMc0") 
            {
                this._curThumb = this.thumbAll.thumbHolder.getChildByName("thumbMc0");
                caurina.transitions.Tweener.addTween(this._curThumb.preloader, {"x":0, "time":0.5, "delay":0.5, "transition":"easeOutExpo"});
            }
            return;
        }

        public function thumbSliderHandler(arg1:flash.events.MouseEvent):void
        {
            this.thumbAll.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler);
            this.thumbAll.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover, false, 0, true);
            this.thumbAll.addEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame, false, 0, true);
            return;
        }

        public function launch():void
        {
            this.thumbBg.x = 50;
            this.thumbBg.y = stage.stageHeight - 25;
            caurina.transitions.Tweener.addTween(this.thumbBg, {"height":stage.stageHeight - 85, "time":1, "transition":"easeOutExpo", "onComplete":this.loadThumbs});
            this.mainBg.y = 155;
            caurina.transitions.Tweener.addTween(this.mainBg, {"width":800, "time":1, "delay":0.5, "transition":"easeOutExpo", "onComplete":this.showStaff(0)});
            this.mainContent.mainTxtMc.mainTxt.mask = this.mainContent.mainTxtMc.mainTxtMask;
            this.mainContent.mainTxtMc.mainTxt.txt.mouseWheelEnabled = false;
            return;
        }

        public function thumbClicked(arg1:flash.events.MouseEvent):void
        {
            if (arg1.currentTarget != this._curThumb) 
            {
                this.mainContent.mainTxtMc.alpha = 0;
                this.showStaff(arg1.currentTarget.id);
                this.removeThumbsListeners();
                caurina.transitions.Tweener.addTween(this._curThumb.preloader, {"x":-120, "time":0.5, "transition":"easeOutExpo"});
                this._curThumb = arg1.currentTarget;
                caurina.transitions.Tweener.addTween(this._curThumb.preloader, {"x":0, "time":0.5, "transition":"easeOutExpo"});
            }
            return;
        }

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xml = new XML(arg1.target.data);
            this.staffList = this.xml.staff;
            caurina.transitions.Tweener.addTween(this.thumbBg, {"_color":"0x" + this.xml.settings.@thumbBgColor, "alpha":this.xml.settings.@thumbBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainBg, {"_color":"0x" + this.xml.settings.@mainBgColor, "alpha":this.xml.settings.@mainBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainContent.mainPicPreloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainContent.mainTxtMc.scrollBtn.over, {"_color":"0x" + this.xml.settings.@scrollBtnOverColor, "alpha":this.xml.settings.@scrollBtnAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainContent.mainTxtMc.scrollBar, {"_color":"0x" + this.xml.settings.@scrollBarColor, "alpha":this.xml.settings.@scrollBarAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainContent.mainTxtMc.scrollBtn.bg, {"_color":"0x" + this.xml.settings.@scrollBtnColor, "alpha":this.xml.settings.@scrollBtnAlpha, "time":0});
            this.launch();
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

        public function removeThumbsListeners():void
        {
            var loc3:*=undefined;
            var loc1:*=this.thumbAll.thumbHolder.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.thumbAll.thumbHolder.getChildAt(loc2);
                loc3.buttonMode = false;
                loc3.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbClicked);
                ++loc2;
            }
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=undefined;
            var loc3:*=undefined;
            this.thumbBg.x = 50;
            this.thumbBg.y = stage.stageHeight - 25;
            this.thumbBg.height = stage.stageHeight - 85;
            this.thumbAll.x = 55;
            this.thumbAll.y = 65;
            this.thumbAll.mask.height = stage.stageHeight - 95;
            this.thumbAll.bg.height = stage.stageHeight - 95;
            if (this.thumbAll.thumbHolder.height > this.thumbAll.mask.height) 
            {
                loc1 = this.thumbAll.thumbHolder.height;
                loc2 = this.thumbAll.thumbHolder.height - this.thumbAll.mask.height;
                loc3 = stage.stageHeight / 2 - (stage.stageHeight / 2 + 18) + this.thumbAll.y - stage.stageHeight / 2 + this.thumbAll.mask.height / 2;
                this.thumbAll.thumbHolder.y = Math.round(this.thumbAll.thumbHolder.y + loc3 / 30 * this._thumbSpeed);
                if (this.thumbAll.thumbHolder.y > 0) 
                {
                    this.thumbAll.thumbHolder.y = 0;
                }
                else if (this.thumbAll.thumbHolder.y + loc1 < this.thumbAll.mask.height) 
                {
                    this.thumbAll.thumbHolder.y = -loc2;
                }
            }
            caurina.transitions.Tweener.addTween(this.mainBg, {"y":(stage.stageHeight - this._imageHeight - 10) / 2 + 18, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent, {"y":(stage.stageHeight - this._imageHeight - 10) / 2 + 18, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function thumbSliderEnterFrame(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=undefined;
            var loc3:*=undefined;
            if (this.thumbAll.thumbHolder.height > this.thumbAll.mask.height) 
            {
                loc1 = this.thumbAll.thumbHolder.height;
                loc2 = this.thumbAll.thumbHolder.height - this.thumbAll.mask.height;
                loc3 = stage.stageHeight / 2 - mouseY + this.thumbAll.y - stage.stageHeight / 2 + this.thumbAll.mask.height / 2;
                this.thumbAll.thumbHolder.y = Math.round(this.thumbAll.thumbHolder.y + loc3 / 30 * this._thumbSpeed);
                if (this.thumbAll.thumbHolder.y > 0) 
                {
                    this.thumbAll.thumbHolder.y = 0;
                }
                else if (this.thumbAll.thumbHolder.y + loc1 < this.thumbAll.mask.height) 
                {
                    this.thumbAll.thumbHolder.y = -loc2;
                }
            }
            return;
        }

        public function onPicProgress(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=(arg1.bytesLoaded / arg1.bytesTotal).toFixed(2);
            this.mainContent.mainPicPreloader.width = this.curPreloaderWidth * loc1;
            return;
        }

        public function scrollHandler(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = true;
            var loc1:*=this.mainContent.mainTxtMc.scrollBtn.x;
            var loc2:*=this.mainContent.mainTxtMc.scrollBar.height - this.mainContent.mainTxtMc.scrollBtn.height + this._sbStartY;
            var loc3:*=new flash.geom.Rectangle(loc1, this._sbStartY, 0, loc2);
            this.mainContent.mainTxtMc.scrollBtn.startDrag(false, loc3);
            return;
        }

        public function thumbOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.preloader, {"x":0, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function scrollBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.over, {"scaleY":1, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function removeFromStage():void
        {
            var loc3:*=undefined;
            this.thisIsClosing = true;
            this.mainLoader.removeAll();
            this.mainLoader = null;
            this.xmlLoader = null;
            this.cssloader = null;
            stage.removeEventListener(flash.events.Event.RESIZE, this.resizeHandler);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollHandlerRemover);
            stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMouseScroll);
            stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.calcScroll);
            this.thumbAll.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler);
            this.thumbAll.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover);
            this.thumbAll.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            var loc1:*=this.thumbAll.thumbHolder.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.thumbAll.thumbHolder.getChildByName("thumbMc" + loc2);
                caurina.transitions.Tweener.addTween(loc3, {"x":-120, "time":0.5, "delay":loc2 * 0.1, "transition":"easeOutExpo"});
                ++loc2;
            }
            caurina.transitions.Tweener.addTween(this.mainBg, {"width":0, "time":0.5, "transition":"strongEaseOut"});
            caurina.transitions.Tweener.addTween(this.mainContent, {"x":-1500, "time":0.5, "delay":0.2, "transition":"easeOut"});
            caurina.transitions.Tweener.addTween(this.thumbBg, {"height":0, "time":1, "delay":0.5, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
            return;
        }

        public var mainContent:flash.display.MovieClip;

        public var xmlLoader:flash.net.URLLoader;

        public var _contentType:String;

        public var xml:XML;

        public var staffList:XMLList;

        public var _imageHeight:Number;

        public var thisIsClosing:Boolean;

        public var _thumbSpeed:uint;

        public var _mouseScrollRatio:Number;

        public var mainLoader:br.com.stimuli.loading.BulkLoader;

        public var thumbBg:flash.display.MovieClip;

        public var thumbAll:flash.display.MovieClip;

        public var _staffIndex:uint;

        public var _curThumb:Object;

        public var _imageWidth:Number;

        public var _sbStartY:Number;

        public var _scrolling:Boolean;

        public var cssloader:flash.net.URLLoader;

        public var _scrollEase:uint;

        public var mainBg:flash.display.MovieClip;

        public var curPreloaderWidth:Number;

        public var _mouseScrollSpeed:uint;
    }
}
