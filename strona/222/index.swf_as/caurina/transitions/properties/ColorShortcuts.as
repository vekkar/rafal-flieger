package caurina.transitions.properties 
{
    import caurina.transitions.*;
    import flash.filters.*;
    import flash.geom.*;
    
    public class ColorShortcuts extends Object
    {
        public function ColorShortcuts()
        {
            super();
            trace("This is an static class and should not be instantiated.");
            return;
        }

        public static function _color_splitter(arg1:*, arg2:Array):Array
        {
            var loc1:*=new Array();
            if (arg1 != null) 
            {
                loc1.push({"name":"_color_redMultiplier", "value":0});
                loc1.push({"name":"_color_redOffset", "value":caurina.transitions.AuxFunctions.numberToR(arg1)});
                loc1.push({"name":"_color_greenMultiplier", "value":0});
                loc1.push({"name":"_color_greenOffset", "value":caurina.transitions.AuxFunctions.numberToG(arg1)});
                loc1.push({"name":"_color_blueMultiplier", "value":0});
                loc1.push({"name":"_color_blueOffset", "value":caurina.transitions.AuxFunctions.numberToB(arg1)});
            }
            else 
            {
                loc1.push({"name":"_color_redMultiplier", "value":1});
                loc1.push({"name":"_color_redOffset", "value":0});
                loc1.push({"name":"_color_greenMultiplier", "value":1});
                loc1.push({"name":"_color_greenOffset", "value":0});
                loc1.push({"name":"_color_blueMultiplier", "value":1});
                loc1.push({"name":"_color_blueOffset", "value":0});
            }
            return loc1;
        }

        public static function _contrast_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            loc1 = arg2 + 1;
            loc2 = Math.round(arg2 * -128);
            var loc3:*=new flash.geom.ColorTransform(loc1, loc1, loc1, 1, loc2, loc2, loc2, 0);
            arg1.transform.colorTransform = loc3;
            return;
        }

        public static function _brightness_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            var loc1:*=arg2[0];
            var loc2:*=arg1.transform.colorTransform;
            var loc3:*=1 - (loc2.redMultiplier + loc2.greenMultiplier + loc2.blueMultiplier) / 3;
            var loc4:*=(loc2.redOffset + loc2.greenOffset + loc2.blueOffset) / 3;
            if (loc1) 
            {
                return loc4 > 0 ? loc4 / 255 : -loc3;
            }
            return loc4 / 100;
        }

        public static function _saturation_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            var loc1:*=getObjectMatrix(arg1);
            var loc2:*;
            var loc3:*=(loc2 = arg2[0]) ? 1 / 3 : LUMINANCE_R;
            var loc4:*=loc2 ? 1 / 3 : LUMINANCE_G;
            var loc5:*=loc2 ? 1 / 3 : LUMINANCE_B;
            var loc6:*=((loc1[0] - loc3) / (1 - loc3) + (loc1[6] - loc4) / (1 - loc4) + (loc1[12] - loc5) / (1 - loc5)) / 3;
            var loc7:*=1 - (loc1[1] / loc4 + loc1[2] / loc5 + loc1[5] / loc3 + loc1[7] / loc5 + loc1[10] / loc3 + loc1[11] / loc4) / 6;
            return (loc6 + loc7) / 2;
        }

        public static function _oldColor_property_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            return arg1.transform.colorTransform[arg2[0]] * 100;
        }

        public static function _brightness_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc1:*;
            if (loc1 = arg3[0]) 
            {
                loc2 = 1 - Math.abs(arg2);
                loc3 = arg2 > 0 ? Math.round(arg2 * 255) : 0;
            }
            else 
            {
                loc2 = 1;
                loc3 = Math.round(arg2 * 100);
            }
            var loc4:*=new flash.geom.ColorTransform(loc2, loc2, loc2, 1, loc3, loc3, loc3, 0);
            arg1.transform.colorTransform = loc4;
            return;
        }

        public static function _saturation_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            var loc1:*;
            var loc2:*=(loc1 = arg3[0]) ? 1 / 3 : LUMINANCE_R;
            var loc3:*=loc1 ? 1 / 3 : LUMINANCE_G;
            var loc4:*=loc1 ? 1 / 3 : LUMINANCE_B;
            var loc5:*=arg2;
            var loc6:*=1 - loc5;
            var loc7:*=loc2 * loc6;
            var loc8:*=loc3 * loc6;
            var loc9:*=loc4 * loc6;
            var loc10:*=[loc7 + loc5, loc8, loc9, 0, 0, loc7, loc8 + loc5, loc9, 0, 0, loc7, loc8, loc9 + loc5, 0, 0, 0, 0, 0, 1, 0];
            setObjectMatrix(arg1, loc10);
            return;
        }

        internal static function getObjectMatrix(arg1:Object):Array
        {
            var loc1:*=0;
            while (loc1 < arg1.filters.length) 
            {
                if (arg1.filters[loc1] is flash.filters.ColorMatrixFilter) 
                {
                    return arg1.filters[loc1].matrix.concat();
                }
                ++loc1;
            }
            return [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
        }

        public static function getHueDistance(arg1:Array, arg2:Array):Number
        {
            return Math.abs(arg1[0] - arg2[0]) + Math.abs(arg1[1] - arg2[1]) + Math.abs(arg1[2] - arg2[2]);
        }

        public static function _hue_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            setObjectMatrix(arg1, getHueMatrix(arg2));
            return;
        }

        public static function _hue_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            var loc3:*=NaN;
            var loc5:*=NaN;
            var loc1:*=getObjectMatrix(arg1);
            var loc2:*;
            (loc2 = [])[0] = {"angle":-179.9, "matrix":getHueMatrix(-179.9)};
            loc2[1] = {"angle":180, "matrix":getHueMatrix(180)};
            loc3 = 0;
            while (loc3 < loc2.length) 
            {
                loc2[loc3].distance = getHueDistance(loc1, loc2[loc3].matrix);
                ++loc3;
            }
            var loc4:*=15;
            loc3 = 0;
            while (loc3 < loc4) 
            {
                if (loc2[0].distance < loc2[1].distance) 
                {
                    loc5 = 1;
                }
                else 
                {
                    loc5 = 0;
                }
                loc2[loc5].angle = (loc2[0].angle + loc2[1].angle) / 2;
                loc2[loc5].matrix = getHueMatrix(loc2[loc5].angle);
                loc2[loc5].distance = getHueDistance(loc1, loc2[loc5].matrix);
                ++loc3;
            }
            return loc2[loc5].angle;
        }

        public static function getHueMatrix(arg1:Number):Array
        {
            var loc1:*=arg1 * Math.PI / 180;
            var loc2:*=LUMINANCE_R;
            var loc3:*=LUMINANCE_G;
            var loc4:*=LUMINANCE_B;
            var loc5:*=Math.cos(loc1);
            var loc6:*=Math.sin(loc1);
            var loc7:*;
            return loc7 = [loc2 + loc5 * (1 - loc2) + loc6 * (-loc2), loc3 + loc5 * (-loc3) + loc6 * (-loc3), loc4 + loc5 * (-loc4) + loc6 * (1 - loc4), 0, 0, loc2 + loc5 * (-loc2) + loc6 * 0.143, loc3 + loc5 * (1 - loc3) + loc6 * 0.14, loc4 + loc5 * (-loc4) + loc6 * -0.283, 0, 0, loc2 + loc5 * (-loc2) + loc6 * (-(1 - loc2)), loc3 + loc5 * (-loc3) + loc6 * loc3, loc4 + loc5 * (1 - loc4) + loc6 * loc4, 0, 0, 0, 0, 0, 1, 0];
        }

        public static function _color_property_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            return arg1.transform.colorTransform[arg2[0]];
        }

        public static function init():void
        {
            caurina.transitions.Tweener.registerSpecialProperty("_color_ra", _oldColor_property_get, _oldColor_property_set, ["redMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_rb", _color_property_get, _color_property_set, ["redOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_ga", _oldColor_property_get, _oldColor_property_set, ["greenMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_gb", _color_property_get, _color_property_set, ["greenOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_ba", _oldColor_property_get, _oldColor_property_set, ["blueMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_bb", _color_property_get, _color_property_set, ["blueOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_aa", _oldColor_property_get, _oldColor_property_set, ["alphaMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_ab", _color_property_get, _color_property_set, ["alphaOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_redMultiplier", _color_property_get, _color_property_set, ["redMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_redOffset", _color_property_get, _color_property_set, ["redOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_greenMultiplier", _color_property_get, _color_property_set, ["greenMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_greenOffset", _color_property_get, _color_property_set, ["greenOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_blueMultiplier", _color_property_get, _color_property_set, ["blueMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_blueOffset", _color_property_get, _color_property_set, ["blueOffset"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_alphaMultiplier", _color_property_get, _color_property_set, ["alphaMultiplier"]);
            caurina.transitions.Tweener.registerSpecialProperty("_color_alphaOffset", _color_property_get, _color_property_set, ["alphaOffset"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_color", _color_splitter);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_colorTransform", _colorTransform_splitter);
            caurina.transitions.Tweener.registerSpecialProperty("_brightness", _brightness_get, _brightness_set, [false]);
            caurina.transitions.Tweener.registerSpecialProperty("_tintBrightness", _brightness_get, _brightness_set, [true]);
            caurina.transitions.Tweener.registerSpecialProperty("_contrast", _contrast_get, _contrast_set);
            caurina.transitions.Tweener.registerSpecialProperty("_hue", _hue_get, _hue_set);
            caurina.transitions.Tweener.registerSpecialProperty("_saturation", _saturation_get, _saturation_set, [false]);
            caurina.transitions.Tweener.registerSpecialProperty("_dumbSaturation", _saturation_get, _saturation_set, [true]);
            return;
        }

        internal static function setObjectMatrix(arg1:Object, arg2:Array):void
        {
            var loc4:*=null;
            var loc1:*=arg1.filters.concat();
            var loc2:*=false;
            var loc3:*=0;
            while (loc3 < loc1.length) 
            {
                if (loc1[loc3] is flash.filters.ColorMatrixFilter) 
                {
                    loc1[loc3].matrix = arg2.concat();
                    loc2 = true;
                }
                ++loc3;
            }
            if (!loc2) 
            {
                loc4 = new flash.filters.ColorMatrixFilter(arg2);
                loc1[loc1.length] = loc4;
            }
            arg1.filters = loc1;
            return;
        }

        public static function _color_property_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            var loc1:*;
            (loc1 = arg1.transform.colorTransform)[arg3[0]] = arg2;
            arg1.transform.colorTransform = loc1;
            return;
        }

        public static function _oldColor_property_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            var loc1:*;
            (loc1 = arg1.transform.colorTransform)[arg3[0]] = arg2 / 100;
            arg1.transform.colorTransform = loc1;
            return;
        }

        public static function _contrast_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc1:*;
            loc2 = (((loc1 = arg1.transform.colorTransform).redMultiplier + loc1.greenMultiplier + loc1.blueMultiplier) / 3 - 1);
            loc3 = (loc1.redOffset + loc1.greenOffset + loc1.blueOffset) / 3 / -128;
            return (loc2 + loc3) / 2;
        }

        public static function _colorTransform_splitter(arg1:Object, arg2:Array):Array
        {
            var loc1:*=new Array();
            if (arg1 != null) 
            {
                loc1.push({"name":"_color_redMultiplier", "value":arg1.redMultiplier});
                loc1.push({"name":"_color_redOffset", "value":arg1.redOffset});
                loc1.push({"name":"_color_blueMultiplier", "value":arg1.blueMultiplier});
                loc1.push({"name":"_color_blueOffset", "value":arg1.blueOffset});
                loc1.push({"name":"_color_greenMultiplier", "value":arg1.greenMultiplier});
                loc1.push({"name":"_color_greenOffset", "value":arg1.greenOffset});
                loc1.push({"name":"_color_alphaMultiplier", "value":arg1.alphaMultiplier});
                loc1.push({"name":"_color_alphaOffset", "value":arg1.alphaOffset});
            }
            else 
            {
                loc1.push({"name":"_color_redMultiplier", "value":1});
                loc1.push({"name":"_color_redOffset", "value":0});
                loc1.push({"name":"_color_greenMultiplier", "value":1});
                loc1.push({"name":"_color_greenOffset", "value":0});
                loc1.push({"name":"_color_blueMultiplier", "value":1});
                loc1.push({"name":"_color_blueOffset", "value":0});
            }
            return loc1;
        }

        
        {
            LUMINANCE_R = 0.212671;
            LUMINANCE_G = 0.71516;
            LUMINANCE_B = 0.072169;
        }

        internal static var LUMINANCE_B:Number=0.072169;

        internal static var LUMINANCE_G:Number=0.71516;

        internal static var LUMINANCE_R:Number=0.212671;
    }
}
