package singleVideo_and_rotator_fla 
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

        public function removedFromStage():void
        {
            flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = false;
            flash.display.MovieClip(stage.getChildAt(0)).loadSWF(flash.display.MovieClip(stage.getChildAt(0)).curModule);
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=NaN;
            var loc5:*=NaN;
            if (this.introPlaying) 
            {
                loc1 = getChildByName("skipIntroBtn");
                if (this.vidFullScreen) 
                {
                    this.largeVidPlayBtn.x = (stage.stageWidth - this.largeVidPlayBtn.width) / 2;
                    this.largeVidPlayBtn.y = (stage.stageHeight - this.largeVidPlayBtn.height) / 2;
                    this.videoFSBg.width = stage.stageWidth;
                    this.videoFSBg.height = stage.stageHeight;
                    this.videoHolder.width = stage.stageWidth;
                    this.videoHolder.height = stage.stageWidth / this.videoRatio;
                    this.videoHolder.x = 0;
                    this.videoHolder.y = (stage.stageHeight - this.videoHolder.height) / 2;
                    caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":stage.stageHeight - 30, "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(loc1, {"x":5, "y":5, "time":1, "transition":"easeOutExpo"});
                }
                else 
                {
                    this.largeVidPlayBtn.x = (stage.stageWidth - this.largeVidPlayBtn.width) / 2;
                    this.largeVidPlayBtn.y = (stage.stageHeight - this.largeVidPlayBtn.height) / 2 + 18;
                    this.videoHolder.height = this.vidHeight;
                    this.videoHolder.width = this.vidHeight * this.videoRatio;
                    caurina.transitions.Tweener.addTween(this.videoHolder, {"x":(stage.stageWidth - this.videoHolder.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18, "time":1, "transition":"easeOutExpo"});
                    this.leftVidBg.y = (stage.stageHeight - this.leftVidBg.height) / 2 + 15.5;
                    this.bottomVidBg.y = stage.stageHeight;
                    this.bottomVidBg.x = (stage.stageWidth - this.videoHolder.width) / 2 - 5;
                    loc2 = (stage.stageWidth - this.videoHolder.width) / 2 + this.videoHolder.width + 10;
                    caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":loc2, "time":1, "transition":"easeOutExpo"});
                    loc3 = stage.stageHeight - (stage.stageHeight - this.vidHeight) / 2 - 13;
                    caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc3, "time":1, "transition":"easeOutExpo"});
                    if (this.bottomVidBg.height > this.videoHolder.height + 65) 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + this.videoHolder.height + 28, "time":1, "transition":"easeOutExpo"});
                    }
                    else 
                    {
                        caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + this.videoHolder.height - 10, "time":1, "transition":"easeOutExpo"});
                    }
                    if (loc1) 
                    {
                        if (this.bottomVidBg.x >= loc1.width + 10) 
                        {
                            caurina.transitions.Tweener.addTween(loc1, {"x":(stage.stageWidth - this.videoHolder.width) / 2 - loc1.width - 10, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18 - 5, "time":1, "transition":"easeOutExpo"});
                        }
                        else 
                        {
                            caurina.transitions.Tweener.addTween(loc1, {"x":(stage.stageWidth - this.videoHolder.width) / 2 + 5, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18 + 5, "time":1, "transition":"easeOutExpo"});
                        }
                    }
                }
                caurina.transitions.Tweener.addTween(this.buffer, {"x":(stage.stageWidth - this.buffer.width) / 2, "y":(stage.stageHeight - this.buffer.height) / 2, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                this.rightBg.x = stage.stageWidth;
                this.rightBg.y = (stage.stageHeight - this.rightBg.height) / 2 + 15.5;
                loc4 = (stage.stageWidth - this.imageWidth) / 2 + this.imageWidth + 5;
                caurina.transitions.Tweener.addTween(this.rightBg, {"width":loc4, "time":1, "transition":"easeOutExpo"});
                this.bottomVidBg.y = stage.stageHeight;
                this.bottomVidBg.x = (stage.stageWidth - this.imageWidth) / 2;
                trace(this.bottomVidBg.width);
                this.bottomVidBg.width = Math.round(this.imageWidth + 10);
                trace(this.bottomVidBg.width);
                loc5 = stage.stageHeight - (stage.stageHeight - this.imageHeight) / 2 - 13;
                caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc5, "time":1, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.imagesHolder, {"x":(stage.stageWidth - this.imageWidth) / 2 + 5, "y":(stage.stageHeight - this.imageHeight) / 2 + 18, "time":1, "transition":"easeOutExpo"});
                if (loc4 > this.imageWidth + 95) 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth + 15, "y":(stage.stageHeight - this.imageHeight) / 2 + this.imageHeight - 5, "time":1, "transition":"easeOutExpo"});
                }
                else 
                {
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth - 70, "y":(stage.stageHeight - this.imageHeight) / 2 + this.imageHeight - 5, "time":1, "transition":"easeOutExpo"});
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
                this.xmlLoader.load(new flash.net.URLRequest("xml/home.xml"));
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
                vidHeight = xml.settings.@videoHeight;
                videoHolder.x = -vidHeight * videoRatio;
                videoHolder.y = (stage.stageHeight - vidHeight) / 2 + 18;
                videoHolder.height = vidHeight;
                videoHolder.width = vidHeight * videoRatio;
                videoHolder.visible = true;
                buffer.x = -100;
                buffer.y = (stage.stageHeight - buffer.height) / 2 + 18;
                animateVideoBg();
                return;
            }
            this.stream.client = client;
            this.video = new flash.media.Video();
            this.video.attachNetStream(this.stream);
            this.video.smoothing = true;
            this.videoHolder.visible = false;
            this.videoHolder.addChild(this.video);
            this.videoVolumeTransform = new flash.media.SoundTransform();
            this.videoVolumeTransform.volume = Number(this.xml.settings.@videoVolume);
            this.stream.soundTransform = this.videoVolumeTransform;
            this.videoControls.volumeBar.volumeSlider.x = this.videoControls.volumeBar.bg.width * this.videoVolumeTransform.volume;
            videoURL = this.xml.settings.@videoPath;
            this.stream.play(videoURL);
            this.stream.pause();
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

        public function skipBtnClicked(arg1:flash.events.MouseEvent):void
        {
            this.shutVideo();
            return;
        }

        public function vidScrubOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5});
            return;
        }

        public function volScrubOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5});
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
            this.vidHeight = this.xml.settings.@videoHeight;
            this.videoRatio = Number(this.xml.settings.@youTubeVideoAspectRatio.split(":")[0] / this.xml.settings.@youTubeVideoAspectRatio.split(":")[1]);
            this.ytPlayer.setSize(this.vidHeight * this.videoRatio, this.vidHeight);
            this.ytWidth = this.vidHeight * this.videoRatio;
            this.videoHolder.x = -this.ytWidth;
            this.videoHolder.y = (stage.stageHeight - this.vidHeight) / 2 + 18;
            this.animateVideoBg();
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

        public function initializeYouTubeVideo(arg1:flash.events.Event):void
        {
            this.ytLoader.contentLoaderInfo.removeEventListener(flash.events.Event.INIT, this.initializeYouTubeVideo);
            this.videoHolder.addChild(this.ytLoader);
            this.ytExists = true;
            this.ytLoader.content.addEventListener("onReady", this.youTubeReady);
            this.ytLoader.content.addEventListener("onStateChange", this.onPlayerStateChange);
            return;
        }

        public function slideVid(arg1:flash.events.TimerEvent):*
        {
            var loc1:*=undefined;
            caurina.transitions.Tweener.addTween(this.videoHolder, {"x":(stage.stageWidth - this.videoHolder.width) / 2, "time":1, "transition":"easeOutExpo"});
            this.largeVidPlayBtn.x = (stage.stageWidth - this.largeVidPlayBtn.width) / 2;
            this.largeVidPlayBtn.y = (stage.stageHeight - this.largeVidPlayBtn.height) / 2 + 18;
            if (this.isYoutube) 
            {
                if (this.ytPlayer) 
                {
                    this.ytPlayer.playVideo();
                }
            }
            else 
            {
                this.buffer.y = (stage.stageHeight - this.buffer.height) / 2 + 18;
                this.buffer.visible = true;
                caurina.transitions.Tweener.addTween(this.buffer, {"x":(stage.stageWidth - this.buffer.width) / 2, "time":1, "transition":"easeOutExpo"});
                this.stream.resume();
            }
            if (this.xml.settings.@playRotator == "true" && !this.thisIsClosing) 
            {
                this.skipIntroBtn.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
                this.skipIntroBtn.txt.text = this.xml.settings.@skipIntroText;
                caurina.transitions.Tweener.addTween(this.skipIntroBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
                loc1 = "0x" + this.xml.settings.@controlsIconColor;
                this.skipIntroBtn.txt.textColor = loc1;
                var loc2:*;
                this.skipIntroBtn.gloss.width = loc2 = this.skipIntroBtn.txt.textWidth + 10;
                this.skipIntroBtn.bg.width = loc2;
                this.skipIntroBtn.txt.x = (this.skipIntroBtn.bg.width - this.skipIntroBtn.txt.width) / 2;
                this.skipIntroBtn.txt.y = (this.skipIntroBtn.bg.height - this.skipIntroBtn.txt.height) / 2;
                this.skipIntroBtn.x = -(this.skipIntroBtn.width + 100);
                this.skipIntroBtn.y = this.videoHolder.y - 5;
                addChild(this.skipIntroBtn);
                caurina.transitions.Tweener.addTween(this.skipIntroBtn, {"x":(stage.stageWidth - this.videoHolder.width) / 2 - this.skipIntroBtn.width - 10, "time":1, "delay":0.5, "transition":"easeOutExpo"});
                this.skipIntroBtn.buttonMode = true;
                this.skipIntroBtn.mouseChildren = false;
                this.skipIntroBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.skipBtnOver, false, 0, true);
                this.skipIntroBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.skipBtnOut, false, 0, true);
                this.skipIntroBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.skipBtnClicked, false, 0, true);
            }
            if (this.xml.settings.@showControls == "true" && !this.thisIsClosing) 
            {
                this.videoControls.timeDisplayTxt.autoSize = flash.text.TextFieldAutoSize.RIGHT;
                this.videoControls.timeDisplayTxt.text = "00:00/00:00";
                this.vidTimeDisplayTimer = new flash.utils.Timer(10);
                this.vidTimeDisplayTimer.addEventListener(flash.events.TimerEvent.TIMER, this.displayTime);
                this.vidTimeDisplayTimer.start();
                this.loadBarWidth = this.videoControls.loadBar.bg.width;
                this.videoControls.playBtn.playIcon.visible = false;
                caurina.transitions.Tweener.addTween(this.videoControls.bg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.playBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.loadBar.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.largeVidPlayBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.loadBar.loadProgressBar, {"_color":"0x" + this.xml.settings.@videoControlsLoadBarColor, "alpha":this.xml.settings.@videoControlsLoadBarAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.loadBar.vidProgressBar, {"_color":"0x" + this.xml.settings.@videoControlsProgressBarColor, "alpha":this.xml.settings.@videoControlsProgressBarAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.loadBar.loadBarSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "alpha":this.xml.settings.@controlsIconAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.volumeSlider, {"_color":"0x" + this.xml.settings.@controlsIconColor, "alpha":this.xml.settings.@controlsIconAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.bg, {"_color":"0x" + this.xml.settings.@volumeSlideBarColor, "alpha":this.xml.settings.@volumeSlideBarAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.videoControls.fsBtn, {"_color":"0x" + this.xml.settings.@controlsIconColor, "alpha":this.xml.settings.@controlsIconAlpha, "time":0});
                caurina.transitions.Tweener.addTween(this.largeVidPlayBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
                this.videoControls.y = this.videoHolder.y + this.videoHolder.height + 10;
                this.videoControls.x = -(this.videoControls.width + 100);
                this.videoControls.visible = true;
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "time":1, "transition":"easeOutExpo"});
                this.videoControls.playBtn.buttonMode = true;
                this.videoControls.playBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                this.videoControls.playBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                this.videoControls.playBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.playPauseVid, false, 0, true);
                this.videoControls.fsBtn.buttonMode = true;
                this.videoControls.fsBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.fsOver, false, 0, true);
                this.videoControls.fsBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.fsOut, false, 0, true);
                this.videoControls.fsBtn.addEventListener(flash.events.MouseEvent.CLICK, this.toggleFs, false, 0, true);
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
            }
            return;
        }

        public function skipBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function rotatorTimerHandler(arg1:flash.events.TimerEvent):void
        {
            this.removeDesc();
            return;
        }

        public function startIntro():void
        {
            this.introPlaying = true;
            if (this.xml.settings.@videoPath.split(".")[1] == undefined) 
            {
                this.isYoutube = true;
                this.youtubeId = this.xml.settings.@videoPath;
                this.startYouTubeVideo();
            }
            else 
            {
                this.isYoutube = false;
                this.bufferTimer = new flash.utils.Timer(10);
                this.bufferTimer.addEventListener(flash.events.TimerEvent.TIMER, this.onBuffer, false, 0, true);
                this.connection = new flash.net.NetConnection();
                this.connection.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler, false, 0, true);
                this.connection.connect(null);
            }
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

        public function shutVideo():void
        {
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc1:*=getChildByName("skipIntroBtn");
            if (this.vidFullScreen) 
            {
                this.vidFullScreen = false;
                this.bottomVidBg.visible = true;
                this.leftVidBg.visible = true;
                this.videoFSBg.visible = false;
                flash.display.MovieClip(stage.getChildAt(0)).showHeader();
                this.videoHolder.height = this.vidHeight;
                this.videoHolder.width = this.vidHeight * this.videoRatio;
                caurina.transitions.Tweener.addTween(this.videoHolder, {"x":(stage.stageWidth - this.videoHolder.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18, "time":1, "transition":"easeOutExpo"});
                this.leftVidBg.y = (stage.stageHeight - this.leftVidBg.height) / 2 + 15.5;
                this.bottomVidBg.y = stage.stageHeight;
                this.bottomVidBg.x = (stage.stageWidth - this.videoHolder.width) / 2 - 5;
                loc2 = (stage.stageWidth - this.videoHolder.width) / 2 + this.videoHolder.width + 10;
                caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":loc2, "time":1, "transition":"easeOutExpo"});
                loc3 = stage.stageHeight - (stage.stageHeight - this.vidHeight) / 2 - 13;
                caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc3, "time":1, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + this.videoHolder.height + 28, "time":1, "transition":"easeOutExpo", "onComplete":this.shutVideo});
                if (this.bottomVidBg.x >= loc1.width + 10) 
                {
                    caurina.transitions.Tweener.addTween(loc1, {"x":(stage.stageWidth - this.videoHolder.width) / 2 - loc1.width - 10, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18 - 5, "time":1, "transition":"easeOutExpo"});
                }
                else 
                {
                    caurina.transitions.Tweener.addTween(loc1, {"x":(stage.stageWidth - this.videoHolder.width) / 2 + 5, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18 + 5, "time":1, "transition":"easeOutExpo"});
                }
            }
            else 
            {
                this.introPlaying = false;
                if (this.xml.settings.@showControls == "true") 
                {
                    this.vidTimeDisplayTimer.stop();
                    this.vidTimeDisplayTimer = null;
                }
                if (this.isYoutube) 
                {
                    caurina.transitions.Tweener.addTween(this.videoHolder, {"x":-(this.videoHolder.width + 100), "time":1, "transition":"easeOutExpo", "onComplete":this.destroyYoutube});
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
                    caurina.transitions.Tweener.addTween(this.videoHolder, {"x":-(this.videoHolder.width + 100), "time":1, "transition":"easeOutExpo"});
                }
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":-(this.videoControls.width + 100), "time":1, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.buffer, {"x":-(this.videoHolder.width + 100), "time":1, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":0, "time":1, "delay":0.5, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":0, "time":1, "delay":0.5, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(loc1, {"x":-(loc1.width + 100), "time":1, "transition":"easeOutExpo"});
                this.startRotator();
                if (flash.display.MovieClip(stage.getChildAt(0)).musicPausedByUser != true) 
                {
                    flash.display.MovieClip(stage.getChildAt(0)).unPauseMusic();
                }
                flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = false;
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

        public function loadCSS():void
        {
            var loc1:*=new flash.net.URLRequest("styleCSS.css");
            this.cssloader = new flash.net.URLLoader();
            this.cssloader.addEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded, false, 0, true);
            this.cssloader.load(loc1);
            return;
        }

        public function controlsBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function launch():void
        {
            if (this.xml.settings.@playIntro != "true") 
            {
                this.startRotator();
            }
            else 
            {
                flash.display.MovieClip(stage.getChildAt(0)).pauseMusic();
                flash.display.MovieClip(stage.getChildAt(0)).videoPlaying = true;
                this.startIntro();
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

        public function imageLoaded(arg1:flash.events.Event):void
        {
            var loc3:*=undefined;
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=undefined;
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
                var loc7:*;
                loc6.alpha = loc7 = 0;
                loc6.scaleY = loc7 = loc7;
                loc6.scaleX = loc7;
                caurina.transitions.Tweener.addTween(loc6, {"scaleY":1.1, "scaleX":1.1, "delay":loc2 * 0.02, "time":1.5, "transition":"strongEaseOut"});
                caurina.transitions.Tweener.addTween(loc6, {"alpha":1, "time":1.5, "delay":0.2, "transition":"strongEaseOut"});
                caurina.transitions.Tweener.addTween(loc6, {"_Blur_blurX":15, "_Blur_blurY":15, "_Blur_quality":2, "time":0.7, "transition":"linear"});
                caurina.transitions.Tweener.addTween(loc6, {"_Blur_blurX":0, "_Blur_blurY":0, "time":0.7, "delay":0.7, "transition":"linear"});
                ++loc2;
            }
            this.imagesHolder.imageTitleMc.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.imagesHolder.imageTitleMc.txt.htmlText = this.xmlList[this.curImage].title;
            this.imagesHolder.imageTitleMc.bg.width = this.imagesHolder.imageTitleMc.txt.textWidth + 20;
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
            this.imagesHolder.imageDescMc.x = loc7 = this.imageWidth * 2;
            this.imagesHolder.imageTitleMc.x = loc7;
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"x":this.xmlList[this.curImage].title.@Xpos, "alpha":1, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"_Blur_blurX":150, "_Blur_quality":2, "time":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"_Blur_blurX":0, "time":0.2, "delay":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"x":this.xmlList[this.curImage].title.@Xpos, "alpha":1, "time":1, "delay":0.2, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"_Blur_blurX":150, "_Blur_quality":2, "delay":0.2, "time":0.2, "transition":"linear"});
            caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"_Blur_blurX":0, "time":0.2, "delay":0.2, "delay":0.2, "transition":"linear"});
            if (this.isRotating) 
            {
                this.rotatorDelay = Number(this.xmlList[this.curImage].path.@slideShowDelay * 1000);
                this.rotatorTimer = new flash.utils.Timer(this.rotatorDelay, 1);
                this.rotatorTimer.addEventListener(flash.events.TimerEvent.TIMER, this.rotatorTimerHandler, false, 0, true);
                this.rotatorTimer.start();
                this.startTime = flash.utils.getTimer();
                this.imagesHolder.preloader.addEventListener(flash.events.Event.ENTER_FRAME, this.countDown, false, 0, true);
            }
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

        public function rotateImage():void
        {
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

        public function asyncErrorHandler(arg1:flash.events.AsyncErrorEvent):void
        {
            trace(arg1);
            return;
        }

        public function destroyYoutube():void
        {
            this.ytPlayer.destroy();
            this.ytLoader = null;
            this.ytPlayer = null;
            this.ytExists = false;
            this.videoHolder.removeChildAt(0);
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

        public function skipBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0.55, "time":0.5, "transition":"easeOut"});
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
                    if (this.introPlaying) 
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
                    this.bufferTimer.start();
                    break;
                }
                case "NetStream.Seek.InvalidTime":
                {
                    break;
                }
                case "NetStream.Play.Stop":
                {
                    if (this.xml.settings.@playRotator != "true") 
                    {
                        this.stream.pause();
                        this.stream.seek(0);
                        this.bufferTimer.stop();
                        this.videoPaused = true;
                        this.setPlayPauseBtns();
                    }
                    else 
                    {
                        stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.vidScrubUp);
                        this.shutVideo();
                    }
                    break;
                }
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

        public function removeFromStage():void
        {
            var skipIntroBtn:*;

            var loc1:*;
            skipIntroBtn = undefined;
            this.thisIsClosing = true;
            try 
            {
                stage.removeEventListener(flash.events.Event.RESIZE, this.resizeHandler);
                this.xmlLoader = null;
                this.cssloader = null;
                this.mainLoader = null;
                if (this.introPlaying) 
                {
                    if (this.vidTimeDisplayTimer) 
                    {
                        this.vidTimeDisplayTimer.stop();
                        this.vidTimeDisplayTimer = null;
                    }
                    if (this.isYoutube) 
                    {
                        this.destroyYoutube();
                    }
                    else 
                    {
                        this.connection.close();
                        this.connection = null;
                        this.stream.close();
                        this.stream = null;
                        this.video = null;
                        this.bufferTimer.stop();
                        this.bufferTimer = null;
                        caurina.transitions.Tweener.addTween(this.buffer, {"x":-(this.videoHolder.width + 100), "time":1, "transition":"easeOutExpo"});
                    }
                    if (this.xml.settings.@playRotator == "true") 
                    {
                        skipIntroBtn = getChildByName("skipIntroBtn");
                        if (skipIntroBtn == null) 
                        {
                            trace("Skip intro btn hasn\'t been created yet");
                        }
                        else 
                        {
                            caurina.transitions.Tweener.addTween(skipIntroBtn, {"x":-(skipIntroBtn.width + 100), "time":1, "transition":"easeOutExpo"});
                        }
                    }
                    caurina.transitions.Tweener.addTween(this.videoControls, {"x":-(this.videoControls.width + 100), "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.videoHolder, {"x":-(this.videoHolder.width + 100), "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":0, "time":1, "delay":0.5, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":0, "time":1, "delay":0.5, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
                }
                else 
                {
                    this.rotatorTimer.stop();
                    this.rotatorTimer = null;
                    this.imagesHolder.preloader.removeEventListener(flash.events.Event.ENTER_FRAME, this.countDown);
                    caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":stage.stageWidth + 200, "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.imagesHolder.imageDescMc, {"x":stage.stageWidth + 200, "time":1, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.imagesHolder.imageTitleMc, {"x":stage.stageWidth + 200, "time":1, "delay":0.3, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.imagesHolder, {"x":stage.stageWidth + 200, "time":1, "delay":0.4, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.rightBg, {"width":0, "time":1, "delay":0.6, "transition":"easeOutExpo"});
                    caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":0, "time":1, "delay":0.6, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
                }
            }
            catch (err:*)
            {
                trace(err);
            }
            return;
        }

        public function onPlayerError(arg1:flash.events.Event):void
        {
            return;
        }

        public function imageLoading(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=arg1.bytesLoaded / arg1.bytesTotal * 100;
            this.imagesHolder.preloader.width = loc1 * this.imageWidth / 100;
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
            caurina.transitions.properties.FilterShortcuts.init();
            flash.system.Security.allowDomain("www.youtube.com");
            this.buffer.visible = false;
            this.bottomVidBg.visible = false;
            this.leftVidBg.visible = false;
            this.rightBg.visible = false;
            this.leftVidBg.width = 0;
            this.bottomVidBg.height = 0;
            this.rightBg.width = 0;
            this.imagesHolder.myMask.visible = false;
            this.largeVidPlayBtn.visible = false;
            this.imagesHolder.visible = false;
            this.imagesHolder.imageDescMc.alpha = 0;
            this.imagesHolder.imageTitleMc.alpha = 0;
            this.imagesHolder.preloader.alpha = 0;
            this.imagesHolder.preloader.width = 0;
            this.rotatorControls.visible = false;
            this.videoControls.visible = false;
            this.videoFSBg.visible = false;
            this.videoControls.volumeBar.volumeTooltip.visible = false;
            this.skipIntroBtn = new buttonMc();
            this.skipIntroBtn.name = "skipIntroBtn";
            this.mainLoader = new br.com.stimuli.loading.BulkLoader("mainLoader");
            this.thisIsClosing = false;
            this.introPlaying = false;
            this.scrubbingVideo = false;
            this.videoPaused = false;
            this.vidFullScreen = false;
            this.volRect = new flash.geom.Rectangle(-3, -4, 50, 0);
            this.volDraging = false;
            this.curImage = 0;
            this.curImageHolder = this.imagesHolder.imageHolder1;
            this.lastImageHolder = this.imagesHolder.imageHolder2;
            this.isRotating = true;
            this.rotateForward = true;
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            this.ytExists = false;
            return;
        }

        public function onCSSFileLoaded(arg1:flash.events.Event):void
        {
            this.cssloader.removeEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded);
            var loc1:*=new flash.text.StyleSheet();
            loc1.parseCSS(this.cssloader.data);
            this.imagesHolder.imageDescMc.txt.styleSheet = loc1;
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
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

        public function rotateImageHandler(arg1:flash.events.TimerEvent):void
        {
            this.rotateImage();
            return;
        }

        public function onPlayerStateChange(arg1:flash.events.Event):void
        {
            if (Object(arg1).data == "0") 
            {
                if (this.xml.settings.@playRotator != "true") 
                {
                    this.ytPlayer.seekTo(0);
                    this.ytPlayer.stopVideo();
                    this.videoPaused = true;
                    this.setPlayPauseBtns();
                }
                else 
                {
                    this.shutVideo();
                }
            }
            return;
        }

        public function toggleFs(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(this.videoControls.fsBtn.fsIcon, {"scaleX":1, "scaleY":1, "time":0.5, "transition":"easeOut"});
            if (this.vidFullScreen) 
            {
                this.vidFullScreen = false;
            }
            else 
            {
                this.vidFullScreen = true;
            }
            this.setVidSize(this.videoRatio);
            return;
        }

        public function startRotator():void
        {
            this.imageWidth = this.xml.settings.@rotatorImageWidth;
            this.imageHeight = this.xml.settings.@rotatorImageHeight;
            this.imagesHolder.myMask.width = this.imageWidth;
            this.imagesHolder.myMask.height = this.imageHeight;
            this.imagesHolder.preloader.height = this.imageHeight + 10;
            var loc4:*;
            this.imagesHolder.preloader.y = loc4 = -5;
            this.imagesHolder.preloader.x = loc4;
            if (this.xml.settings.@playRotator == "false") 
            {
                this.isRotating = false;
                this.rotatorControls.playBtn.playIcon.alpha = 1;
                this.rotatorControls.playBtn.pauseIcon.alpha = 0;
            }
            this.rotatorTimer = new flash.utils.Timer(1000, 1);
            this.rightBg.height = this.imageHeight + 15;
            this.rightBg.width = 0;
            this.rightBg.x = stage.stageWidth;
            this.rightBg.y = (stage.stageHeight - this.rightBg.height) / 2 + 15.5;
            this.rightBg.visible = true;
            var loc1:*=(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth + 5;
            caurina.transitions.Tweener.addTween(this.rightBg, {"width":loc1, "time":1, "delay":1, "transition":"easeOutExpo"});
            this.bottomVidBg.height = 1;
            this.bottomVidBg.width = Math.round(this.imageWidth + 10);
            this.bottomVidBg.x = (stage.stageWidth - this.imageWidth) / 2;
            this.bottomVidBg.y = stage.stageHeight;
            this.bottomVidBg.visible = true;
            var loc2:*=stage.stageHeight - (stage.stageHeight - this.imageHeight) / 2 - 13;
            caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc2, "time":1, "delay":1.5, "transition":"easeOutExpo"});
            this.imagesHolder.x = (stage.stageWidth - this.imageWidth) / 2 + 5;
            this.imagesHolder.y = (stage.stageHeight - this.imageHeight) / 2 + 18;
            this.imagesHolder.visible = true;
            this.imageLoader = new flash.display.Loader();
            var loc3:*=new flash.utils.Timer(1500, 1);
            loc3.addEventListener(flash.events.TimerEvent.TIMER, this.rotateImageHandler);
            loc3.start();
            caurina.transitions.Tweener.addTween(this.imagesHolder.preloader, {"_color":"0x" + this.xml.settings.@preloaderColor, "alpha":this.xml.settings.@preloaderAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.playBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.nextBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.previousBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.nextBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.playBtn.pauseIcon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.playBtn.playIcon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            caurina.transitions.Tweener.addTween(this.rotatorControls.previousBtn.icon, {"_color":"0x" + this.xml.settings.@controlsIconColor, "time":0});
            this.rotatorControls.x = stage.stageWidth;
            this.rotatorControls.y = (stage.stageHeight - this.imageHeight) / 2 + this.imageHeight - 3;
            this.rotatorControls.playBtn.playIcon.alpha = 0;
            this.rotatorControls.visible = true;
            if (loc1 > this.imageWidth + 85) 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth + 15, "y":(stage.stageHeight - this.imageHeight) / 2 + this.imageHeight - 3, "time":1, "delay":1, "transition":"easeOutExpo"});
            }
            else 
            {
                caurina.transitions.Tweener.addTween(this.rotatorControls, {"x":(stage.stageWidth - this.imageWidth) / 2 + this.imageWidth - 75, "y":(stage.stageHeight - this.imageHeight) / 2 + this.imageHeight - 3, "time":1, "delay":1, "transition":"easeOutExpo"});
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
            return;
        }

        public function setVidSize(arg1:Number):*
        {
            var loc1:*=undefined;
            var loc2:*=NaN;
            var loc3:*=NaN;
            if (this.xml.settings.@playRotator == "true") 
            {
                loc1 = getChildByName("skipIntroBtn");
            }
            if (this.vidFullScreen) 
            {
                this.bottomVidBg.visible = false;
                this.leftVidBg.visible = false;
                this.videoFSBg.visible = true;
                flash.display.MovieClip(stage.getChildAt(0)).hideHeader();
                this.videoHolder.width = stage.stageWidth;
                this.videoHolder.height = stage.stageWidth / arg1;
                this.videoHolder.x = 0;
                this.videoHolder.y = (stage.stageHeight - this.videoHolder.height) / 2;
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":stage.stageHeight - 30, "time":1, "transition":"easeOutExpo"});
                if (this.xml.settings.@playRotator == "true") 
                {
                    caurina.transitions.Tweener.addTween(loc1, {"x":5, "y":5, "time":1, "transition":"easeOutExpo"});
                }
            }
            else 
            {
                this.bottomVidBg.visible = true;
                this.leftVidBg.visible = true;
                this.videoFSBg.visible = false;
                flash.display.MovieClip(stage.getChildAt(0)).showHeader();
                this.videoHolder.height = this.vidHeight;
                this.videoHolder.width = this.vidHeight * arg1;
                caurina.transitions.Tweener.addTween(this.videoHolder, {"x":(stage.stageWidth - this.videoHolder.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18, "time":1, "transition":"easeOutExpo"});
                this.leftVidBg.y = (stage.stageHeight - this.leftVidBg.height) / 2 + 15.5;
                this.bottomVidBg.y = stage.stageHeight;
                this.bottomVidBg.x = (stage.stageWidth - this.videoHolder.width) / 2 - 5;
                loc2 = (stage.stageWidth - this.videoHolder.width) / 2 + this.videoHolder.width + 10;
                caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":loc2, "time":1, "transition":"easeOutExpo"});
                loc3 = stage.stageHeight - (stage.stageHeight - this.vidHeight) / 2 - 13;
                caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc3, "time":1, "transition":"easeOutExpo"});
                caurina.transitions.Tweener.addTween(this.videoControls, {"x":(stage.stageWidth - this.videoControls.width) / 2, "y":(stage.stageHeight - this.videoHolder.height) / 2 + this.videoHolder.height + 28, "time":1, "transition":"easeOutExpo"});
                if (this.xml.settings.@playRotator == "true") 
                {
                    if (this.bottomVidBg.x >= loc1.width + 10) 
                    {
                        caurina.transitions.Tweener.addTween(loc1, {"x":(stage.stageWidth - this.videoHolder.width) / 2 - loc1.width - 10, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18 - 5, "time":1, "transition":"easeOutExpo"});
                    }
                    else 
                    {
                        caurina.transitions.Tweener.addTween(loc1, {"x":(stage.stageWidth - this.videoHolder.width) / 2 + 5, "y":(stage.stageHeight - this.videoHolder.height) / 2 + 18 + 5, "time":1, "transition":"easeOutExpo"});
                    }
                }
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

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xml = new XML(arg1.target.data);
            this.xmlList = this.xml.rotator.image;
            this.numImages = this.xmlList.length();
            caurina.transitions.Tweener.addTween(this.leftVidBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.bottomVidBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.rightBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.buffer.bg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoFSBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.videoControls.volumeBar.volumeTooltip.bg, {"_color":"0x" + this.xml.settings.@volumeTooltipColor, "alpha":this.xml.settings.@volumeTooltipAlpha, "time":0});
            this.videoFSBg.width = stage.stageWidth;
            this.videoFSBg.height = stage.stageHeight;
            this.launch();
            return;
        }

        public function animateVideoBg():void
        {
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=NaN;
            var loc5:*=NaN;
            if (this.isYoutube) 
            {
                this.leftVidBg.height = this.vidHeight + 15;
                this.leftVidBg.width = 0;
                this.leftVidBg.x = 0;
                this.leftVidBg.y = (stage.stageHeight - this.leftVidBg.height) / 2 + 15.5;
                this.leftVidBg.visible = true;
                loc2 = (stage.stageWidth - this.ytWidth) / 2 + this.ytWidth + 10;
                caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":loc2, "time":1, "transition":"easeOutExpo"});
                this.bottomVidBg.height = 0;
                this.bottomVidBg.width = this.ytWidth + 10;
                this.bottomVidBg.x = (stage.stageWidth - this.bottomVidBg.width) / 2;
                this.bottomVidBg.y = stage.stageHeight;
                this.bottomVidBg.visible = true;
                loc3 = stage.stageHeight - (stage.stageHeight - this.vidHeight) / 2 - 13;
                caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc3, "time":1, "delay":0.5, "transition":"easeOutExpo"});
            }
            else 
            {
                this.leftVidBg.height = this.vidHeight + 15;
                this.leftVidBg.width = 0;
                this.leftVidBg.x = 0;
                this.leftVidBg.y = (stage.stageHeight - this.leftVidBg.height) / 2 + 15.5;
                this.leftVidBg.visible = true;
                loc4 = (stage.stageWidth - this.videoHolder.width) / 2 + this.videoHolder.width + 10;
                caurina.transitions.Tweener.addTween(this.leftVidBg, {"width":loc4, "time":1, "transition":"easeOutExpo"});
                this.bottomVidBg.height = 0;
                this.bottomVidBg.width = this.videoHolder.width + 10;
                this.bottomVidBg.x = (stage.stageWidth - this.bottomVidBg.width) / 2;
                this.bottomVidBg.y = stage.stageHeight;
                this.bottomVidBg.visible = true;
                loc5 = stage.stageHeight - (stage.stageHeight - this.vidHeight) / 2 - 13;
                caurina.transitions.Tweener.addTween(this.bottomVidBg, {"height":loc5, "time":1, "delay":0.5, "transition":"easeOutExpo"});
            }
            var loc1:*=new flash.utils.Timer(1500, 1);
            loc1.start();
            loc1.addEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.slideVid);
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

        public function startYouTubeVideo():void
        {
            this.ytLoader = new flash.display.Loader();
            this.ytLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.initializeYouTubeVideo);
            this.ytLoader.contentLoaderInfo.addEventListener("onError", this.onPlayerError);
            this.ytLoader.load(new flash.net.URLRequest("http://www.youtube.com/apiplayer?version=3"));
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
                    this.largeVidPlayBtn.visible = true;
                    this.largeVidPlayBtn.buttonMode = true;
                    this.largeVidPlayBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.controlsBtnOver, false, 0, true);
                    this.largeVidPlayBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.controlsBtnOut, false, 0, true);
                    this.largeVidPlayBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.playPauseVid, false, 0, true);
                    break;
                }
            }
            this.setPlayPauseBtns();
            return;
        }

        public var videoHolder:flash.display.MovieClip;

        public var xmlLoader:flash.net.URLLoader;

        public var xml:XML;

        public var ytLoader:flash.display.Loader;

        public var introPlaying:Boolean;

        public var ytHeight:Number;

        public var imageWidth:Number;

        public var mainLoader:br.com.stimuli.loading.BulkLoader;

        public var thisIsClosing:Boolean;

        public var buffer:flash.display.MovieClip;

        public var vidTimeDisplayTimer:flash.utils.Timer;

        public var imagesHolder:flash.display.MovieClip;

        public var videoLength:*;

        public var imageLoader:flash.display.Loader;

        public var startTime:uint;

        public var videoRatio:Number;

        public var videoControls:flash.display.MovieClip;

        public var xmlList:XMLList;

        public var volRect:flash.geom.Rectangle;

        public var ytExists:Boolean;

        public var ytWidth:Number;

        public var leftVidBg:flash.display.MovieClip;

        public var lastImageHolder:flash.display.MovieClip;

        public var soundTimer:flash.utils.Timer;

        public var videoVolumeTransform:flash.media.SoundTransform;

        public var isYoutube:Boolean;

        public var rotatorControls:flash.display.MovieClip;

        public var numImages:uint;

        public var stream:flash.net.NetStream;

        public var videoPaused:Boolean;

        public var curImageHolder:flash.display.MovieClip;

        public var bottomVidBg:flash.display.MovieClip;

        public var scrubbingVideo:Boolean;

        public var isRotating:Boolean;

        public var youtubeId:String;

        public var largeVidPlayBtn:flash.display.MovieClip;

        public var vidFullScreen:Boolean;

        public var cssloader:flash.net.URLLoader;

        public var loadBarWidth:Number;

        public var imageHeight:Number;

        public var volDraging:Boolean;

        public var ytPlayer:Object;

        public var rotatorDelay:Number;

        public var connection:flash.net.NetConnection;

        public var rotatorTimer:flash.utils.Timer;

        public var rotateForward:Boolean;

        public var video:flash.media.Video;

        public var bufferTimer:flash.utils.Timer;

        public var skipIntroBtn:buttonMc;

        public var vidRect:flash.geom.Rectangle;

        public var videoFSBg:flash.display.MovieClip;

        public var curImage:uint;

        public var rightBg:flash.display.MovieClip;

        public var vidHeight:Number;
    }
}
