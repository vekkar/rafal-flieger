package media_gallery_fla 
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

        public function playPauseVid(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=this.videoPaused;
            switch (loc1) 
            {
                case true:
                {
                    if (this.isYoutube) 
                    {
                        this.ytPlayer.playVideo();
                    }
                    else 
                    {
                        this.stream.togglePause();
                    }
                    this.videoPaused = false;
                    this.largeVidPlayBtn.visible = false;
                    this.largeVidPlayBtn.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver);
                    this.largeVidPlayBtn.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut);
                    this.largeVidPlayBtn.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.playPauseVid);
                    break;
                }
                case false:
                {
                    if (this.isYoutube) 
                    {
                        this.ytPlayer.pauseVideo();
                    }
                    else 
                    {
                        this.stream.togglePause();
                    }
                    this.videoPaused = true;
                    break;
                }
            }
            this.setPlayPauseBtns();
            return;
        }

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xml = new XML(arg1.target.data);
            this.xmlList = this.xml.category[0].item;
            this._curThumbsHeight = this.xml.category[0].@smallThumbnailsHeight;
            this._curThumbsWidth = this.xml.category[0].@smallThumbnailsWidth;
            if (this.xml.category.length() > 1) 
            {
                this.setCategoryMenu();
            }
            caurina.transitions.Tweener.addTween(this.thumbBg, {"_color":"0x" + this.xml.settings.@thumbBgColor, "alpha":this.xml.settings.@thumbBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainBg, {"_color":"0x" + this.xml.settings.@mainBgColor, "alpha":this.xml.settings.@mainBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.txtBg, {"_color":"0x" + this.xml.settings.@mainBgColor, "time":0});
            caurina.transitions.Tweener.addTween(this.mainContent.preloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoFSBg, {"_color":"0x" + this.xml.settings.@mainBgColor, "alpha":this.xml.settings.@mainBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainCatBg, {"_color":"0x" + this.xml.settings.@categoryDimBgColor, "alpha":this.xml.settings.@categoryDimBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.volumeTooltip.bg, {"_color":"0x" + this.xml.settings.@volumeTooltipColor, "alpha":this.xml.settings.@volumeTooltipAlpha, "time":0});
            this.mainContent.x = (stage.stageWidth - this._curContentWidth) / 2 + 2.5;
            this.mainContent.y = (stage.stageHeight - this._curContentHeight) / 2 + 18;
            this.videoControls.x = (stage.stageWidth - this.videoControls.width) / 2;
            this.videoControls.y = stage.stageHeight + 50;
            this.rotatorControls.x = stage.stageWidth;
            this.rotatorControls.y = (stage.stageHeight - this.rotatorControls.height) / 2;
            this.buffer.x = (stage.stageWidth - this.buffer.width) / 2;
            this.buffer.y = (stage.stageHeight - this.buffer.height) / 2 + 18;
            this.videoFSBg.width = stage.stageWidth;
            this.videoFSBg.height = stage.stageHeight;
            this.largeVidPlayBtn.x = (stage.stageWidth - this.largeVidPlayBtn.width) / 2;
            this.largeVidPlayBtn.y = (stage.stageHeight - this.largeVidPlayBtn.height) / 2 + 18;
            this.mainCatBg.width = stage.stageWidth;
            this.mainCatBg.height = stage.stageHeight;
            this.mainTxtMc.mainTxt.mask = this.mainTxtMc.mainTxtMask;
            this.mainTxtMc.mainTxt.txt.mouseWheelEnabled = false;
            this.launch();
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

        public function scrollBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.over, {"scaleY":1, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function stopDragVol(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.volumeSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0.5});
            this.volDraging = false;
            this.videoControls.volumeBar.volumeTooltip.visible = false;
            this.soundTimer.removeEventListener(flash.events.TimerEvent.TIMER, this.scrubSound);
            this.soundTimer.stop();
            this.videoControls.volumeBar.volumeSlider.stopDrag();
            return;
        }

        public function thumbSliderHandler(arg1:flash.events.MouseEvent):void
        {
            this.catBtnAll.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler);
            this.catBtnAll.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover, false, 0, true);
            this.catBtnAll.addEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame, false, 0, true);
            return;
        }

        public function setListeners():void
        {
            this.vidTimeDisplayTimer = new flash.utils.Timer(10);
            this.vidTimeDisplayTimer.addEventListener(flash.events.TimerEvent.TIMER, this.displayTime);
            this.videoControls.playBtn.buttonMode = true;
            this.videoControls.playBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
            this.videoControls.playBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
            this.videoControls.playBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.playPauseVid, false, 0, true);
            this.videoControls.volumeBar.volumeSlider.buttonMode = true;
            this.videoControls.volumeBar.volumeSlider.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.volScrubOver, false, 0, true);
            this.videoControls.volumeBar.volumeSlider.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.volScrubOut, false, 0, true);
            this.videoControls.volumeBar.volumeSlider.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.dragVol, false, 0, true);
            this.videoControls.volumeBar.volumeSlider.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.stopDragVol, false, 0, true);
            this.videoControls.loadBar.loadBarSlider.buttonMode = true;
            this.videoControls.loadBar.loadBarSlider.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.vidScrubOver, false, 0, true);
            this.videoControls.loadBar.loadBarSlider.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.vidScrubOut, false, 0, true);
            this.videoControls.loadBar.loadBarSlider.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.vidScrubDown, false, 0, true);
            this.videoControls.loadBar.loadBarSlider.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.vidScrubUp, false, 0, true);
            this.videoControls.fsBtn.buttonMode = true;
            this.videoControls.fsBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.fsOver, false, 0, true);
            this.videoControls.fsBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.fsOut, false, 0, true);
            this.videoControls.fsBtn.addEventListener(flash.events.MouseEvent.CLICK, this.toggleFs, false, 0, true);
            this.rotatorControls.buttonMode = true;
            this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
            this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
            this.rotatorControls.infoBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
            this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
            this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
            this.rotatorControls.infoBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
            this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.previousHandler, false, 0, true);
            this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.nextHandler, false, 0, true);
            this.rotatorControls.infoBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.infoHandler, false, 0, true);
            if (this.xml.category.length() > 1) 
            {
                this.rotatorControls.catBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                this.rotatorControls.catBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                this.rotatorControls.catBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.catBtnClicked, false, 0, true);
            }
            return;
        }

        public function onItemComplete(arg1:flash.events.Event):void
        {
            var loc1:*=this.thumbAll.getChildByName(arg1.target.id);
            caurina.transitions.Tweener.addTween(loc1.preloader, {"scaleX":0, "time":0.5, "transition":"easeOutExpo"});
            var loc2:*=this.mainLoader.getBitmap(arg1.target.id);
            loc1.picHolder.alpha = 0;
            loc1.picHolder.addChild(loc2);
            caurina.transitions.Tweener.addTween(loc1.picHolder, {"alpha":1, "time":0.5, "transition":"easeOutExpo"});
            loc1.picHolder.id = loc1.id;
            loc1.buttonMode = true;
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.thumbOver, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.thumbOut, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbClicked, false, 0, true);
            return;
        }

        public function catBtnClicked(arg1:flash.events.MouseEvent):void
        {
            var e:flash.events.MouseEvent;

            var loc1:*;
            e = arg1;
            if (this._catOpen) 
            {
                this._catOpen = false;
                this.mainCatBg.visible = false;
                caurina.transitions.Tweener.addTween(this.catBtnAll, {"alpha":0, "time":1, "transition":"strongEaseOut", "onComplete":function ():void
                {
                    catBtnAll.visible = false;
                    return;
                }})
            }
            else 
            {
                this._catOpen = true;
                this.catBtnAll.catHolder.x = 0;
                this.mainCatBg.width = stage.stageWidth;
                this.mainCatBg.height = stage.stageHeight;
                this.mainCatBg.visible = true;
                this.mainCatBg.buttonMode = true;
                this.mainCatBg.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.closeCat, false, 0, true);
                this.catBtnAll.alpha = 0;
                this.catBtnAll.visible = true;
                caurina.transitions.Tweener.addTween(this.catBtnAll, {"alpha":1, "time":1, "transition":"strongEaseOut"});
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
                this.xmlLoader.load(new flash.net.URLRequest("xml/mediaGallery.xml"));
            }
            return;
        }

        public function onPicProgress(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=(arg1.bytesLoaded / arg1.bytesTotal).toFixed(2);
            this.mainContent.preloader.width = this._curContentWidth * loc1;
            return;
        }

        public function initializeYouTubeVideo(arg1:flash.events.Event):void
        {
            this.ytLoader.contentLoaderInfo.removeEventListener(flash.events.Event.INIT, this.initializeYouTubeVideo);
            this.mainContent.youtubeHolder.addChild(this.ytLoader);
            this.ytExists = true;
            this.ytLoader.content.addEventListener("onReady", this.youTubeReady);
            this.ytLoader.content.addEventListener("onStateChange", this.onPlayerStateChange);
            return;
        }

        public function removedFromStage():void
        {
            flash.display.MovieClip(stage.getChildAt(0)).loadSWF(flash.display.MovieClip(stage.getChildAt(0)).curModule);
            return;
        }

        public function displayTime(arg1:flash.events.TimerEvent):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=undefined;
            var loc4:*=undefined;
            var loc5:*=undefined;
            var loc6:*=undefined;
            var loc7:*=undefined;
            if (this.isYoutube) 
            {
                loc1 = this.ytPlayer.getVideoBytesLoaded() * 100 / this.ytPlayer.getVideoBytesTotal();
                loc1 = Number(loc1.toFixed(2));
                this.videoControls.loadBar.loadProgressBar.width = loc1 * this.loadBarWidth / 100;
                this.vidRect = new flash.geom.Rectangle(-5, -4, this.loadBarWidth, 0);
                loc2 = this.ytPlayer.getCurrentTime() * 100 / this.ytPlayer.getDuration();
                if (this.scrubbingVideo == true) 
                {
                    this.ytPlayer.seekTo(Math.round(this.ytPlayer.getDuration() * this.videoControls.loadBar.loadBarSlider.x / this.loadBarWidth), true);
                    this.videoControls.loadBar.vidProgressBar.width = this.videoControls.loadBar.loadBarSlider.x;
                }
                else 
                {
                    this.videoControls.loadBar.vidProgressBar.width = loc2 * this.loadBarWidth / 100;
                    this.videoControls.loadBar.loadBarSlider.x = this.videoControls.loadBar.vidProgressBar.width;
                }
                loc3 = this.ytPlayer.getCurrentTime();
                loc4 = Math.floor(loc3 / 60);
                loc5 = Math.floor(loc3 % 60);
                loc6 = Math.floor(this.ytPlayer.getDuration() / 60);
                loc7 = Math.floor(this.ytPlayer.getDuration() % 60);
                loc4 = loc4 < 10 ? "0" + loc4 : loc4;
                loc5 = loc5 < 10 ? "0" + loc5 : loc5;
                loc6 = loc6 < 10 ? "0" + loc6 : loc6;
                loc7 = loc7 < 10 ? "0" + loc7 : loc7;
                this.videoControls.timeDisplayTxt.text = loc4 + ":" + loc5 + " / " + loc6 + ":" + loc7;
            }
            else 
            {
                loc1 = this.stream.bytesLoaded * 100 / this.stream.bytesTotal;
                loc1 = Number(loc1.toFixed(2));
                this.videoControls.loadBar.loadProgressBar.width = loc1 * this.loadBarWidth / 100;
                this.vidRect = new flash.geom.Rectangle(-5, -4, this.videoControls.loadBar.loadProgressBar.width, 0);
                loc2 = this.stream.time * 100 / this.videoLength;
                if (this.scrubbingVideo == true) 
                {
                    this.stream.seek(Math.round(this.videoLength * this.videoControls.loadBar.loadBarSlider.x / this.loadBarWidth));
                    this.videoControls.loadBar.vidProgressBar.width = this.videoControls.loadBar.loadBarSlider.x;
                }
                else 
                {
                    this.videoControls.loadBar.vidProgressBar.width = loc2 * this.loadBarWidth / 100;
                    this.videoControls.loadBar.loadBarSlider.x = this.videoControls.loadBar.vidProgressBar.width;
                }
                loc3 = this.stream.time;
                loc4 = Math.floor(this.stream.time / 60);
                loc5 = Math.floor(loc3 % 60);
                loc6 = Math.floor(this.videoLength / 60);
                loc7 = Math.floor(this.videoLength % 60);
                loc4 = loc4 < 10 ? "0" + loc4 : loc4;
                loc5 = loc5 < 10 ? "0" + loc5 : loc5;
                loc6 = loc6 < 10 ? "0" + loc6 : loc6;
                loc7 = loc7 < 10 ? "0" + loc7 : loc7;
                this.videoControls.timeDisplayTxt.text = loc4 + ":" + loc5 + " / " + loc6 + ":" + loc7;
            }
            return;
        }

        public function launch():void
        {
            caurina.transitions.Tweener.addTween(this.rotatorControls.nextBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.previousBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.infoBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.catBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.largeVidPlayBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.nextBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.previousBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.infoBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.catBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.largeVidPlayBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.over, {"_color":"0x" + this.xml.settings.@scrollBtnOverColor, "alpha":this.xml.settings.@scrollBtnAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBar, {"_color":"0x" + this.xml.settings.@scrollBarColor, "alpha":this.xml.settings.@scrollBarAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.bg, {"_color":"0x" + this.xml.settings.@scrollBtnColor, "alpha":this.xml.settings.@scrollBtnAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.buffer.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            this.buffer.bufferTxt.textColor = "0x" + this.xml.settings.@controlsIconColor;
            caurina.transitions.Tweener.addTween(this.videoControls.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.playBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.loadBar.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.loadBar.loadProgressBar, {"_color":"0x" + this.xml.settings.@videoControlsLoadBarColor, "alpha":this.xml.settings.@videoControlsLoadBarAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.loadBar.vidProgressBar, {"_color":"0x" + this.xml.settings.@videoControlsProgressBarColor, "alpha":this.xml.settings.@videoControlsProgressBarAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.loadBar.loadBarSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "alpha":this.xml.settings.@controlsIconAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.volumeSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "alpha":this.xml.settings.@controlsIconAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.bg, {"_color":"0x" + this.xml.settings.@volumeSlideBarColor, "alpha":this.xml.settings.@volumeSlideBarAlpha, "time":0});
            this.loadBarWidth = this.videoControls.loadBar.bg.width;
            this.videoControls.playBtn.playIcon.visible = false;
            this.videoControls.timeDisplayTxt.autoSize = flash.text.TextFieldAutoSize.RIGHT;
            this.videoControls.timeDisplayTxt.text = "00:00/00:00";
            this.thumbBg.y = (stage.stageHeight - 210) / 2 + 18;
            this.thumbBg.visible = true;
            caurina.transitions.Tweener.addTween(this.thumbBg, {"width":stage.stageWidth, "time":1, "transition":"easeOutExpo", "onComplete":this.loadThumbs});
            this.mainBg.y = stage.stageHeight;
            this.mainBg.x = (stage.stageWidth - this.mainBg.width) / 2;
            this.mainBg.visible = true;
            var loc1:*=stage.stageHeight - ((stage.stageHeight - this._curContentHeight) / 2 + 13);
            caurina.transitions.Tweener.addTween(this.mainBg, {"height":loc1, "time":1, "transition":"easeOutExpo", "onComplete":this.showMain(0)});
            this.thumbAll.x = this.mainBg.x + this.mainBg.width + 5;
            this.setListeners();
            return;
        }

        public function vidScrubOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5});
            return;
        }

        public function thumbOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.preloader, {"scaleX":0, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function controlsBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function hideInfo():void
        {
            this._infoShowing = false;
            caurina.transitions.Tweener.addTween(this.txtBg, {"alpha":0, "time":0.5, "transition":"easeOutExpo"});
            this.mainTxtMc.visible = false;
            return;
        }

        public function catOut(arg1:flash.events.MouseEvent):void
        {
            if (arg1.currentTarget != this._curCatBtn) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget.preloader, {"scaleX":0, "time":0.5, "transition":"easeOutExpo"});
            }
            return;
        }

        public function setCategoryMenu():void
        {
            var loc3:*=null;
            var loc4:*=undefined;
            var loc5:*=undefined;
            caurina.transitions.Tweener.addTween(this.catBtnAll.catBg, {"_color":"0x" + this.xml.settings.@thumbBgColor, "alpha":this.xml.settings.@thumbBgAlpha, "time":0});
            var loc1:*=this.xml.category.length();
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = new catItem();
                loc3.mouseChildren = false;
                loc3.name = "catBtn" + loc2;
                loc3.id = loc2;
                loc4 = "0x" + this.xml.settings.@categoryTxtColor;
                loc3.catTxtMc.txt.textColor = loc4;
                loc3.catTxtMc.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
                loc3.catTxtMc.txt.text = this.xml.category[loc2].@title;
                loc3.catTxtMc.bg.width = loc3.catTxtMc.txt.width + 10;
                loc3.catTxtMc.bg.height = loc3.catTxtMc.txt.height + 6;
                caurina.transitions.Tweener.addTween(loc3.catTxtMc.bg, {"_color":"0x" + this.xml.settings.@categoryTxtBgColor, "alpha":this.xml.settings.@categoryTxtBgAlpha, "time":0});
                loc3.catTxtMc.txt.x = (loc3.catTxtMc.bg.width - loc3.catTxtMc.txt.width) / 2;
                loc3.catTxtMc.txt.y = (loc3.catTxtMc.bg.height - loc3.catTxtMc.txt.height) / 2;
                loc3.catTxtMc.x = (200 - loc3.catTxtMc.width) / 2;
                loc3.catTxtMc.y = (100 - loc3.catTxtMc.height) / 2;
                loc3.preloader.maxScale = loc3.preloader.scaleX;
                loc3.preloader.scaleX = 0;
                caurina.transitions.Tweener.addTween(loc3.preloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
                loc3.x = 205 * loc2 + 5;
                loc3.y = 5;
                this.catBtnAll.catHolder.addChild(loc3);
                if (loc2 < 3) 
                {
                    this.catBtnAll.catBg.width = 205 * (loc2 + 1) + 5;
                    this.catBtnAll.catMask.width = this.catBtnAll.catBg.width;
                }
                else 
                {
                    this.catBtnAll.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler, false, 0, true);
                }
                loc5 = String(this.xml.category[loc2].@catThumbnail);
                this.mainLoader.add(loc5, {"id":"catBtn" + loc2});
                this.mainLoader.get("catBtn" + loc2).addEventListener(flash.events.Event.COMPLETE, this.onCatPicComplete);
                this.mainLoader.start();
                ++loc2;
            }
            this.setCatBtns();
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

        public function onCatPicComplete(arg1:flash.events.Event):void
        {
            var loc1:*=this.catBtnAll.catHolder.getChildByName(arg1.target.id);
            var loc2:*=this.mainLoader.getBitmap(arg1.target.id);
            loc1.catPicHolder.addChild(loc2);
            loc1.catPicHolder.id = loc1.id;
            loc1.buttonMode = true;
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.catOver, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.catOut, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.catClicked, false, 0, true);
            this.catBtnAll.x = (stage.stageWidth - this.catBtnAll.catBg.width) / 2;
            this.catBtnAll.y = (stage.stageHeight - this.catBtnAll.catBg.height) / 2 + 18;
            this.rotatorControls.catBtn.visible = true;
            return;
        }

        public function thumbSliderRemover(arg1:flash.events.MouseEvent):void
        {
            this.catBtnAll.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.thumbSliderRemover);
            this.catBtnAll.removeEventListener(flash.events.Event.ENTER_FRAME, this.thumbSliderEnterFrame);
            this.catBtnAll.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.thumbSliderHandler, false, 0, true);
            return;
        }

        public function youTubeReady(arg1:flash.events.Event):void
        {
            this.ytLoader.content.removeEventListener("onReady", this.youTubeReady);
            this.ytPlayer = new Object();
            this.ytPlayer = this.ytLoader.content;
            this.ytPlayer.loadVideoById(this.youtubeId, 0, this.xml.settings.@youTubeVideoAspectQuality);
            this.ytPlayer.pauseVideo();
            var loc1:*=this.xml.settings.@videoVolume * 100;
            this.ytPlayer.setVolume(loc1);
            this.videoControls.volumeBar.volumeSlider.x = this.videoControls.volumeBar.bg.width * loc1 / 100;
            this.videoRatio = Number(this.xml.settings.@youTubeVideoAspectRatio.split(":")[0] / this.xml.settings.@youTubeVideoAspectRatio.split(":")[1]);
            this.ytPlayer.setSize(this.vidHeight * this.videoRatio, this.vidHeight);
            this.ytWidth = this.vidHeight * this.videoRatio;
            this._curContentWidth = this.ytWidth;
            this._curContentHeight = this.vidHeight;
            this.repositionContent();
            return;
        }

        public function closeCat(arg1:flash.events.MouseEvent):void
        {
            var e:flash.events.MouseEvent;

            var loc1:*;
            e = arg1;
            this.mainCatBg.buttonMode = false;
            this.mainCatBg.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.closeCat);
            this._catOpen = false;
            this.mainCatBg.visible = false;
            caurina.transitions.Tweener.addTween(this.catBtnAll, {"alpha":0, "time":1, "transition":"strongEaseOut", "onComplete":function ():void
            {
                catBtnAll.visible = false;
                return;
            }})
            return;
        }

        public function controlsBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0.55, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function setCatBtns():*
        {
            var loc3:*=undefined;
            var loc1:*=this.catBtnAll.catHolder.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.catBtnAll.catHolder.getChildAt(loc2);
                caurina.transitions.Tweener.addTween(loc3.preloader, {"scaleX":0, "time":0.5, "transition":"easeOut"});
                ++loc2;
            }
            this._curCatBtn = this.catBtnAll.catHolder.getChildAt(this._curCatInt);
            caurina.transitions.Tweener.addTween(this._curCatBtn.preloader, {"scaleX":1, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function asyncErrorHandler(arg1:flash.events.AsyncErrorEvent):void
        {
            trace(arg1);
            return;
        }

        public function vidScrubUp(arg1:flash.events.MouseEvent):void
        {
            if (this.isYoutube) 
            {
                this.ytPlayer.unMute();
                this.scrubbingVideo = false;
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.vidScrubUp);
                caurina.transitions.Tweener.addTween(this.videoControls.loadBar.loadBarSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0.5});
                this.videoControls.loadBar.loadBarSlider.stopDrag();
            }
            else 
            {
                this.stream.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler, false, 0, true);
                this.stream.resume();
                this.scrubbingVideo = false;
                stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.vidScrubUp);
                caurina.transitions.Tweener.addTween(this.videoControls.loadBar.loadBarSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0.5});
                this.videoControls.loadBar.loadBarSlider.stopDrag();
            }
            return;
        }

        public function scrubSound(arg1:flash.events.TimerEvent):void
        {
            var loc1:*=0;
            var loc2:*=undefined;
            this.videoControls.volumeBar.volumeTooltip.x = this.videoControls.volumeBar.volumeSlider.x + 3;
            this.videoControls.volumeBar.volumeTooltip.volumeTxt.text = (this.videoControls.volumeBar.volumeSlider.x + 3) * 2;
            if (this.isYoutube) 
            {
                loc1 = (this.videoControls.volumeBar.volumeSlider.x + 3) * 2;
                this.ytPlayer.setVolume(loc1);
            }
            else 
            {
                loc2 = (this.videoControls.volumeBar.volumeSlider.x + 3) * 2 / 100;
                this.videoVolumeTransform = new flash.media.SoundTransform();
                this.videoVolumeTransform.volume = loc2;
                this.stream.soundTransform = this.videoVolumeTransform;
            }
            return;
        }

        public function thumbSliderEnterFrame(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=undefined;
            var loc3:*=undefined;
            if (this.catBtnAll.catHolder.width > this.catBtnAll.catMask.width) 
            {
                loc1 = this.catBtnAll.catHolder.width;
                loc2 = this.catBtnAll.catHolder.width - this.catBtnAll.catMask.width + 10;
                loc3 = stage.stageWidth / 2 - mouseX + this.catBtnAll.x - stage.stageWidth / 2 + this.catBtnAll.catMask.width / 2;
                this.catBtnAll.catHolder.x = this.catBtnAll.catHolder.x + loc3 / 25 * this._thumbSpeed | 0;
                if (this.catBtnAll.catHolder.x > 0) 
                {
                    this.catBtnAll.catHolder.x = 0;
                }
                else if (this.catBtnAll.catHolder.x + loc1 < this.catBtnAll.catMask.width) 
                {
                    this.catBtnAll.catHolder.x = -loc2;
                }
            }
            return;
        }

        public function connectStream():void
        {
            var client:Object;
            var videoURL:String;

            var loc1:*;
            this.stream = new flash.net.NetStream(this.connection);
            this.stream.bufferTime = Number(this.xml.settings.@videoBufferTime);
            this.stream.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler, false, 0, true);
            this.stream.addEventListener(flash.events.AsyncErrorEvent.ASYNC_ERROR, this.asyncErrorHandler);
            client = new Object();
            client.onMetaData = function (arg1:Object):void
            {
                videoLength = arg1.duration;
                videoRatio = arg1.width / arg1.height;
                vidHeight = Number(xmlList[_curContentInt].large.@videoHeight);
                var loc1:*=vidHeight * videoRatio;
                mainContent.videoHolder.height = vidHeight;
                mainContent.videoHolder.width = loc1;
                _curContentWidth = loc1;
                _curContentHeight = vidHeight;
                repositionContent();
                return;
            }
            this.stream.client = client;
            this.video = new flash.media.Video();
            this.video.attachNetStream(this.stream);
            this.video.smoothing = true;
            this.mainContent.videoHolder.visible = false;
            this.mainContent.videoHolder.addChild(this.video);
            this.videoVolumeTransform = new flash.media.SoundTransform();
            this.videoVolumeTransform.volume = Number(this.xml.settings.@videoVolume);
            this.stream.soundTransform = this.videoVolumeTransform;
            this.videoControls.volumeBar.volumeSlider.x = this.videoControls.volumeBar.bg.width * this.videoVolumeTransform.volume;
            videoURL = this.xmlList[this._curContentInt].large;
            this.stream.play(videoURL);
            this.stream.pause();
            return;
        }

        public function dragVol(arg1:flash.events.MouseEvent):void
        {
            this.volDraging = true;
            arg1.currentTarget.parent.stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.stopDragVol);
            this.videoControls.volumeBar.volumeTooltip.x = this.videoControls.volumeBar.volumeSlider.x + 3;
            this.videoControls.volumeBar.volumeTooltip.volumeTxt.text = this.videoControls.volumeBar.volumeSlider.x * 2;
            this.videoControls.volumeBar.volumeTooltip.visible = true;
            this.soundTimer = new flash.utils.Timer(10);
            this.soundTimer.addEventListener(flash.events.TimerEvent.TIMER, this.scrubSound);
            this.soundTimer.start();
            this.videoControls.volumeBar.volumeSlider.startDrag(false, this.volRect);
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
            var loc1:*=this.thumbAll.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.thumbAll.getChildAt(loc2);
                loc3.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbClicked);
                ++loc2;
            }
            this.rotatorControls.previousBtn.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.previousHandler);
            this.rotatorControls.nextBtn.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.nextHandler);
            this.rotatorControls.infoBtn.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.infoHandler);
            return;
        }

        public function vidScrubOut(arg1:flash.events.MouseEvent):void
        {
            if (!this.scrubbingVideo) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0.5});
            }
            return;
        }

        public function infoHandler(arg1:flash.events.MouseEvent):void
        {
            if (this._infoShowing) 
            {
                this.hideInfo();
            }
            else 
            {
                this.showInfo();
            }
            return;
        }

        public function nextHandler(arg1:flash.events.MouseEvent):void
        {
            if (this._curContentInt < (this.xmlList.length() - 1)) 
            {
                this.removeThumbsListeners();
                var loc1:*;
                var loc2:*=((loc1 = this)._curContentInt + 1);
                loc1._curContentInt = loc2;
                this.showMain(this._curContentInt);
            }
            return;
        }

        public function onBuffer(arg1:flash.events.TimerEvent):void
        {
            var loc1:*=Math.round(this.stream.bufferLength * 100 / this.stream.bufferTime);
            if (loc1 <= 100) 
            {
                this.buffer.bufferTxt.text = loc1 + "%";
            }
            else 
            {
                this.buffer.bufferTxt.text = "100%";
            }
            return;
        }

        public function catOver(arg1:flash.events.MouseEvent):void
        {
            if (arg1.currentTarget != this._curCatBtn) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget.preloader, {"scaleX":arg1.currentTarget.preloader.maxScale, "time":0.5, "transition":"easeOutExpo"});
            }
            return;
        }

        public function volScrubOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5});
            return;
        }

        public function showInfo():void
        {
            this._infoShowing = true;
            this.mainTxtMc.scrollBtn.y = 0;
            this.mainTxtMc.mainTxt.y = 0;
            this.mainTxtMc.x = this.mainContent.x + 10;
            this.mainTxtMc.y = this.mainContent.y + 10;
            this.txtBg.x = this.mainContent.x;
            this.txtBg.y = this.mainContent.y;
            this.txtBg.width = this._curContentWidth;
            this.txtBg.height = this._curContentHeight;
            this.mainTxtMc.mainTxtMask.width = this._curContentWidth - 30;
            this.mainTxtMc.mainTxtMask.height = this._curContentHeight - 20;
            this.mainTxtMc.mainTxt.txt.width = this._curContentWidth - 30;
            this.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.mainTxtMc.mainTxt.txt.htmlText = this.xmlList[this._curContentInt].text;
            var loc1:*=this.mainTxtMc.mainTxt.txt.height;
            this.mainTxtMc.mainTxt.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.mainTxtMc.mainTxt.txt.height = loc1;
            this.mainTxtMc.scrollBar.x = this._curContentWidth - 20;
            this.mainTxtMc.scrollBar.height = this._curContentHeight - 20;
            this.mainTxtMc.scrollBtn.x = this._curContentWidth - 23;
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
            caurina.transitions.Tweener.addTween(this.txtBg, {"alpha":this.xml.settings.@mainBgAlpha, "time":0.5, "transition":"easeOutExpo"});
            this.mainTxtMc.visible = true;
            return;
        }

        public function onPlayerError(arg1:flash.events.Event):void
        {
            return;
        }

        public function onItemProgress(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=this.thumbAll.getChildByName(arg1.target.id);
            loc1.preloader.scaleX = (arg1.bytesLoaded * loc1.preloader.maxScale / arg1.bytesTotal).toFixed(2);
            return;
        }

        public function previousHandler(arg1:flash.events.MouseEvent):void
        {
            if (this._curContentInt > 0) 
            {
                this.removeThumbsListeners();
                var loc1:*;
                var loc2:*=((loc1 = this)._curContentInt - 1);
                loc1._curContentInt = loc2;
                this.showMain(this._curContentInt);
            }
            return;
        }

        public function clearMask():void
        {
            var loc3:*=undefined;
            var loc1:*=this.mainContent.myMask.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.mainContent.myMask.getChildAt(loc2);
                caurina.transitions.Tweener.removeTweens(loc3, "scaleY", "scaleX", "alpha", "_Blur_blurX", "_Blur_blurY");
                ++loc2;
            }
            return;
        }

        public function showMain(arg1:uint):void
        {
            this.mainContent.picHolder.visible = false;
            this.mainContent.videoHolder.visible = false;
            this.mainContent.youtubeHolder.visible = false;
            this.mainContent.visible = true;
            this._curContentInt = arg1;
            this.mainContent.preloader.height = this._curContentHeight;
            var loc1:*=String(this.xmlList[arg1].large.@type);
            var loc2:*=String(this.xmlList[arg1].large);
            if (this._infoShowing) 
            {
                caurina.transitions.Tweener.addTween(this.txtBg, {"alpha":0, "time":0.5, "transition":"easeOutExpo"});
                this.mainTxtMc.visible = false;
            }
            if (this.xmlList[this._curContentInt].text == "") 
            {
                this.rotatorControls.infoBtn.visible = false;
                if (this.rotatorControls.catBtn.visible) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls.catBtn, {"x":50, "time":0.5, "transition":"easeOutExpo"});
                }
            }
            else 
            {
                this.rotatorControls.infoBtn.visible = true;
                if (this.rotatorControls.catBtn.visible) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls.catBtn, {"x":75, "time":0.5, "transition":"easeOutExpo"});
                }
            }
            if (flash.display.MovieClip(stage.getChildAt(0)).videoPlaying) 
            {
                this.vidTimeDisplayTimer.stop();
                if (this.ytExists) 
                {
                    this.ytPlayer.destroy();
                    this.ytLoader = null;
                    this.ytPlayer = null;
                    this.ytExists = false;
                    this.mainContent.youtubeHolder.removeChildAt(0);
                }
                else 
                {
                    this.bufferTimer.stop();
                    this.bufferTimer = null;
                    this.connection.close();
                    this.connection = null;
                    this.stream.close();
                    this.stream = null;
                    this.video = null;
                    this.mainContent.videoHolder.removeChildAt(0);
                }
            }
            var loc3:*=loc1;
            switch (loc3) 
            {
                case "image":
                {
                    if (flash.display.MovieClip(stage.getChildAt(0)).videoPlaying) 
                    {
                        flash.display.MovieClip(stage.getChildAt(0)).unPauseMusic();
                        flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = false;
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":stage.stageHeight + 100, "time":1, "transition":"strongEaseOut"});
                    }
                    this._curContentType = "image";
                    this.mainLoader.add(loc2, {"id":"picLoader"});
                    this.mainLoader.get("picLoader").addEventListener(flash.events.ProgressEvent.PROGRESS, this.onPicProgress);
                    this.mainLoader.get("picLoader").addEventListener(flash.events.Event.COMPLETE, this.onPicComplete);
                    break;
                }
                case "video":
                {
                    this.isYoutube = false;
                    this._curContentType = "video";
                    flash.display.MovieClip(stage.getChildAt(0)).pauseMusic();
                    flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = true;
                    this.bufferTimer = new flash.utils.Timer(10);
                    this.bufferTimer.addEventListener(flash.events.TimerEvent.TIMER, this.onBuffer, false, 0, true);
                    this.connection = new flash.net.NetConnection();
                    this.connection.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler, false, 0, true);
                    this.connection.connect(null);
                    break;
                }
                case "youtube":
                {
                    this.isYoutube = true;
                    this._curContentType = "youtube";
                    flash.display.MovieClip(stage.getChildAt(0)).pauseMusic();
                    flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = true;
                    this.startYouTubeVideo(arg1);
                    break;
                }
                case "swf":
                {
                    if (flash.display.MovieClip(stage.getChildAt(0)).videoPlaying) 
                    {
                        flash.display.MovieClip(stage.getChildAt(0)).unPauseMusic();
                        flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = false;
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":stage.stageHeight + 100, "time":1, "transition":"strongEaseOut"});
                    }
                    this._curContentType = "swf";
                    this.mainLoader.add(loc2, {"id":"picLoader"});
                    this.mainLoader.get("picLoader").addEventListener(flash.events.ProgressEvent.PROGRESS, this.onPicProgress);
                    this.mainLoader.get("picLoader").addEventListener(flash.events.Event.COMPLETE, this.onPicComplete);
                    break;
                }
            }
            this.mainLoader.start();
            return;
        }

        public function thumbOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.preloader, {"scaleX":arg1.currentTarget.preloader.maxScale, "time":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function fsOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(this.videoControls.fsBtn, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.fsBtn.fsIcon, {"scaleX":1.7, "scaleY":1.7, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function netStatusHandler(arg1:flash.events.NetStatusEvent):void
        {
            var loc1:*=arg1.info.code;
            switch (loc1) 
            {
                case "NetConnection.Connect.Success":
                {
                    this.connectStream();
                    break;
                }
                case "NetStream.Play.StreamNotFound":
                {
                    break;
                }
                case "NetStream.Buffer.Empty":
                {
                    if (!this.videoPaused) 
                    {
                        this.buffer.visible = true;
                        this.bufferTimer.start();
                    }
                    break;
                }
                case "NetStream.Buffer.Full":
                {
                    this.buffer.visible = false;
                    this.bufferTimer.stop();
                    break;
                }
                case "NetStream.Play.Start":
                {
                    this.largeVidPlayBtn.visible = false;
                    this.buffer.visible = true;
                    this.bufferTimer.start();
                    break;
                }
                case "NetStream.Seek.InvalidTime":
                {
                    break;
                }
                case "NetStream.Play.Stop":
                {
                    this.stream.pause();
                    this.stream.seek(0);
                    this.bufferTimer.stop();
                    this.videoPaused = true;
                    this.setPlayPauseBtns();
                    break;
                }
            }
            return;
        }

        public function startYouTubeVideo(arg1:uint):void
        {
            this.youtubeId = String(this.xmlList[arg1].large);
            this.vidHeight = Number(this.xmlList[arg1].large.@videoHeight);
            this.ytLoader = new flash.display.Loader();
            this.ytLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.initializeYouTubeVideo);
            this.ytLoader.contentLoaderInfo.addEventListener("onError", this.onPlayerError);
            this.ytLoader.load(new flash.net.URLRequest("http://www.youtube.com/apiplayer?version=3"));
            return;
        }

        public function removeFromStage():void
        {
            this.mainLoader.removeAll();
            this.mainLoader = null;
            this.xmlLoader = null;
            this.cssloader = null;
            if (flash.display.MovieClip(stage.getChildAt(0)).videoPlaying) 
            {
                this.vidTimeDisplayTimer.stop();
                this.vidTimeDisplayTimer = null;
                this.bufferTimer.stop();
                this.bufferTimer = null;
                if (this.ytExists) 
                {
                    this.ytPlayer.destroy();
                    this.ytLoader = null;
                    this.ytPlayer = null;
                    this.ytExists = false;
                    this.mainContent.youtubeHolder.removeChildAt(0);
                }
                else 
                {
                    this.connection.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler);
                    this.connection.close();
                    this.connection = null;
                    this.stream.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler);
                    this.stream.close();
                    this.stream = null;
                    this.video = null;
                    this.mainContent.videoHolder.removeChildAt(0);
                }
                flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = false;
            }
            stage.removeEventListener(flash.events.Event.RESIZE, this.resizeHandler);
            this.hideInfo();
            if (this._catOpen) 
            {
                this.mainCatBg.buttonMode = false;
                this.mainCatBg.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.closeCat);
                this._catOpen = false;
                this.mainCatBg.visible = false;
                caurina.transitions.Tweener.addTween(this.catBtnAll, {"alpha":0, "time":1, "transition":"strongEaseOut"});
            }
            caurina.transitions.Tweener.addTween(this.thumbBg, {"width":0, "time":1, "transition":"easeOutExpo"});
            fl.transitions.TransitionManager.start(this.thumbAll, {"type":fl.transitions.PixelDissolve, "direction":fl.transitions.Transition.OUT, "duration":0.5, "easing":fl.transitions.easing.Strong.easeOut});
            caurina.transitions.Tweener.addTween(this.videoControls, {"y":stage.stageHeight + 100, "time":1, "delay":0.2, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":stage.stageWidth + 100, "time":1, "delay":0.4, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainContent, {"x":-(this._curContentWidth + 100), "time":1, "delay":0.6, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.mainBg, {"height":0, "time":1, "delay":0.8, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
            return;
        }

        public function fsOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(this.videoControls.fsBtn, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.fsBtn.fsIcon, {"scaleX":1, "scaleY":1, "time":0.5, "transition":"easeOutElastic"});
            return;
        }

        function frame1():*
        {
            caurina.transitions.properties.ColorShortcuts.init();
            caurina.transitions.properties.CurveModifiers.init();
            flash.system.Security.allowDomain("www.youtube.com");
            this.thumbBg.visible = false;
            this.thumbBg.width = 0;
            this.mainBg.visible = false;
            this.mainBg.height = 0;
            this.mainContent.visible = false;
            this.mainContent.preloader.width = 0;
            this.videoFSBg.visible = false;
            this.mainContent.myMask.visible = false;
            this.largeVidPlayBtn.visible = false;
            this.videoControls.visible = false;
            this.rotatorControls.visible = false;
            this.rotatorControls.catBtn.visible = false;
            this.buffer.visible = false;
            this.videoControls.volumeBar.volumeTooltip.visible = false;
            this.mainTxtMc.visible = false;
            this.txtBg.alpha = 0;
            this.catBtnAll.visible = false;
            this.mainCatBg.visible = false;
            this.mainLoader = new br.com.stimuli.loading.BulkLoader("mainLoader");
            this._thumbsLoading = false;
            this._curContentWidth = 600;
            this._curContentHeight = 400;
            this._curContentInt = 0;
            this._infoShowing = false;
            this._scrollEase = 5;
            this._mouseScrollSpeed = 5;
            this._scrolling = false;
            this.introPlaying = false;
            this.scrubbingVideo = false;
            this.videoPaused = false;
            this.vidFullScreen = false;
            this.volRect = new flash.geom.Rectangle(-3, -4, 50, 0);
            this.volDraging = false;
            this.isYoutube = false;
            this._curCatInt = 0;
            this._catOpen = false;
            this._thumbSpeed = 2;
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.mainContent.myMask.cacheAsBitmap = true;
            this.mainContent.picHolder.cacheAsBitmap = true;
            this.mainContent.videoHolder.cacheAsBitmap = true;
            this.mainContent.youtubeHolder.cacheAsBitmap = true;
            this.ytExists = false;
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

        public function loadThumbs():void
        {
            var loc4:*=null;
            var loc5:*=undefined;
            var loc6:*=NaN;
            caurina.transitions.Tweener.addTween(this.thumbBg, {"y":(stage.stageHeight - (this._curThumbsHeight + 10)) / 2 + 18, "height":this._curThumbsHeight + 10, "time":1, "transition":"strongEaseOut"});
            this._thumbsLoading = true;
            this.thumbAll.y = (stage.stageHeight - this._curThumbsHeight) / 2 + 18;
            var loc1:*=0;
            var loc2:*=this.xmlList.length();
            var loc3:*=0;
            while (loc3 < loc2) 
            {
                (loc4 = new thumbItem()).id = loc3;
                loc4.name = "thumbMc" + loc3;
                loc4.preloader.height = this._curThumbsHeight;
                if (this._curThumbsWidth != 0) 
                {
                    loc4.preloader.width = this._curThumbsWidth;
                }
                else 
                {
                    loc4.preloader.width = Number(this.xmlList[loc3].thumbnail.@width);
                }
                loc4.preloader.maxScale = loc4.preloader.scaleX;
                loc4.preloader.scaleX = 0;
                caurina.transitions.Tweener.addTween(loc4.preloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
                loc5 = String(this.xmlList[loc3].thumbnail);
                this.mainLoader.add(loc5, {"id":"thumbMc" + loc3});
                this.mainLoader.get("thumbMc" + loc3).addEventListener(flash.events.ProgressEvent.PROGRESS, this.onItemProgress);
                this.mainLoader.get("thumbMc" + loc3).addEventListener(flash.events.Event.COMPLETE, this.onItemComplete);
                if (loc3 != this._curContentInt) 
                {
                    if (this._curThumbsWidth != 0) 
                    {
                        loc6 = this._curThumbsWidth + 5;
                    }
                    else 
                    {
                        loc6 = Number(this.xmlList[loc3].thumbnail.@width) + 5;
                    }
                    loc4.x = loc1;
                    loc1 = loc1 + loc6;
                }
                else 
                {
                    loc4.visible = false;
                    if (this._curThumbsWidth != 0) 
                    {
                        loc4.x = -this._curThumbsWidth;
                    }
                    else 
                    {
                        loc4.x = -Number(this.xmlList[loc3].thumbnail.@width);
                    }
                }
                this.thumbAll.addChild(loc4);
                ++loc3;
            }
            this.mainLoader.start();
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
            return;
        }

        public function mainContentVisible():void
        {
            this.mainContent.x = (stage.stageWidth - this._curContentWidth) / 2;
            this.mainContent.y = (stage.stageHeight - this._curContentHeight) / 2 + 18;
            var loc1:*=this._curContentType;
            switch (loc1) 
            {
                case "image":
                {
                    this.mainContent.picHolder.mask = this.mainContent.myMask;
                    this.mainContent.picHolder.visible = true;
                    this.mainContent.myMask.visible = true;
                    break;
                }
                case "video":
                {
                    this.mainContent.videoHolder.mask = this.mainContent.myMask;
                    this.mainContent.videoHolder.visible = true;
                    this.mainContent.myMask.visible = true;
                    this.stream.resume();
                    this.vidTimeDisplayTimer.start();
                    this.videoPaused = false;
                    this.setPlayPauseBtns();
                    this.videoControls.visible = true;
                    if (this.mainBg.height > this._curContentHeight + 65) 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":this.mainContent.y + this._curContentHeight + 10, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                    }
                    else 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":this.mainContent.y + this._curContentHeight - 30, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                    }
                    break;
                }
                case "youtube":
                {
                    this.mainContent.youtubeHolder.mask = this.mainContent.myMask;
                    this.mainContent.youtubeHolder.visible = true;
                    this.mainContent.myMask.visible = true;
                    this.ytPlayer.playVideo();
                    this.vidTimeDisplayTimer.start();
                    this.videoPaused = false;
                    this.setPlayPauseBtns();
                    this.videoControls.visible = true;
                    if (this.mainBg.height > this._curContentHeight + 65) 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":this.mainContent.y + this._curContentHeight + 10, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                    }
                    else 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":this.mainContent.y + this._curContentHeight - 30, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                    }
                    break;
                }
                case "swf":
                {
                    this.mainContent.picHolder.mask = this.mainContent.myMask;
                    this.mainContent.picHolder.visible = true;
                    this.mainContent.myMask.visible = true;
                    break;
                }
            }
            this.clearMask();
            this.animateMask(this._curContentWidth, this._curContentHeight);
            if (this._infoShowing && !(this.xmlList[this._curContentInt].text == "")) 
            {
                this.showInfo();
            }
            this.addThumbsListeners();
            return;
        }

        public function animateMask(arg1:Number, arg2:Number):void
        {
            var loc5:*=undefined;
            var loc1:*=arg1;
            var loc2:*=arg2;
            this.mainContent.myMask.width = loc1;
            this.mainContent.myMask.height = loc2;
            var loc3:*=this.mainContent.myMask.numChildren;
            var loc4:*=0;
            while (loc4 < loc3) 
            {
                (loc5 = this.mainContent.myMask.getChildAt(loc4)).cacheAsBitmap = true;
                var loc6:*;
                loc5.alpha = loc6 = 0;
                loc5.scaleY = loc6 = loc6;
                loc5.scaleX = loc6;
                caurina.transitions.Tweener.addTween(loc5, {"scaleY":1.1, "scaleX":1.1, "delay":loc4 * 0.02, "time":1.5, "transition":"strongEaseOut"});
                caurina.transitions.Tweener.addTween(loc5, {"alpha":1, "time":1.5, "delay":0.2, "transition":"strongEaseOut"});
                caurina.transitions.Tweener.addTween(loc5, {"_Blur_blurX":15, "_Blur_blurY":15, "_Blur_quality":2, "time":0.7, "transition":"linear"});
                caurina.transitions.Tweener.addTween(loc5, {"_Blur_blurX":0, "_Blur_blurY":0, "time":0.7, "delay":0.7, "transition":"linear"});
                ++loc4;
            }
            return;
        }

        public function toggleFs(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(this.videoControls.fsBtn.fsIcon, {"scaleX":1, "scaleY":1, "time":0.5, "transition":"easeOut"});
            if (this.vidFullScreen) 
            {
                this.vidFullScreen = false;
                this.rotatorControls.visible = true;
                this.mainBg.visible = true;
                this.thumbBg.visible = true;
                if (this._infoShowing) 
                {
                    this.mainTxtMc.visible = true;
                    this.txtBg.visible = true;
                }
                this.videoFSBg.visible = false;
            }
            else 
            {
                this.vidFullScreen = true;
                this.rotatorControls.visible = false;
                this.mainBg.visible = false;
                this.thumbBg.visible = false;
                if (this._infoShowing) 
                {
                    this.mainTxtMc.visible = false;
                    this.txtBg.visible = false;
                }
                this.videoFSBg.width = stage.stageWidth;
                this.videoFSBg.height = stage.stageHeight;
                this.videoFSBg.visible = true;
            }
            this.setVidSize(this.videoRatio);
            return;
        }

        public function vidScrubDown(arg1:flash.events.MouseEvent):void
        {
            if (this.isYoutube) 
            {
                this.ytPlayer.mute();
                this.scrubbingVideo = true;
                this.videoControls.loadBar.loadBarSlider.startDrag(false, this.vidRect);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.vidScrubUp, false, 0, true);
            }
            else 
            {
                this.stream.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler);
                this.stream.pause();
                this.scrubbingVideo = true;
                this.videoControls.loadBar.loadBarSlider.startDrag(false, this.vidRect);
                stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.vidScrubUp, false, 0, true);
            }
            return;
        }

        public function catClicked(arg1:flash.events.MouseEvent):void
        {
            var garbage:*;
            var e:flash.events.MouseEvent;
            var i:uint;
            var _numGarbage:*;

            var loc1:*;
            _numGarbage = undefined;
            i = 0;
            garbage = undefined;
            e = arg1;
            if (e.currentTarget != this._curCatBtn) 
            {
                this._catOpen = false;
                this.mainCatBg.visible = false;
                caurina.transitions.Tweener.addTween(this.catBtnAll, {"alpha":0, "time":1, "transition":"strongEaseOut", "onComplete":function ():void
                {
                    catBtnAll.visible = false;
                    return;
                }})
                _numGarbage = this.thumbAll.numChildren;
                i = 0;
                while (i < _numGarbage) 
                {
                    garbage = this.thumbAll.getChildAt(0);
                    this.thumbAll.removeChild(garbage);
                    garbage = null;
                    ++i;
                }
                this.xmlList = this.xml.category[e.currentTarget.id].item;
                this._curThumbsHeight = this.xml.category[e.currentTarget.id].@smallThumbnailsHeight;
                this._curThumbsWidth = this.xml.category[e.currentTarget.id].@smallThumbnailsWidth;
                this.mainLoader.removeAll();
                this.loadThumbs();
                this.showMain(0);
                this._curCatInt = e.currentTarget.id;
                this.setCatBtns();
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

        public function scrollHandlerRemover(arg1:flash.events.MouseEvent):void
        {
            this._scrolling = false;
            caurina.transitions.Tweener.addTween(this.mainTxtMc.scrollBtn.over, {"scaleY":0, "time":0.5, "transition":"easeOutExpo"});
            this.mainTxtMc.scrollBtn.stopDrag();
            return;
        }

        public function setVidSize(arg1:Number):*
        {
            if (this.vidFullScreen) 
            {
                flash.display.MovieClip(stage.getChildAt(0)).hideHeader();
                if (this.ytExists) 
                {
                    this.mainContent.youtubeHolder.width = stage.stageWidth;
                    this.mainContent.youtubeHolder.height = stage.stageWidth / arg1;
                }
                else 
                {
                    this.mainContent.videoHolder.width = stage.stageWidth;
                    this.mainContent.videoHolder.height = stage.stageWidth / arg1;
                }
                this.mainContent.myMask.width = stage.stageWidth;
                this.mainContent.myMask.height = stage.stageWidth / arg1;
                this.mainContent.x = 0;
                this.mainContent.y = (stage.stageHeight - this.mainContent.height) / 2;
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":stage.stageHeight - 30, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                flash.display.MovieClip(stage.getChildAt(0)).showHeader();
                if (this.ytExists) 
                {
                    this.mainContent.youtubeHolder.height = this.vidHeight;
                    this.mainContent.youtubeHolder.width = this.vidHeight * arg1;
                    caurina.transitions.Tweener.addTween(this.mainContent, {"x":(stage.stageWidth - this.mainContent.youtubeHolder.width) / 2, "y":(stage.stageHeight - this.mainContent.youtubeHolder.height) / 2 + 18, "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.videoControls, {"y":(stage.stageHeight - this.mainContent.youtubeHolder.height) / 2 + 18 + this._curContentHeight + 10, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                }
                else 
                {
                    this.mainContent.videoHolder.height = this.vidHeight;
                    this.mainContent.videoHolder.width = this.vidHeight * arg1;
                    caurina.transitions.Tweener.addTween(this.mainContent, {"x":(stage.stageWidth - this.mainContent.videoHolder.width) / 2, "y":(stage.stageHeight - this.mainContent.videoHolder.height) / 2 + 18, "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.videoControls, {"y":(stage.stageHeight - this.mainContent.videoHolder.height) / 2 + 18 + this._curContentHeight + 10, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                }
                this.mainContent.myMask.width = this.vidHeight * arg1;
                this.mainContent.myMask.height = this.vidHeight;
            }
            return;
        }

        public function onPlayerStateChange(arg1:flash.events.Event):void
        {
            if (Object(arg1).data == "0") 
            {
                this.ytPlayer.seekTo(0);
                this.ytPlayer.stopVideo();
                this.videoPaused = true;
                this.setPlayPauseBtns();
            }
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            if (this._thumbsLoading) 
            {
                caurina.transitions.Tweener.addTween(this.thumbBg, {"width":stage.stageWidth, "time":0.5});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.thumbBg, {"width":stage.stageWidth, "time":0.5, "onComplete":this.loadThumbs});
            }
            this.mainBg.y = stage.stageHeight;
            var loc1:*=stage.stageHeight - ((stage.stageHeight - this._curContentHeight) / 2 + 13);
            caurina.transitions.Tweener.addTween(this.mainBg, {"height":loc1, "x":(stage.stageWidth - this._curContentWidth - 10) / 2, "time":1, "transition":"easeOutExpo"});
            this.thumbAll.y = (stage.stageHeight - this._curThumbsHeight) / 2 + 18;
            this.thumbAll.x = (stage.stageWidth - this._curContentWidth - 10) / 2 + this._curContentWidth + 12.5;
            caurina.transitions.Tweener.addTween(this.thumbBg, {"y":(stage.stageHeight - (this._curThumbsHeight + 10)) / 2 + 18, "height":this._curThumbsHeight + 10, "time":1, "transition":"strongEaseOut"});
            if (this.vidFullScreen) 
            {
                this.videoFSBg.width = stage.stageWidth;
                this.videoFSBg.height = stage.stageHeight;
                this.mainContent.myMask.width = stage.stageWidth;
                this.mainContent.myMask.height = stage.stageWidth / this.videoRatio;
                this.largeVidPlayBtn.x = (stage.stageWidth - this.largeVidPlayBtn.width) / 2;
                this.largeVidPlayBtn.y = (stage.stageHeight - this.largeVidPlayBtn.height) / 2;
                if (this.ytExists) 
                {
                    this.mainContent.youtubeHolder.width = stage.stageWidth;
                    this.mainContent.youtubeHolder.height = stage.stageWidth / this.videoRatio;
                    this.mainContent.y = (stage.stageHeight - this.mainContent.youtubeHolder.height) / 2;
                }
                else 
                {
                    this.mainContent.videoHolder.width = stage.stageWidth;
                    this.mainContent.videoHolder.height = stage.stageWidth / this.videoRatio;
                    this.mainContent.y = (stage.stageHeight - this.mainContent.videoHolder.height) / 2;
                }
                this.mainContent.x = 0;
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":stage.stageHeight - 30, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                this.mainContent.x = (stage.stageWidth - this._curContentWidth) / 2;
                this.mainContent.y = (stage.stageHeight - this._curContentHeight) / 2 + 18;
                this.largeVidPlayBtn.x = (stage.stageWidth - this.largeVidPlayBtn.width) / 2;
                this.largeVidPlayBtn.y = (stage.stageHeight - this.largeVidPlayBtn.height) / 2 + 18;
                if (flash.display.MovieClip(stage.getChildAt(0)).videoPlaying) 
                {
                    if (this.mainBg.height > this._curContentHeight + 65) 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":this.mainContent.y + this._curContentHeight + 10, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                    }
                    else 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"y":this.mainContent.y + this._curContentHeight - 30, "x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"strongEaseOut"});
                    }
                }
                else 
                {
                    this.videoControls.x = (stage.stageWidth - this.videoControls.width) / 2;
                    this.videoControls.y = stage.stageHeight + 50;
                }
            }
            this.mainTxtMc.x = this.mainContent.x + 10;
            this.mainTxtMc.y = this.mainContent.y + 10;
            this.txtBg.x = this.mainContent.x;
            this.txtBg.y = this.mainContent.y;
            this.buffer.x = (stage.stageWidth - this.buffer.width) / 2;
            this.buffer.y = (stage.stageHeight - this.buffer.height) / 2 + 18;
            if (stage.stageWidth - this.mainBg.width > 200) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth + 13, "y":(stage.stageHeight - this._curThumbsHeight) / 2 - 10, "time":1, "transition":"easeOutExpo"});
            }
            else if (this.mainTxtMc.scrollBtn.visible) 
            {
                if (this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 105, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
                }
                else if (this.rotatorControls.infoBtn.visible && !this.rotatorControls.catBtn.visible || !this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 80, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
                }
                else 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 55, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
                }
            }
            else if (this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 95, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
            }
            else if (this.rotatorControls.infoBtn.visible && !this.rotatorControls.catBtn.visible || !this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 70, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 45, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
            }
            if (this._catOpen) 
            {
                this.mainCatBg.width = stage.stageWidth;
                this.mainCatBg.height = stage.stageHeight;
            }
            caurina.transitions.Tweener.addTween(this.catBtnAll, {"x":(stage.stageWidth - this.catBtnAll.catBg.width) / 2, "y":(stage.stageHeight - this.catBtnAll.catBg.height) / 2 + 18, "time":1, "transition":"easeOutExpo"});
            return;
        }

        public function setPlayPauseBtns():*
        {
            var loc1:*=this.videoPaused;
            switch (loc1) 
            {
                case true:
                {
                    this.videoControls.playBtn.playIcon.visible = true;
                    this.videoControls.playBtn.pauseIcon.visible = false;
                    this.largeVidPlayBtn.visible = true;
                    this.largeVidPlayBtn.buttonMode = true;
                    this.largeVidPlayBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                    this.largeVidPlayBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                    this.largeVidPlayBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.playPauseVid, false, 0, true);
                    break;
                }
                case false:
                {
                    this.videoControls.playBtn.playIcon.visible = false;
                    this.videoControls.playBtn.pauseIcon.visible = true;
                    this.largeVidPlayBtn.visible = false;
                    this.largeVidPlayBtn.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver);
                    this.largeVidPlayBtn.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut);
                    this.largeVidPlayBtn.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.playPauseVid);
                    break;
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

        public function addThumbsListeners():void
        {
            var loc3:*=undefined;
            var loc1:*=this.thumbAll.numChildren;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = this.thumbAll.getChildAt(loc2);
                loc3.id = loc2;
                loc3.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.thumbClicked, false, 0, true);
                ++loc2;
            }
            this.rotatorControls.previousBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.previousHandler, false, 0, true);
            this.rotatorControls.nextBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.nextHandler, false, 0, true);
            this.rotatorControls.infoBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.infoHandler, false, 0, true);
            return;
        }

        public function onPicComplete(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=null;
            var loc3:*=null;
            this.mainContent.preloader.width = 0;
            if (this._prevContentType != null) 
            {
                var loc4:*=this._prevContentType;
                switch (loc4) 
                {
                    case "image":
                    {
                        loc1 = this.mainContent.picHolder.getChildAt(0);
                        this.mainContent.picHolder.removeChild(loc1);
                        loc1 = null;
                        break;
                    }
                    case "video":
                    {
                        loc1 = this.mainContent.videoHolder.getChildAt(0);
                        this.mainContent.videoHolder.removeChild(loc1);
                        loc1 = null;
                        break;
                    }
                    case "youtube":
                    {
                        this.ytPlayer.destroy();
                        this.ytLoader = null;
                        this.ytPlayer = null;
                        this.ytExists = false;
                        this.mainContent.youtubeHolder.removeChildAt(0);
                        break;
                    }
                    case "swf":
                    {
                        loc1 = this.mainContent.picHolder.getChildAt(0);
                        this.mainContent.picHolder.removeChild(loc1);
                        loc1 = null;
                        break;
                    }
                }
            }
            this._prevContentType = this._curContentType;
            loc4 = this._curContentType;
            switch (loc4) 
            {
                case "image":
                {
                    loc2 = this.mainLoader.getBitmap(arg1.target.id);
                    this._curContentWidth = loc2.width;
                    this._curContentHeight = loc2.height;
                    this.mainContent.picHolder.addChild(loc2);
                    break;
                }
                case "video":
                {
                    break;
                }
                case "youtube":
                {
                    break;
                }
                case "swf":
                {
                    loc3 = this.mainLoader.getMovieClip(arg1.target.id);
                    this._curContentWidth = loc3.width;
                    this._curContentHeight = loc3.height;
                    this.mainContent.picHolder.addChild(loc3);
                    break;
                }
            }
            this.repositionContent();
            this.mainLoader.remove("picLoader");
            return;
        }

        public function repositionContent():void
        {
            var loc4:*=0;
            var loc5:*=NaN;
            var loc6:*=NaN;
            var loc7:*=0;
            var loc8:*=0;
            var loc9:*=undefined;
            var loc10:*=NaN;
            var loc1:*=stage.stageHeight - ((stage.stageHeight - this._curContentHeight) / 2 + 13);
            var loc2:*=this._curContentWidth + 10;
            var loc3:*=(stage.stageWidth - loc2) / 2;
            caurina.transitions.Tweener.addTween(this.mainBg, {"height":loc1, "width":loc2, "x":loc3, "time":1, "transition":"easeOutExpo", "onComplete":this.mainContentVisible});
            this.rotatorControls.visible = true;
            if (stage.stageWidth - this.mainBg.width > 200) 
            {
                trace();
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth + 13, "y":(stage.stageHeight - this._curThumbsHeight) / 2 - 10, "time":1, "transition":"easeOutExpo"});
            }
            else if (this.mainTxtMc.scrollBtn.visible) 
            {
                if (this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 105, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
                }
                else if (this.rotatorControls.infoBtn.visible && !this.rotatorControls.catBtn.visible || !this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 80, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
                }
                else 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 55, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
                }
            }
            else if (this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 95, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
            }
            else if (this.rotatorControls.infoBtn.visible && !this.rotatorControls.catBtn.visible || !this.rotatorControls.infoBtn.visible && this.rotatorControls.catBtn.visible) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 70, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - (this._curContentWidth + 10)) / 2 + this._curContentWidth - 45, "y":this.mainContent.y + 5, "time":1, "transition":"easeOutExpo"});
            }
            this.thumbAll.x = loc3 + loc2 + 2.5;
            if (this.thumbAll.numChildren != 0) 
            {
                loc4 = this.xmlList.length();
                loc5 = 0;
                loc6 = 0;
                loc7 = 0;
                while (loc7 < this._curContentInt) 
                {
                    if (this._curThumbsWidth != 0) 
                    {
                        loc6 = loc6 + this._curThumbsWidth + 5;
                    }
                    else 
                    {
                        loc6 = loc6 + Number(this.xmlList[loc7].thumbnail.@width) + 5;
                    }
                    ++loc7;
                }
                loc8 = 0;
                while (loc8 < loc4) 
                {
                    (loc9 = this.thumbAll.getChildAt(loc8)).visible = true;
                    if (loc8 != this._curContentInt) 
                    {
                        if (loc8 < this._curContentInt) 
                        {
                            caurina.transitions.Tweener.addTween(loc9, {"x":-(this._curContentWidth + loc6 + 10), "time":0.5, "transition":"easeOutBack"});
                            if (this._curThumbsWidth != 0) 
                            {
                                loc6 = loc6 - (Number(this._curThumbsWidth) + 5);
                            }
                            else 
                            {
                                loc6 = loc6 - (Number(this.xmlList[loc8].thumbnail.@width) + 5);
                            }
                        }
                        else 
                        {
                            if (this._curThumbsWidth != 0) 
                            {
                                loc10 = this._curThumbsWidth + 5;
                            }
                            else 
                            {
                                loc10 = Number(this.xmlList[loc8].thumbnail.@width) + 5;
                            }
                            caurina.transitions.Tweener.addTween(loc9, {"x":loc5, "time":1, "transition":"strongEaseOut"});
                            loc5 = loc5 + loc10;
                        }
                    }
                    else 
                    {
                        loc9.visible = false;
                        if (this._curThumbsWidth != 0) 
                        {
                            caurina.transitions.Tweener.addTween(loc9, {"x":-this._curThumbsWidth, "time":0.5, "transition":"easeOutBack"});
                        }
                        else 
                        {
                            caurina.transitions.Tweener.addTween(loc9, {"x":-Number(this.xmlList[loc8].thumbnail.@width), "time":0.5, "transition":"easeOutBack"});
                        }
                    }
                    ++loc8;
                }
            }
            return;
        }

        public function volScrubOut(arg1:flash.events.MouseEvent):void
        {
            if (!this.volDraging) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0.5});
            }
            return;
        }

        public function thumbClicked(arg1:flash.events.MouseEvent):void
        {
            this.removeThumbsListeners();
            this._curContentInt = arg1.currentTarget.id;
            this.showMain(this._curContentInt);
            return;
        }

        public var _catOpen:Boolean;

        public var _curThumbsHeight:Number;

        public var xmlLoader:flash.net.URLLoader;

        public var mainTxtMc:flash.display.MovieClip;

        public var _curContentType:String;

        public var ytLoader:flash.display.Loader;

        public var xml:XML;

        public var _curCatInt:uint;

        public var catBtnAll:flash.display.MovieClip;

        public var _curContentInt:uint;

        public var _thumbsLoading:Boolean;

        public var introPlaying:Boolean;

        public var _curThumbsWidth:Number;

        public var ytHeight:Number;

        public var subTimer:flash.utils.Timer;

        public var mainLoader:br.com.stimuli.loading.BulkLoader;

        public var ytPlayer:Object;

        public var buffer:flash.display.MovieClip;

        public var vidTimeDisplayTimer:flash.utils.Timer;

        public var videoLength:*;

        public var videoControls:flash.display.MovieClip;

        public var xmlList:XMLList;

        public var videoRatio:Number;

        public var ytExists:Boolean;

        public var ytWidth:Number;

        public var _scrolling:Boolean;

        public var videoVolumeTransform:flash.media.SoundTransform;

        public var _infoShowing:Boolean;

        public var loadBarWidth:Number;

        public var soundTimer:flash.utils.Timer;

        public var _sbStartY:Number;

        public var youtubeId:String;

        public var scrubbingVideo:Boolean;

        public var vidHeight:Number;

        public var _curCatBtn:*;

        public var largeVidPlayBtn:flash.display.MovieClip;

        public var vidFullScreen:Boolean;

        public var stream:flash.net.NetStream;

        public var txtBg:flash.display.MovieClip;

        public var videoPaused:Boolean;

        public var mainCatBg:flash.display.MovieClip;

        public var volDraging:Boolean;

        public var cssloader:flash.net.URLLoader;

        public var mainBg:flash.display.MovieClip;

        public var _thumbSpeed:uint;

        public var rotatorControls:flash.display.MovieClip;

        public var vidRect:flash.geom.Rectangle;

        public var video:flash.media.Video;

        public var bufferTimer:flash.utils.Timer;

        public var _prevContentType:String;

        public var _mouseScrollRatio:Number;

        public var thumbAll:flash.display.MovieClip;

        public var connection:flash.net.NetConnection;

        public var _curContentWidth:Number;

        public var volRect:flash.geom.Rectangle;

        public var _mouseScrollSpeed:uint;

        public var thumbBg:flash.display.MovieClip;

        public var isYoutube:Boolean;

        public var _scrollEase:uint;

        public var videoFSBg:flash.display.MovieClip;

        public var mainContent:flash.display.MovieClip;

        public var _curContentHeight:Number;
    }
}
