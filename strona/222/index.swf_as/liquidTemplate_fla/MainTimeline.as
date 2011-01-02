package liquidTemplate_fla 
{
    import adobe.utils.*;
    import caurina.transitions.*;
    import caurina.transitions.properties.*;
    import com.earthbrowser.ebutils.*;
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

        public function clearSubmenu():*
        {
            var loc1:*=undefined;
            while (this.header.subMenuHolder.numChildren != 0) 
            {
                loc1 = this.header.subMenuHolder.getChildAt(0);
                this.header.subMenuHolder.removeChild(loc1);
            }
            this.subOpen = false;
            this.curSubOpen = -1;
            return;
        }

        public function loadLogo():void
        {
            this.logoLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.gotLogo, false, 0, true);
            this.logoLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.logoLoader.load(new flash.net.URLRequest(this.xml.settings.@logo));
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

        public function checkSubIndex(arg1:String):*
        {
            var loc3:*=0;
            var loc4:*=0;
            var loc1:*=this.menuList.length();
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                if (this.menuList[loc2].submenu.length() != 0) 
                {
                    loc3 = this.menuList[loc2].submenu.length();
                    loc4 = 0;
                    while (loc4 < loc3) 
                    {
                        if (this.menuList[loc2].submenu[loc4].@page_title.split(" ").join("-").toLowerCase() == arg1) 
                        {
                            return loc4;
                        }
                        ++loc4;
                    }
                }
                ++loc2;
            }
            return undefined;
        }

        public function loadSocialIcons():void
        {
            this.socialLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.socialLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.gotIcon, false, 0, true);
            this.socialLoader.load(new flash.net.URLRequest(this.socialIconList[this.socialCount]));
            return;
        }

        public function socialOut(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=this.footer.getChildByName("tooltip");
            this.footer.removeChild(loc1);
            loc1 = null;
            return;
        }

        public function subReleased(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=0;
            var loc2:*=0;
            var loc3:*=undefined;
            if (this.menuList[this.curSubOpen].submenu[arg1.currentTarget.index].@swf.split("//")[1] == undefined) 
            {
                if (!(this.curSubOpen == this.moduleIndex) || !(arg1.currentTarget.index == this.getSubIndex)) 
                {
                    loc1 = this.header.menuHolder.numChildren;
                    loc2 = 0;
                    while (loc2 < loc1) 
                    {
                        (loc3 = this.header.menuHolder.getChildAt(loc2)).buttonMode = false;
                        loc3.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.menuOver);
                        loc3.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.menuOut);
                        loc3.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.menuReleased);
                        ++loc2;
                    }
                    SWFAddress.setValue(this.menuList[this.curSubOpen].submenu[arg1.currentTarget.index].@page_title.split(" ").join("-").toLowerCase());
                }
            }
            else 
            {
                flash.net.navigateToURL(new flash.net.URLRequest(this.menuList[this.curSubOpen].submenu[arg1.currentTarget.index].@swf), this.xml.settings.@menuExternalURLWindowTarget);
            }
            return;
        }

        public function volumeBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function enableSWFAddress():*
        {
            SWFAddress.addEventListener(SWFAddressEvent.CHANGE, this.handleSWFAddress, false, 0, true);
            return;
        }

        public function checkSubParentIndex(arg1:String):*
        {
            var loc3:*=0;
            var loc4:*=0;
            var loc1:*=this.menuList.length();
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                if (this.menuList[loc2].submenu.length() != 0) 
                {
                    loc3 = this.menuList[loc2].submenu.length();
                    loc4 = 0;
                    while (loc4 < loc3) 
                    {
                        if (this.menuList[loc2].submenu[loc4].@page_title.split(" ").join("-").toLowerCase() == arg1) 
                        {
                            return loc2;
                        }
                        ++loc4;
                    }
                }
                ++loc2;
            }
            return undefined;
        }

        public function connectStream():void
        {
            var client:Object;

            var loc1:*;
            this.stream = new flash.net.NetStream(this.connection);
            this.stream.bufferTime = Number(this.xml.settings.@videoBackgrounBufferTime);
            this.stream.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler, false, 0, true);
            this.stream.addEventListener(flash.events.AsyncErrorEvent.ASYNC_ERROR, this.asyncErrorHandler, false, 0, true);
            client = new Object();
            client.onMetaData = function (arg1:Object):void
            {
                videoRatio = arg1.width / arg1.height;
                setBgVideoToStage();
                videoHolder.visible = true;
                return;
            }
            this.stream.client = client;
            this.video = new flash.media.Video();
            this.video.attachNetStream(this.stream);
            this.video.smoothing = true;
            this.videoHolder.visible = false;
            this.videoHolder.addChild(this.video);
            this.videoVolumeTransform = new flash.media.SoundTransform();
            this.videoVolumeTransform.volume = Number(this.xml.settings.@videoBackgroundVolume);
            this.stream.soundTransform = this.videoVolumeTransform;
            this.buffer.x = (stage.stageWidth - this.buffer.width) / 2;
            this.buffer.y = (stage.stageHeight - this.buffer.height) / 2 + 18;
            this.buffer.visible = true;
            this.stream.play(this.bgImgToLoad);
            return;
        }

        public function alignMenu():void
        {
            this.header.subMenuHolder.visible = false;
            var loc1:*=String(this.xml.settings.@menuAlignment);
            switch (loc1) 
            {
                case "middle":
                {
                    if (this.header.logoHolder.numChildren != 0) 
                    {
                        this.header.menuHolder.x = (stage.stageWidth - this.header.menuHolder.width + this.header.logoHolder.width) / 2 + 10;
                        this.header.logoHolder.x = (stage.stageWidth - this.header.menuHolder.width + this.header.logoHolder.width) / 2 - this.header.logoHolder.width - 10;
                    }
                    else 
                    {
                        this.header.menuHolder.x = (stage.stageWidth - this.header.menuHolder.width) / 2;
                    }
                    break;
                }
                case "right":
                {
                    if (this.header.logoHolder.numChildren != 0) 
                    {
                        this.header.menuHolder.x = stage.stageWidth - this.header.menuHolder.width - 10;
                        this.header.logoHolder.x = stage.stageWidth - this.header.menuHolder.width - this.header.logoHolder.width - 20;
                    }
                    else 
                    {
                        this.header.menuHolder.x = stage.stageWidth - this.header.menuHolder.width - 10;
                    }
                    break;
                }
                case "left":
                {
                    if (this.header.logoHolder.numChildren != 0) 
                    {
                        caurina.transitions.Tweener.addTween(this.header.menuHolder, {"x":this.header.logoHolder.width + 25, "time":1, "transition":"easeOutExpo"});
                        caurina.transitions.Tweener.addTween(this.header.logoHolder, {"x":15, "time":1, "transition":"easeOutExpo"});
                    }
                    break;
                }
            }
            return;
        }

        public function subTimerHandler(arg1:flash.events.TimerEvent):void
        {
            this.clearSubmenu();
            return;
        }

        public function setBgVideoToStage():void
        {
            if (this.videoHolder.height > stage.stageHeight) 
            {
                this.videoHolder.height = stage.stageHeight;
                this.videoHolder.scaleX = this.videoHolder.scaleY;
            }
            if (this.videoHolder.height <= stage.stageHeight) 
            {
                this.videoHolder.height = stage.stageHeight;
                this.videoHolder.scaleX = this.videoHolder.scaleY;
            }
            if (this.videoHolder.width < stage.stageWidth) 
            {
                this.videoHolder.width = stage.stageWidth;
                this.videoHolder.scaleY = this.videoHolder.scaleX;
            }
            this.videoHolder.x = (stage.stageWidth - this.videoHolder.width) / 2;
            this.videoHolder.y = (stage.stageHeight - this.videoHolder.height) / 2;
            this.buffer.x = (stage.stageWidth - this.buffer.width) / 2;
            this.buffer.y = (stage.stageHeight - this.buffer.height) / 2 + 18;
            return;
        }

        public function startYouTubeBg():void
        {
            if (this.ytExists) 
            {
                this.ytPlayer.destroy();
                this.ytLoader = null;
                this.ytPlayer = null;
                this.ytExists = false;
                this.ytHolder.removeChildAt(0);
            }
            this.ytLoader = new flash.display.Loader();
            this.ytLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.initializeYouTubeVideo);
            this.ytLoader.contentLoaderInfo.addEventListener("onError", this.onPlayerError);
            this.ytLoader.load(new flash.net.URLRequest("http://www.youtube.com/apiplayer?version=3"));
            return;
        }

        public function youTubeReady(arg1:flash.events.Event):void
        {
            this.ytLoader.content.removeEventListener("onReady", this.youTubeReady);
            this.ytPlayer = new Object();
            this.ytPlayer = this.ytLoader.content;
            this.ytPlayer.loadVideoById(this.bgImgToLoad, 0, "hd720");
            this.ytPlayer.setSize(stage.stageWidth, stage.stageHeight);
            return;
        }

        public function initializeYouTubeVideo(arg1:flash.events.Event):void
        {
            this.ytLoader.contentLoaderInfo.removeEventListener(flash.events.Event.INIT, this.initializeYouTubeVideo);
            this.ytHolder.addChild(this.ytLoader);
            this.ytExists = true;
            this.ytLoader.content.addEventListener("onReady", this.youTubeReady);
            this.ytLoader.content.addEventListener("onStateChange", this.onPlayerStateChange);
            return;
        }

        public function gotIcon(arg1:flash.events.Event):*
        {
            var loc1:*=arg1.currentTarget.content;
            this.socialLoader.unload();
            var loc2:*=new flash.display.MovieClip();
            loc2.id = this.socialCount;
            loc2.addChild(loc1);
            loc2.x = -loc2.width;
            loc2.alpha = 0;
            loc2.buttonMode = true;
            loc2.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.socialOver, false, 0, true);
            loc2.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.socialOut, false, 0, true);
            loc2.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.socialClicked, false, 0, true);
            this.footer.socialHolder.addChild(loc2);
            caurina.transitions.Tweener.addTween(loc2, {"x":(loc2.width + 5) * this.socialCount, "_bezier":{"x":(loc2.width + 5) * this.socialCount + 50}, "alpha":1, "time":0.7, "delay":this.socialCount * 0.1, "transition":"easeOutExpo"});
            if (this.socialCount < (this.socialIconList.length() - 1)) 
            {
                var loc3:*;
                var loc4:*=((loc3 = this).socialCount + 1);
                loc3.socialCount = loc4;
                this.loadSocialIcons();
            }
            else 
            {
                this.socialLoader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
                this.socialLoader.contentLoaderInfo.removeEventListener(flash.events.Event.INIT, this.gotIcon);
            }
            return;
        }

        public function setBgImgToStage():void
        {
            if (!(this.bgIsSWF && this.swfBgSelfAligns)) 
            {
                if (this.curBgHolder.height > stage.stageHeight) 
                {
                    this.curBgHolder.height = stage.stageHeight;
                    this.curBgHolder.scaleX = this.curBgHolder.scaleY;
                }
                if (this.curBgHolder.height <= stage.stageHeight) 
                {
                    this.curBgHolder.height = stage.stageHeight;
                    this.curBgHolder.scaleX = this.curBgHolder.scaleY;
                }
                if (this.curBgHolder.width < stage.stageWidth) 
                {
                    this.curBgHolder.width = stage.stageWidth;
                    this.curBgHolder.scaleY = this.curBgHolder.scaleX;
                }
                this.curBgHolder.x = (stage.stageWidth - this.curBgHolder.width) / 2;
                this.curBgHolder.y = (stage.stageHeight - this.curBgHolder.height) / 2;
            }
            return;
        }

        public function swfLoaded(arg1:flash.events.Event):void
        {
            var loc4:*=undefined;
            var loc5:*=NaN;
            var loc6:*=NaN;
            var loc7:*=undefined;
            var loc1:*=arg1.target as flash.display.LoaderInfo;
            this.curSWF = loc1.content;
            if (this.swfHolder.numChildren != 0) 
            {
                loc4 = this.swfHolder.getChildAt(0);
                this.swfHolder.removeChild(loc4);
                loc4 = null;
            }
            caurina.transitions.Tweener.addTween(this.curMenu.bg, {"width":this.curMenu.bgW, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.curMenu.menuItemGloss, {"width":this.curMenu.bgW, "time":0.5, "transition":"easeOutExpo"});
            this.swfLoader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.swfLoader.contentLoaderInfo.removeEventListener(flash.events.ProgressEvent.PROGRESS, this.swfLoading);
            this.swfLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.swfLoaded);
            if (!(this.curMenuXMLItem.@selfAlign == "") && this.curMenuXMLItem.@selfAlign == "true") 
            {
                this.swfHolder.x = 0;
                this.swfHolder.y = 0;
                this.swfHolder.alpha = 0;
                caurina.transitions.Tweener.addTween(this.swfHolder, {"alpha":1, "time":1, "transition":"easeOutExpo"});
            }
            else if (!(this.curMenuXMLItem.@selfAlign == "") && this.curMenuXMLItem.@selfAlign == "false") 
            {
                loc5 = Number(this.curMenuXMLItem.@externalWidth);
                loc6 = Number(this.curMenuXMLItem.@externalHeight);
                this.swfHolder.x = (stage.stageWidth - loc5) / 2;
                this.swfHolder.y = (stage.stageHeight - loc6) / 2 + 18;
                this.swfHolder.alpha = 0;
                caurina.transitions.Tweener.addTween(this.swfHolder, {"alpha":1, "time":1, "transition":"easeOutExpo"});
            }
            else 
            {
                this.swfHolder.x = 0;
                this.swfHolder.y = 0;
            }
            this.swfHolder.addChild(arg1.currentTarget.content);
            var loc2:*=this.header.menuHolder.numChildren;
            var loc3:*=0;
            while (loc3 < loc2) 
            {
                (loc7 = this.header.menuHolder.getChildAt(loc3)).buttonMode = true;
                loc7.mouseChildren = false;
                loc7.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.menuOver, false, 0, true);
                loc7.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.menuOut, false, 0, true);
                if (this.menuList[loc3].submenu.length() == 0) 
                {
                    loc7.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.menuReleased, false, 0, true);
                }
                ++loc3;
            }
            return;
        }

        public function toggleFullscreen(arg1:flash.events.MouseEvent):void
        {
            if (stage.displayState != flash.display.StageDisplayState.FULL_SCREEN) 
            {
                stage.displayState = flash.display.StageDisplayState.FULL_SCREEN;
            }
            else 
            {
                stage.displayState = flash.display.StageDisplayState.NORMAL;
            }
            return;
        }

        public function showFooterBtns():*
        {
            var loc1:*=this.footer.getChildByName("fsBtn");
            caurina.transitions.Tweener.addTween(loc1, {"y":0, "time":0.5, "transition":"easeOutExpo"});
            var loc2:*=this.footer.getChildByName("msBtn");
            caurina.transitions.Tweener.addTween(loc2, {"y":0, "time":0.5, "delay":0.2, "transition":"easeOutExpo"});
            return;
        }

        public function subOver(arg1:flash.events.MouseEvent):void
        {
            this.subTimer.stop();
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@submenuButtonsBgOverColor, "alpha":this.xml.settings.@submenuButtonsBgOverAlpha, "y":-5, "scaleY":1.4, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.menuItemGloss, {"alpha":0.55, "y":-5, "scaleY":1.4, "time":1, "transition":"easeOutExpo"});
            return;
        }

        public function bgLoaded(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=undefined;
            caurina.transitions.Tweener.addTween(this.bgPreloader, {"width":0, "time":0.5, "transition":"easeInQuint"});
            this.bgLoader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.bgLoader.contentLoaderInfo.removeEventListener(flash.events.ProgressEvent.PROGRESS, this.bgLoading);
            this.bgLoader.contentLoaderInfo.removeEventListener(flash.events.Event.INIT, this.bgLoaded);
            this.swapImgHolders();
            this.bgImgRatio = this.bgLoader.width / this.bgLoader.height;
            if (this.bgIsSWF) 
            {
                loc1 = this.bgLoader.content as flash.display.MovieClip;
            }
            else 
            {
                loc1 = this.bgLoader.content as flash.display.Bitmap;
                loc1.smoothing = true;
            }
            if (this.curBgHolder.numChildren != 0) 
            {
                loc2 = this.curBgHolder.getChildAt(0);
                this.curBgHolder.removeChild(loc2);
                loc2 = null;
            }
            this.curBgHolder.alpha = 0;
            this.curBgHolder.addChildAt(loc1, 0);
            this.setBgImgToStage();
            caurina.transitions.Tweener.addTween(this.lastBgHolder, {"alpha":0, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.curBgHolder, {"alpha":1, "time":1, "transition":"easeOutExpo"});
            return;
        }

        public function bgLoading(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=arg1.bytesLoaded / arg1.bytesTotal * 100;
            caurina.transitions.Tweener.addTween(this.bgPreloader, {"width":loc1 * stage.stageWidth / 100, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function musicPauseHandler(arg1:flash.events.MouseEvent):void
        {
            if (!this.videoPlaying) 
            {
                if (this.musicPausedByUser) 
                {
                    this.musicPausedByUser = false;
                    this.unPauseMusic();
                }
                else 
                {
                    this.musicPausedByUser = true;
                    this.pauseMusic();
                }
            }
            return;
        }

        public function menuReleased(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=0;
            var loc2:*=0;
            var loc3:*=undefined;
            if (this.menuList[arg1.currentTarget.index].@swf.split("//")[1] == undefined) 
            {
                if (arg1.currentTarget != this.curMenu) 
                {
                    loc1 = this.header.menuHolder.numChildren;
                    loc2 = 0;
                    while (loc2 < loc1) 
                    {
                        (loc3 = this.header.menuHolder.getChildAt(loc2)).buttonMode = false;
                        loc3.removeEventListener(flash.events.MouseEvent.ROLL_OVER, this.menuOver);
                        loc3.removeEventListener(flash.events.MouseEvent.ROLL_OUT, this.menuOut);
                        loc3.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.menuReleased);
                        ++loc2;
                    }
                    SWFAddress.setValue(this.menuList[arg1.currentTarget.index].@page_title.split(" ").join("-").toLowerCase());
                }
            }
            else 
            {
                flash.net.navigateToURL(new flash.net.URLRequest(this.menuList[arg1.currentTarget.index].@swf), this.xml.settings.@menuExternalURLWindowTarget);
            }
            return;
        }

        public function loadSWF(arg1:String):void
        {
            if (this.swfLoader) 
            {
                this.swfLoader.unload();
            }
            this.swfLoader = new flash.display.Loader();
            this.swfLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.swfLoader.contentLoaderInfo.addEventListener(flash.events.ProgressEvent.PROGRESS, this.swfLoading, false, 0, true);
            this.swfLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.swfLoaded, false, 0, true);
            this.swfLoader.load(new flash.net.URLRequest(arg1));
            return;
        }

        public function checkDeepMenuIndex(arg1:String):*
        {
            var loc1:*=this.menuList.length();
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                if (this.menuList[loc2].@page_title.split(" ").join("-").toLowerCase() == arg1) 
                {
                    return loc2;
                }
                ++loc2;
            }
            return undefined;
        }

        public function footerBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function pauseMusic():*
        {
            this.soundPos = Math.round(this.soundChannel.position);
            this.soundChannel.stop();
            this.soundChannel.removeEventListener(flash.events.Event.SOUND_COMPLETE, this.soundComplete);
            this.musicPaused = true;
            var loc1:*=this.footer.getChildByName("msBtn");
            if (this.videoPlaying) 
            {
                loc1.buttonMode = false;
                loc1.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.musicPauseHandler);
            }
            loc1.txt.x = 0;
            loc1.txt.text = this.xml.settings.@soundPausedTxt;
            loc1.txt.x = (loc1.width - loc1.txt.width) / 2 - 2;
            return;
        }

        public function onPlayerError(arg1:flash.events.Event):void
        {
            return;
        }

        public function menuOver(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=0;
            var loc2:*=0;
            var loc3:*=null;
            var loc4:*=undefined;
            this.subTimer.stop();
            if (this.subOpen && !(arg1.currentTarget.index == this.curSubOpen)) 
            {
                this.clearSubmenu();
            }
            this.header.subMenuHolder.visible = true;
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgOverColor, "alpha":this.xml.settings.@menuButtonsBgOverAlpha, "y":-15, "scaleY":2.2, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.menuItemGloss, {"y":-15, "scaleY":2.2, "alpha":0.55, "time":0.5, "transition":"easeOut"});
            if (!(this.menuList[arg1.currentTarget.index].submenu.length() == 0) && !(arg1.currentTarget.index == this.curSubOpen)) 
            {
                loc1 = this.menuList[arg1.currentTarget.index].submenu.length();
                this.header.subMenuHolder.x = arg1.currentTarget.destX + this.header.menuHolder.x;
                loc2 = 0;
                while (loc2 < loc1) 
                {
                    (loc3 = new menuItem()).index = loc2;
                    loc3.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
                    loc3.txt.text = this.menuList[arg1.currentTarget.index].submenu[loc2].@page_title;
                    loc3.bg.width = loc3.txt.textWidth + 10;
                    loc3.menuItemGloss.width = loc3.txt.textWidth + 10;
                    loc4 = "0x" + this.xml.settings.@submenuButtonsTextColor;
                    loc3.txt.textColor = loc4;
                    caurina.transitions.Tweener.addTween(loc3.bg, {"_color":"0x" + this.xml.settings.@submenuButtonsBgColor, "alpha":this.xml.settings.@submenuButtonsBgAlpha, "time":0});
                    loc3.y = -25;
                    loc3.alpha = 0;
                    loc3.destY = loc2 * 30 + 5;
                    this.header.subMenuHolder.addChild(loc3);
                    caurina.transitions.Tweener.addTween(loc3, {"y":loc3.destY, "_bezier":{"y":150}, "alpha":1, "time":0.7, "delay":loc2 * 0.1, "transition":"easeOutExpo"});
                    loc3.buttonMode = true;
                    loc3.mouseChildren = false;
                    loc3.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.subOver, false, 0, true);
                    loc3.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.subOut, false, 0, true);
                    loc3.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.subReleased, false, 0, true);
                    ++loc2;
                }
                this.subOpen = true;
            }
            this.curSubOpen = arg1.currentTarget.index;
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

        public function footerBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgOverColor, "alpha":this.xml.settings.@menuButtonsBgOverAlpha, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0.55, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function unPauseMusic():*
        {
            this.soundChannel = this.snd.play(this.soundPos, 0, this.sdTransform);
            this.soundChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.soundComplete, false, 0, true);
            this.musicPaused = false;
            var loc1:*=this.footer.getChildByName("msBtn");
            loc1.buttonMode = true;
            loc1.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.volumeBtnOver, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.volumeBtnOut, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.musicPauseHandler, false, 0, true);
            loc1.txt.x = 0;
            loc1.txt.text = this.xml.settings.@soundVolumeTxt;
            loc1.txt.x = (loc1.width - loc1.txt.width) / 2 - 2;
            return;
        }

        public function volumeBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgOverColor, "alpha":this.xml.settings.@menuButtonsBgOverAlpha, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0.55, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function setMenu():void
        {
            var loc3:*=null;
            var loc4:*=undefined;
            var loc1:*=this.menuList.length();
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                loc3 = new menuItem();
                loc3.index = loc2;
                loc3.thisSubOpen = 0;
                loc3.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
                loc3.txt.text = this.menuList[loc2].@page_title;
                loc3.bg.width = loc3.txt.textWidth + 10;
                loc3.bgW = loc3.bg.width;
                loc3.menuItemGloss.width = loc3.txt.textWidth + 10;
                loc3.glossW = loc3.menuItemGloss.width;
                loc4 = "0x" + this.xml.settings.@menuButtonsTextColor;
                loc3.txt.textColor = loc4;
                caurina.transitions.Tweener.addTween(loc3.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "time":0});
                loc3.destX = this.nextMenuPos;
                this.nextMenuPos = this.nextMenuPos + Math.round(loc3.bg.width + 5);
                loc3.alpha = 0;
                this.header.menuHolder.addChild(loc3);
                caurina.transitions.Tweener.addTween(loc3, {"x":loc3.destX, "alpha":1, "time":1, "delay":loc2 * 0.1, "transition":"easeOutExpo", "onComplete":this.alignMenu});
                ++loc2;
            }
            this.enableSWFAddress();
            this.subTimer = new flash.utils.Timer(2000, 1);
            this.subTimer.addEventListener(flash.events.TimerEvent.TIMER, this.subTimerHandler, false, 0, true);
            return;
        }

        public function showHeader():*
        {
            caurina.transitions.Tweener.addTween(this.header, {"y":0, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.footer, {"y":stage.stageHeight - 20, "time":0.5, "transition":"easeOutExpo"});
            this.menuHidden = false;
            return;
        }

        public function gotLogo(arg1:flash.events.Event):void
        {
            this.logoLoader.contentLoaderInfo.removeEventListener(flash.events.Event.INIT, this.gotLogo);
            this.logoLoader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            var loc1:*=arg1.currentTarget.content;
            this.header.logoHolder.y = (this.header.height - loc1.height) / 2;
            this.header.logoHolder.x = -loc1.width - 500;
            this.header.logoHolder.addChild(loc1);
            this.alignMenu();
            return;
        }

        public function handleSWFAddress(arg1:SWFAddressEvent):*
        {
            var title:String;
            var e:SWFAddressEvent;

            var loc1:*;
            title = null;
            e = arg1;
            try 
            {
                if (e.value != "/") 
                {
                    this.moduleIndex = this.checkDeepMenuIndex(e.pathNames[0]);
                    if (this.moduleIndex == undefined) 
                    {
                        this.moduleIndex = this.checkSubParentIndex(e.pathNames[0]);
                        this.getSubIndex = this.checkSubIndex(e.pathNames[0]);
                        this.curModule = this.menuList[this.moduleIndex].submenu[this.getSubIndex].@swf;
                        this.curXML = this.menuList[this.moduleIndex].submenu[this.getSubIndex].@xmlPath;
                        this.curMenuXMLItem = this.menuList[this.moduleIndex].submenu[this.getSubIndex];
                        this.bgImgToLoad = this.menuList[this.moduleIndex].submenu[this.getSubIndex].@bgFile;
                        this.bgFileType = this.menuList[this.moduleIndex].submenu[this.getSubIndex].@bgType;
                    }
                    else 
                    {
                        this.curModule = this.menuList[this.moduleIndex].@swf;
                        this.curXML = this.menuList[this.moduleIndex].@xmlPath;
                        this.curMenuXMLItem = this.menuList[this.moduleIndex];
                        this.bgImgToLoad = this.menuList[this.moduleIndex].@bgFile;
                        this.bgFileType = this.menuList[this.moduleIndex].@bgType;
                    }
                    if (this.firstRun) 
                    {
                        this.loadSWF(this.curModule);
                        this.firstRun = false;
                    }
                    else if ("removeFromStage" in this.curSWF) 
                    {
                        this.curSWF.removeFromStage();
                    }
                    else 
                    {
                        caurina.transitions.Tweener.addTween(this.curSWF, {"alpha":0, "time":1, "transition":"easeOutExpo", "onComplete":this.loadSWF(this.curModule)});
                    }
                    if (this.bgImgToLoad != "") 
                    {
                        if (this.ytExists) 
                        {
                            this.ytPlayer.destroy();
                            this.ytLoader = null;
                            this.ytPlayer = null;
                            this.ytExists = false;
                            this.ytHolder.removeChildAt(0);
                            this.videoPlaying = false;
                        }
                        if (this.bgIsVideo) 
                        {
                            this.connection.close();
                            this.connection = null;
                            this.stream.close();
                            this.stream = null;
                            this.video = null;
                            this.bufferTimer.stop();
                            this.bgIsVideo = false;
                            this.videoHolder.visible = false;
                        }
                        loc2 = this.bgFileType;
                        switch (loc2) 
                        {
                            case "image":
                            {
                                this.bgIsSWF = false;
                                this.loadBgImage();
                                if (this.musicPaused && !this.musicPausedByUser) 
                                {
                                    this.unPauseMusic();
                                }
                                break;
                            }
                            case "swf":
                            {
                                this.bgIsSWF = true;
                                if (this.curMenuXMLItem.@bgSwfSelfAlign != "true") 
                                {
                                    this.swfBgSelfAligns = false;
                                }
                                else 
                                {
                                    this.swfBgSelfAligns = true;
                                }
                                this.loadBgImage();
                                if (this.musicPaused && !this.musicPausedByUser) 
                                {
                                    this.unPauseMusic();
                                }
                                break;
                            }
                            case "youtube":
                            {
                                this.curBgHolder.alpha = 0;
                                if (!this.musicPaused) 
                                {
                                    this.pauseMusic();
                                }
                                this.startYouTubeBg();
                                this.videoPlaying = true;
                                break;
                            }
                            case "video":
                            {
                                this.curBgHolder.alpha = 0;
                                if (!this.musicPaused) 
                                {
                                    this.pauseMusic();
                                }
                                this.bufferTimer = new flash.utils.Timer(10);
                                this.bufferTimer.addEventListener(flash.events.TimerEvent.TIMER, this.onBuffer, false, 0, true);
                                this.connection = new flash.net.NetConnection();
                                this.connection.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStatusHandler, false, 0, true);
                                this.connection.connect(null);
                                this.videoPlaying = true;
                                this.bgIsVideo = true;
                                break;
                            }
                        }
                    }
                    if (this.curMenu) 
                    {
                        caurina.transitions.Tweener.addTween(this.curMenu.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "y":0, "scaleY":1, "time":0.5, "transition":"easeOut"});
                        caurina.transitions.Tweener.addTween(this.curMenu.menuItemGloss, {"y":0, "scaleY":1, "alpha":0, "time":0.5, "transition":"easeOutExpo"});
                    }
                    this.curMenu = this.header.menuHolder.getChildAt(this.moduleIndex);
                    caurina.transitions.Tweener.addTween(this.curMenu.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgOverColor, "alpha":this.xml.settings.@menuButtonsBgOverAlpha, "y":-15, "scaleY":2.2, "time":0.5, "transition":"easeOut"});
                    caurina.transitions.Tweener.addTween(this.curMenu.menuItemGloss, {"y":-15, "scaleY":2.2, "alpha":0.55, "time":0.5, "transition":"easeOutExpo"});
                }
                else 
                {
                    SWFAddress.setValue(this.menuList[0].@page_title.split(" ").join("-").toLowerCase());
                }
                title = this.xml.settings.@BroswerPageTitle + ": " + e.pathNames[0];
                SWFAddress.setTitle(title);
            }
            catch (err:*)
            {
            };
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
                    this.buffer.visible = true;
                    this.bufferTimer.start();
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
                    this.stream.seek(0);
                    this.bufferTimer.stop();
                    break;
                }
            }
            return;
        }

        public function asyncErrorHandler(arg1:flash.events.AsyncErrorEvent):void
        {
            trace(arg1);
            return;
        }

        public function loadBgImage():void
        {
            this.bgLoader.unload();
            this.bgLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.bgLoader.contentLoaderInfo.addEventListener(flash.events.ProgressEvent.PROGRESS, this.bgLoading, false, 0, true);
            this.bgLoader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.bgLoaded, false, 0, true);
            this.bgLoader.load(new flash.net.URLRequest(this.bgImgToLoad));
            return;
        }

        public function swfLoading(arg1:flash.events.ProgressEvent):*
        {
            var loc1:*=Math.round(100 - Number(arg1.bytesLoaded / arg1.bytesTotal * 100));
            this.curMenu.bg.width = loc1 * this.curMenu.bgW / 100;
            this.curMenu.menuItemGloss.width = loc1 * this.curMenu.bgW / 100;
            return;
        }

        function frame1():*
        {
            com.earthbrowser.ebutils.MacMouseWheelHandler.init(stage);
            flash.system.Security.allowDomain("www.youtube.com");
            caurina.transitions.properties.ColorShortcuts.init();
            caurina.transitions.properties.CurveModifiers.init();
            stage.align = flash.display.StageAlign.TOP_LEFT;
            stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
            stage.addEventListener(flash.events.Event.RESIZE, this.resizeHandler);
            this.header.visible = false;
            this.buffer.visible = false;
            this.logoLoader = new flash.display.Loader();
            this.socialLoader = new flash.display.Loader();
            this.bgLoader = new flash.display.Loader();
            this.nextMenuPos = 0;
            this.subOpen = false;
            this.curBgHolder = this.bgImgHolder1;
            this.lastBgHolder = this.bgImgHolder2;
            this.snd = new flash.media.Sound();
            this.soundChannel = new flash.media.SoundChannel();
            this.sdTransform = new flash.media.SoundTransform();
            this.firstRun = true;
            this.musicPaused = false;
            this.musicPausedByUser = false;
            this.videoPlaying = false;
            this.menuHidden = false;
            this.bgIsSWF = false;
            this.bgIsVideo = false;
            this.loadCSS();
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.xmlLoader.load(new flash.net.URLRequest("xml/main.xml"));
            this.ytExists = false;
            return;
        }

        public function onCSSFileLoaded(arg1:flash.events.Event):void
        {
            this.cssloader.removeEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded);
            var loc1:*=new flash.text.StyleSheet();
            loc1.parseCSS(this.cssloader.data);
            this.footer.copyrightMc.copyrightTxt.styleSheet = loc1;
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
            return;
        }

        public function soundComplete(arg1:flash.events.Event):void
        {
            this.soundChannel.removeEventListener(flash.events.Event.SOUND_COMPLETE, this.soundComplete);
            this.soundChannel = this.snd.play();
            this.sdTransform = new flash.media.SoundTransform(this.soundVol, 0);
            this.soundChannel.soundTransform = this.sdTransform;
            this.soundChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.soundComplete, false, 0, true);
            return;
        }

        public function socialOver(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=this.socialIconList[arg1.currentTarget.id].@tooltip;
            var loc2:*=new footerBtn();
            loc2.name = "tooltip";
            loc2.gloss.alpha = 0.55;
            caurina.transitions.Tweener.addTween(loc2.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgOverColor, "alpha":this.xml.settings.@menuButtonsBgOverAlpha, "time":0});
            loc2.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            var loc3:*="0x" + this.xml.settings.@menuButtonsTextColor;
            loc2.txt.textColor = loc3;
            loc2.txt.text = loc1;
            var loc4:*;
            loc2.gloss.width = loc4 = loc2.txt.textWidth + 10;
            loc2.bg.width = Math.round(loc4);
            loc2.txt.x = (loc2.bg.width - loc2.txt.width) / 2 - 2;
            loc2.x = mouseX - loc2.width / 2;
            loc2.y = -25;
            this.footer.addChild(loc2);
            return;
        }

        public function hideHeader():*
        {
            caurina.transitions.Tweener.addTween(this.header, {"y":-55, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.footer, {"y":stage.stageHeight, "time":0.5, "transition":"easeOutExpo"});
            this.menuHidden = true;
            return;
        }

        public function subOut(arg1:flash.events.MouseEvent):void
        {
            this.subTimer.start();
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@submenuButtonsBgColor, "alpha":this.xml.settings.@submenuButtonsBgAlpha, "y":0, "scaleY":1, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.menuItemGloss, {"alpha":0, "y":0, "scaleY":1, "time":1, "transition":"easeOutExpo"});
            return;
        }

        public function onPlayerStateChange(arg1:flash.events.Event):void
        {
            if (Object(arg1).data == "0") 
            {
                this.ytPlayer.seekTo(0);
            }
            return;
        }

        public function socialClicked(arg1:flash.events.MouseEvent):void
        {
            var request:flash.net.URLRequest;
            var e:flash.events.MouseEvent;
            var url:String;

            var loc1:*;
            e = arg1;
            url = this.socialIconList[e.currentTarget.id].@url;
            request = new flash.net.URLRequest(url);
            try 
            {
                flash.net.navigateToURL(request, "_blank");
            }
            catch (e:Error)
            {
                trace("Error occurred!");
            }
            return;
        }

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xml = new XML(arg1.target.data);
            this.menuList = this.xml.menu.menuItem;
            this.socialIconList = this.xml.socialIcons.icon;
            caurina.transitions.Tweener.addTween(this.header.bg, {"_color":"0x" + this.xml.settings.@headerBgColor, "time":0});
            caurina.transitions.Tweener.addTween(this.footer.bg, {"_color":"0x" + this.xml.settings.@footerBgColor, "time":0});
            caurina.transitions.Tweener.addTween(this.bgPreloader, {"_color":"0x" + this.xml.settings.@bgPreloaderColor, "alpha":this.xml.settings.@bgPreloaderAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.buffer.bg, {"_color":"0x" + this.xml.settings.@videoBufferBgColor, "alpha":this.xml.settings.@videoBufferBgAlpha, "time":0});
            this.bgPreloader.width = 0;
            this.bgPreloader.height = stage.stageHeight;
            this.footer.y = stage.stageHeight - 20;
            this.header.bg.alpha = this.xml.settings.@headerBgAlpha;
            this.header.bg.width = stage.stageWidth;
            this.header.headerGloss.width = stage.stageWidth;
            this.header.visible = true;
            this.footer.bg.alpha = this.xml.settings.@footerBgAlpha;
            this.footer.bg.width = stage.stageWidth;
            var loc1:*=new footerBtn();
            loc1.name = "fsBtn";
            loc1.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            loc1.txt.text = this.xml.settings.@fullscreenTxt;
            var loc4:*;
            loc1.gloss.width = loc4 = loc1.txt.textWidth + 10;
            loc1.bg.width = loc4;
            loc1.txt.x = (loc1.bg.width - loc1.txt.width) / 2 - 2;
            loc1.x = stage.stageWidth - loc1.width - 10;
            loc1.y = 20;
            var loc2:*="0x" + this.xml.settings.@menuButtonsTextColor;
            loc1.txt.textColor = loc2;
            caurina.transitions.Tweener.addTween(loc1.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "time":0});
            loc1.buttonMode = true;
            loc1.mouseChildren = false;
            loc1.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.footerBtnOver, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.footerBtnOut, false, 0, true);
            loc1.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.toggleFullscreen, false, 0, true);
            this.footer.addChild(loc1);
            var loc3:*;
            (loc3 = new footerBtn()).name = "msBtn";
            loc3.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            loc3.txt.text = this.xml.settings.@soundVolumeTxt;
            loc3.gloss.width = loc4 = loc3.txt.textWidth + 10;
            loc3.bg.width = Math.round(loc4);
            loc3.txt.x = (loc3.bg.width - loc3.txt.width) / 2 - 2;
            loc3.x = Math.round(stage.stageWidth - loc1.width - loc3.width - 15);
            loc3.y = 20;
            loc3.txt.textColor = loc2;
            caurina.transitions.Tweener.addTween(loc3.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "time":0});
            loc3.buttonMode = true;
            loc3.mouseChildren = false;
            loc3.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.volumeBtnOver, false, 0, true);
            loc3.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.volumeBtnOut, false, 0, true);
            loc3.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.musicPauseHandler, false, 0, true);
            this.footer.addChild(loc3);
            this.showFooterBtns();
            this.snd.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.snd.load(new flash.net.URLRequest(this.xml.settings.@songPath));
            this.soundVol = this.xml.settings.@soundVolume;
            this.sdTransform = new flash.media.SoundTransform(this.soundVol, 0);
            this.soundChannel.soundTransform = this.sdTransform;
            if (this.xml.settings.@playMusic != "true") 
            {
                this.musicPausedByUser = true;
                loc3.txt.text = this.xml.settings.@soundPausedTxt;
            }
            else 
            {
                this.soundChannel = this.snd.play();
                this.soundChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.soundComplete, false, 0, true);
            }
            this.footer.copyrightMc.alpha = 0;
            this.footer.copyrightMc.copyrightTxt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.footer.copyrightMc.copyrightTxt.htmlText = this.xml.copyright;
            this.footer.copyrightMc.x = (-this.footer.copyrightMc.width) * 10;
            this.footer.socialHolder.x = this.footer.copyrightMc.width + 15;
            caurina.transitions.Tweener.addTween(this.footer.copyrightMc, {"x":10, "time":0.5, "alpha":1, "transition":"easeOutExpo"});
            this.setMenu();
            this.loadLogo();
            this.loadSocialIcons();
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            var loc3:*=NaN;
            var loc4:*=NaN;
            this.header.bg.width = stage.stageWidth;
            this.header.headerGloss.width = stage.stageWidth;
            if (this.menuHidden) 
            {
                this.footer.y = stage.stageHeight;
            }
            else 
            {
                this.footer.y = stage.stageHeight - 20;
            }
            this.footer.bg.width = stage.stageWidth;
            this.alignMenu();
            this.setBgImgToStage();
            this.bgPreloader.height = stage.stageHeight;
            var loc1:*=this.footer.getChildByName("fsBtn");
            loc1.x = stage.stageWidth - loc1.width - 10;
            var loc2:*=this.footer.getChildByName("msBtn");
            loc2.x = stage.stageWidth - loc1.width - loc2.width - 15;
            if (this.ytExists) 
            {
                this.ytPlayer.setSize(stage.stageWidth, stage.stageHeight);
            }
            if (this.bgIsVideo) 
            {
                this.setBgVideoToStage();
            }
            if (!(this.curMenuXMLItem.@selfAlign == "") && this.curMenuXMLItem.@selfAlign == "false") 
            {
                loc3 = Number(this.curMenuXMLItem.@externalWidth);
                loc4 = Number(this.curMenuXMLItem.@externalHeight);
                this.swfHolder.x = (stage.stageWidth - loc3) / 2;
                this.swfHolder.y = (stage.stageHeight - loc4) / 2 + 18;
            }
            return;
        }

        public function swapImgHolders():void
        {
            this.lastBgHolder = this.curBgHolder;
            if (this.curBgHolder != this.bgImgHolder1) 
            {
                this.curBgHolder = this.bgImgHolder1;
            }
            else 
            {
                this.curBgHolder = this.bgImgHolder2;
            }
            return;
        }

        public function menuOut(arg1:flash.events.MouseEvent):void
        {
            if (arg1.currentTarget != this.curMenu) 
            {
                caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@menuButtonsBgColor, "alpha":this.xml.settings.@menuButtonsBgAlpha, "y":0, "scaleY":1, "time":0.3, "transition":"easeInQuint"});
                caurina.transitions.Tweener.addTween(arg1.currentTarget.menuItemGloss, {"y":0, "scaleY":1, "alpha":0, "time":0.3, "transition":"easeInQuint"});
            }
            this.subTimer.start();
            return;
        }

        public var nextMenuPos:uint;

        public var videoHolder:flash.display.MovieClip;

        public var xmlLoader:flash.net.URLLoader;

        public var curMenuXMLItem:*;

        public var lastBgHolder:*;

        public var sdTransform:flash.media.SoundTransform;

        public var curSWF:Object;

        public var ytLoader:flash.display.Loader;

        public var videoPlaying:Boolean;

        public var swfLoader:flash.display.Loader;

        public var bgFileType:String;

        public var xml:XML;

        public var buffer:flash.display.MovieClip;

        public var swfBgSelfAligns:Boolean;

        public var socialIconList:XMLList;

        public var curSubOpen:int;

        public var videoRatio:Number;

        public var soundVol:Number;

        public var musicPausedByUser:Boolean;

        public var ytExists:Boolean;

        public var bgIsVideo:Boolean;

        public var bgImgRatio:Number;

        public var videoVolumeTransform:flash.media.SoundTransform;

        public var snd:flash.media.Sound;

        public var video:flash.media.Video;

        public var stream:flash.net.NetStream;

        public var header:flash.display.MovieClip;

        public var socialCount:uint;

        public var subOpen:Boolean;

        public var menuList:XMLList;

        public var logoLoader:flash.display.Loader;

        public var bgPreloader:flash.display.MovieClip;

        public var swfHolder:flash.display.MovieClip;

        public var cssloader:flash.net.URLLoader;

        public var ytPlayer:Object;

        public var musicPaused:Boolean;

        public var connection:flash.net.NetConnection;

        public var bgImgToLoad:String;

        public var socialLoader:flash.display.Loader;

        public var curXML:String;

        public var subTimer:flash.utils.Timer;

        public var bgImgHolder1:flash.display.MovieClip;

        public var curModule:String;

        public var menuHidden:Boolean;

        public var bgLoader:flash.display.Loader;

        public var bgIsSWF:Boolean;

        public var bufferTimer:flash.utils.Timer;

        public var getSubIndex:*;

        public var firstRun:Boolean;

        public var soundChannel:flash.media.SoundChannel;

        public var curMenu:*;

        public var footer:flash.display.MovieClip;

        public var ytHolder:flash.display.MovieClip;

        public var soundPos:uint;

        public var moduleIndex:*;

        public var curBgHolder:*;

        public var bgImgHolder2:flash.display.MovieClip;
    }
}
