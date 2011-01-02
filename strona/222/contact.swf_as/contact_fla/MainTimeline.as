package contact_fla 
{
    import adobe.utils.*;
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

        public function init(arg1:flash.events.Event):void
        {
            this.removeEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            stage.align = flash.display.StageAlign.TOP_LEFT;
            stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
            stage.addEventListener(flash.events.Event.RESIZE, this.resizeHandler, false, 0, true);
            if (stage.displayState == flash.display.StageDisplayState.FULL_SCREEN) 
            {
                stage.displayState = flash.display.StageDisplayState.NORMAL;
            }
            this.loadCSS();
            if (flash.display.MovieClip(stage.getChildAt(0)).curXML) 
            {
                this.xmlLoader.load(new flash.net.URLRequest(flash.display.MovieClip(stage.getChildAt(0)).curXML));
            }
            else 
            {
                this.xmlLoader.load(new flash.net.URLRequest("xml/contact.xml"));
            }
            return;
        }

        public function sendBtnClicked(arg1:flash.events.MouseEvent):void
        {
            if (this.form.nameInput.text == "" || this.form.emailInput.text == "" || this.form.subjectInput.text == "" || this.form.messageInput.text == "") 
            {
                this.form.errorTxt.text = "You must fill all text fields.";
            }
            else if (this.form.emailInput.text.indexOf("@") < 2 || this.form.emailInput.text.indexOf(".") < 0) 
            {
                this.form.errorTxt.text = "Please enter a valid email address.";
            }
            else 
            {
                this.form.errorTxt.text = "Thank you, your message has been sent.";
                var loc1:*;
                this.form.messageInput.text = loc1 = "";
                this.form.subjectInput.text = loc1 = loc1;
                this.form.emailInput.text = loc1 = loc1;
                this.form.nameInput.text = loc1;
            }
            return;
        }

        public function checkSuccess(arg1:flash.events.Event):void
        {
            var loc1:*=flash.net.URLLoader(arg1.target);
            var loc2:*=new flash.net.URLVariables(loc1.data).status;
            if (loc2 != "success") 
            {
                this.form.errorTxt.text = "Sorry, your message cannot be sent.";
            }
            else 
            {
                this.form.errorTxt.text = "Thank you, your message has been sent.";
                var loc3:*;
                this.form.messageInput.text = loc3 = "";
                this.form.subjectInput.text = loc3 = loc3;
                this.form.emailInput.text = loc3 = loc3;
                this.form.nameInput.text = loc3;
            }
            return;
        }

        public function removeFromStage():void
        {
            this.xmlLoader = null;
            this.cssloader = null;
            stage.removeEventListener(flash.events.Event.RESIZE, this.resizeHandler);
            caurina.transitions.Tweener.addTween(this.form, {"x":-900, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.formBg, {"width":0, "time":1, "delay":0.5, "transition":"easeOutExpo", "onComplete":this.removedFromStage});
            return;
        }

        function frame1():*
        {
            caurina.transitions.properties.ColorShortcuts.init();
            caurina.transitions.properties.CurveModifiers.init();
            flash.system.Security.allowDomain("www.youtube.com");
            this.form.visible = false;
            this.formBg.visible = false;
            this.formBg.width = 0;
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.init);
            this.xmlLoader = new flash.net.URLLoader();
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoaded, false, 0, true);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError, false, 0, true);
            this.formLoader = new flash.net.URLLoader();
            this.phpFileURL = new flash.net.URLRequest("email.php");
            this.phpFileURL.method = flash.net.URLRequestMethod.POST;
            return;
        }

        public function onCSSFileLoaded(arg1:flash.events.Event):void
        {
            this.cssloader.removeEventListener(flash.events.Event.COMPLETE, this.onCSSFileLoaded);
            var loc1:*=new flash.text.StyleSheet();
            loc1.parseCSS(this.cssloader.data);
            this.form.sideTxt.styleSheet = loc1;
            return;
        }

        public function catchIOError(arg1:flash.events.IOErrorEvent):*
        {
            trace("Error caught: " + arg1);
            return;
        }

        public function sendBtnOver(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgOverColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0.55, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function launch():void
        {
            this.formBg.y = (stage.stageHeight - 310) / 2 + 18;
            this.formBg.visible = true;
            caurina.transitions.Tweener.addTween(this.formBg, {"width":(stage.stageWidth - 810) / 2 + 810, "time":1, "transition":"easeOutExpo"});
            this.form.y = (stage.stageHeight - 300) / 2 + 18;
            this.form.x = -900;
            this.form.visible = true;
            caurina.transitions.Tweener.addTween(this.form, {"x":(stage.stageWidth - 810) / 2, "time":1, "delay":0.5, "transition":"easeOutExpo"});
            return;
        }

        public function removedFromStage():void
        {
            flash.display.MovieClip(stage.getChildAt(0)).loadSWF(flash.display.MovieClip(stage.getChildAt(0)).curModule);
            return;
        }

        public function resizeHandler(arg1:flash.events.Event):void
        {
            caurina.transitions.Tweener.addTween(this.formBg, {"y":(stage.stageHeight - 310) / 2 + 18, "width":(stage.stageWidth - 810) / 2 + 810, "time":1, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(this.form, {"x":(stage.stageWidth - 810) / 2, "y":(stage.stageHeight - 300) / 2 + 18, "time":1, "transition":"easeOutExpo", "rounded":true});
            return;
        }

        public function sendBtnOut(arg1:flash.events.MouseEvent):void
        {
            caurina.transitions.Tweener.addTween(arg1.currentTarget.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "time":0.5, "transition":"easeOutExpo"});
            caurina.transitions.Tweener.addTween(arg1.currentTarget.gloss, {"alpha":0, "time":0.5, "transition":"easeOut"});
            return;
        }

        public function xmlLoaded(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoaded);
            this.xmlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, this.catchIOError);
            this.xml = new XML(arg1.target.data);
            caurina.transitions.Tweener.addTween(this.formBg, {"_color":"0x" + this.xml.settings.@bgColor, "alpha":this.xml.settings.@bgAlpha, "time":0});
            caurina.transitions.Tweener.addTween(this.form.inputBg, {"_color":"0x" + this.xml.settings.@txtFieldsBgColor, "alpha":this.xml.settings.@txtFieldsBgAlpha, "time":0});
            this.form.sendBtn.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.form.sendBtn.txt.text = this.xml.settings.@sendLabel;
            caurina.transitions.Tweener.addTween(this.form.sendBtn.bg, {"_color":"0x" + this.xml.settings.@controlsBgColor, "alpha":this.xml.settings.@controlsBgAlpha, "time":0});
            var loc1:*="0x" + this.xml.settings.@controlsIconColor;
            this.form.sendBtn.txt.textColor = loc1;
            var loc2:*;
            this.form.sendBtn.gloss.width = loc2 = this.form.sendBtn.txt.textWidth + 10;
            this.form.sendBtn.bg.width = loc2;
            this.form.sendBtn.txt.x = (this.form.sendBtn.bg.width - this.form.sendBtn.txt.width) / 2;
            this.form.sendBtn.txt.y = (this.form.sendBtn.bg.height - this.form.sendBtn.txt.height) / 2;
            this.form.sendBtn.x = 810 - this.form.sendBtn.bg.width - 20;
            this.form.sendBtn.buttonMode = true;
            this.form.sendBtn.mouseChildren = false;
            this.form.sendBtn.addEventListener(flash.events.MouseEvent.ROLL_OVER, this.sendBtnOver, false, 0, true);
            this.form.sendBtn.addEventListener(flash.events.MouseEvent.ROLL_OUT, this.sendBtnOut, false, 0, true);
            this.form.sendBtn.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.sendBtnClicked, false, 0, true);
            this.form.messageLabel.autoSize = loc2 = flash.text.TextFieldAutoSize.RIGHT;
            this.form.subjectLabel.autoSize = loc2 = loc2;
            this.form.emailLabel.autoSize = loc2 = loc2;
            this.form.nameLabel.autoSize = loc2;
            this.form.nameLabel.text = this.xml.settings.@nameLabel;
            this.form.emailLabel.text = this.xml.settings.@emailLabel;
            this.form.subjectLabel.text = this.xml.settings.@subjectLabel;
            this.form.messageLabel.text = this.xml.settings.@messageLabel;
            this.form.nameLabel.textColor = loc1;
            this.form.emailLabel.textColor = loc1;
            this.form.subjectLabel.textColor = loc1;
            this.form.messageLabel.textColor = loc1;
            this.form.nameInput.textColor = loc1;
            this.form.emailInput.textColor = loc1;
            this.form.subjectInput.textColor = loc1;
            this.form.messageInput.textColor = loc1;
            this.form.errorTxt.textColor = loc1;
            this.form.sideTxt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.form.sideTxt.htmlText = this.xml.textBox;
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

        public var form:flash.display.MovieClip;

        public var xmlLoader:flash.net.URLLoader;

        public var cssloader:flash.net.URLLoader;

        public var xml:XML;

        public var formTimer:flash.utils.Timer;

        public var formBg:flash.display.MovieClip;

        public var formLoader:flash.net.URLLoader;

        public var phpFileURL:flash.net.URLRequest;
    }
}
