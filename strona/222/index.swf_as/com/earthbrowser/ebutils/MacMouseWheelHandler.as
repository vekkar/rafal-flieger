package com.earthbrowser.ebutils 
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    
    public class MacMouseWheelHandler extends Object
    {
        public function MacMouseWheelHandler()
        {
            super();
            return;
        }

        public static function init(arg1:flash.display.Stage):void
        {
            var id:String;
            var stage:flash.display.Stage;

            var loc1:*;
            id = null;
            stage = arg1;
            if (!_init) 
            {
                _init = true;
                stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, function (arg1:flash.events.MouseEvent):void
                {
                    _currItem = flash.display.InteractiveObject(arg1.target);
                    _clonedEvent = flash.events.MouseEvent(arg1);
                    return;
                })
                if (flash.external.ExternalInterface.available) 
                {
                    id = "eb_" + Math.floor(Math.random() * 1000000);
                    flash.external.ExternalInterface.addCallback(id, function ():*
                    {
                        return;
                    })
                    flash.external.ExternalInterface.call(c_jscode);
                    flash.external.ExternalInterface.call("eb.InitMacMouseWheel", id);
                    flash.external.ExternalInterface.addCallback("externalMouseEvent", _externalMouseEvent);
                }
            }
            return;
        }

        internal static function _externalMouseEvent(arg1:Number):void
        {
            if (_currItem && _clonedEvent) 
            {
                _currItem.dispatchEvent(new flash.events.MouseEvent(flash.events.MouseEvent.MOUSE_WHEEL, true, false, _clonedEvent.localX, _clonedEvent.localY, _clonedEvent.relatedObject, _clonedEvent.ctrlKey, _clonedEvent.altKey, _clonedEvent.shiftKey, _clonedEvent.buttonDown, int(arg1)));
            }
            return;
        }

        
        {
            _init = false;
        }

        internal static const c_jscode:XML=new XML("<script><![CDATA[\n\t\tfunction()\n\t\t{\n\t\t\t// create unique namespace\n\t\t\tif(typeof eb == \"undefined\" || !eb)\teb = {};\n\t\t\t\n\t\t\tvar userAgent = navigator.userAgent.toLowerCase();\n\t\t\teb.platform = {\n\t\t\t\twin:/win/.test(userAgent),\n\t\t\t\tmac:/mac/.test(userAgent)\n\t\t\t};\n\t\t\teb.browser = {\n\t\t\t\tversion: (userAgent.match(/.+(?:rv|it|ra|ie)[\\/: ]([\\d.]+)/) || [])[1],\n\t\t\t\tsafari: /webkit/.test(userAgent),\n\t\t\t\topera: /opera/.test(userAgent),\n\t\t\t\tmsie: /msie/.test(userAgent) && !/opera/.test(userAgent),\n\t\t\t\tmozilla: /mozilla/.test(userAgent) && !/(compatible|webkit)/.test(userAgent),\n\t\t\t\tchrome: /chrome/.test(userAgent)\n\t\t\t};\n\t\t\t\n\t\t\t// find the function we added\n\t\t\teb.findSwf = function(id) {\n\t\t\t\tvar objects = document.getElementsByTagName(\"object\");\n\t\t\t\tfor(var i = 0; i < objects.length; i++)\n\t\t\t\t\tif(typeof objects[i][id] != \"undefined\")\n\t\t\t\t\t\treturn objects[i];\n\t\t\t\t\n\t\t\t\tvar embeds = document.getElementsByTagName(\"embed\");\n\t\t\t\tfor(var j = 0; j < embeds.length; j++)\n\t\t\t\t\tif(typeof embeds[j][id] != \"undefined\")\n\t\t\t\t\t\treturn embeds[j];\n\t\t\t\t\t\n\t\t\t\treturn null;\n\t\t\t}\n\t\t\t\n\t\t\teb.InitMacMouseWheel = function(id) {\t\n\t\t\t\tvar swf = eb.findSwf(id);\n\t\t\t\tif(swf && eb.platform.mac) {\n\t\t\t\t\t\n\t\t\t\t\tvar mouseOver = false;\n\n\t\t\t\t\t/// Mouse move detection for mouse wheel support\n\t\t\t\t\tfunction _mousemove(event) {\n\t\t\t\t\t\tmouseOver = event && event.target && (event.target == swf);\n\t\t\t\t\t}\n\n\t\t\t\t\t/// Mousewheel support\n\t\t\t\t\tvar _mousewheel = function(event) {\n\t\t\t\t\t\tif(mouseOver) {\n\t\t\t\t\t\t\tvar delta = 0;\n\t\t\t\t\t\t\tif(event.wheelDelta)\t\tdelta = event.wheelDelta / (eb.browser.opera ? 12 : 120);\n\t\t\t\t\t\t\telse if(event.detail)\t\tdelta = -event.detail;\n\t\t\t\t\t\t\tif(event.preventDefault)\tevent.preventDefault();\n\t\t\t\t\t\t\tswf.externalMouseEvent(delta);\n\t\t\t\t\t\t\treturn true;\n\t\t\t\t\t\t}\n\t\t\t\t\t\treturn false;\n\t\t\t\t\t}\n\n\t\t\t\t\t// install mouse listeners\n\t\t\t\t\tif(typeof window.addEventListener != \'undefined\') {\n\t\t\t\t\t\twindow.addEventListener(\'DOMMouseScroll\', _mousewheel, false);\n\t\t\t\t\t\twindow.addEventListener(\'DOMMouseMove\', _mousemove, false);\n\t\t\t\t\t}\n\t\t\t\t\twindow.onmousewheel = document.onmousewheel = _mousewheel;\n\t\t\t\t\twindow.onmousemove = document.onmousemove = _mousemove;\n\t\t\t\t}\n\t\t\t}\t\n\t\t}\n\t]]></script>");

        internal static var _clonedEvent:flash.events.MouseEvent;

        internal static var _currItem:flash.display.InteractiveObject;

        internal static var _init:Boolean=false;
    }
}
