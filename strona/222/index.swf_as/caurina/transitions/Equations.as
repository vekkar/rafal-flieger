package caurina.transitions 
{
    public class Equations extends Object
    {
        public function Equations()
        {
            super();
            trace("Equations is a static class and should not be instantiated.");
            return;
        }

        public static function easeOutBounce(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            if (loc1 < 1 / 2.75) 
            {
                return arg3 * 7.5625 * arg1 * arg1 + arg2;
            }
            if (arg1 < 2 / 2.75) 
            {
                arg1 = loc1 = arg1 - 1.5 / 2.75;
                return arg3 * (7.5625 * loc1 * arg1 + 0.75) + arg2;
            }
            if (arg1 < 2.5 / 2.75) 
            {
                arg1 = loc1 = arg1 - 2.25 / 2.75;
                return arg3 * (7.5625 * loc1 * arg1 + 0.9375) + arg2;
            }
            arg1 = loc1 = arg1 - 2.625 / 2.75;
            return arg3 * (7.5625 * loc1 * arg1 + 0.984375) + arg2;
        }

        public static function easeInOutElastic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc2:*=NaN;
            if (arg1 == 0) 
            {
                return arg2;
            }
            var loc4:*;
            arg1 = loc4 = arg1 / (arg4 / 2);
            if (loc4 == 2) 
            {
                return arg2 + arg3;
            }
            var loc1:*=!Boolean(arg5) || isNaN(arg5.period) ? arg4 * 0.3 * 1.5 : arg5.period;
            var loc3:*=!Boolean(arg5) || isNaN(arg5.amplitude) ? 0 : arg5.amplitude;
            if (!Boolean(loc3) || loc3 < Math.abs(arg3)) 
            {
                loc3 = arg3;
                loc2 = loc1 / 4;
            }
            else 
            {
                loc2 = loc1 / (2 * Math.PI) * Math.asin(arg3 / loc3);
            }
            if (arg1 < 1) 
            {
                --arg1;
                return -0.5 * loc3 * Math.pow(2, 10 * loc4) * Math.sin((arg1 * arg4 - loc2) * 2 * Math.PI / loc1) + arg2;
            }
            --arg1;
            return loc3 * Math.pow(2, -10 * loc4) * Math.sin((arg1 * arg4 - loc2) * 2 * Math.PI / loc1) * 0.5 + arg3 + arg2;
        }

        public static function easeInOutQuad(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * arg1 * arg1 + arg2;
            }
            return (-arg3) / 2 * (--arg1 * (arg1 - 2) - 1) + arg2;
        }

        public static function easeInOutBounce(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeInBounce(arg1 * 2, 0, arg3, arg4) * 0.5 + arg2;
            }
            return easeOutBounce(arg1 * 2 - arg4, 0, arg3, arg4) * 0.5 + arg3 * 0.5 + arg2;
        }

        public static function easeInOutBack(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*=!Boolean(arg5) || isNaN(arg5.overshoot) ? 1.70158 : arg5.overshoot;
            var loc2:*;
            arg1 = loc2 = arg1 / (arg4 / 2);
            if (loc2 < 1) 
            {
                loc1 = loc2 = loc1 * 1.525;
                return arg3 / 2 * arg1 * arg1 * ((loc2 + 1) * arg1 - loc1) + arg2;
            }
            arg1 = loc2 = arg1 - 2;
            loc1 = loc2 = loc1 * 1.525;
            return arg3 / 2 * (loc2 * arg1 * ((loc2 + 1) * arg1 + loc1) + 2) + arg2;
        }

        public static function easeOutInCubic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutCubic(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInCubic(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeNone(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return arg3 * arg1 / arg4 + arg2;
        }

        public static function easeOutBack(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*=!Boolean(arg5) || isNaN(arg5.overshoot) ? 1.70158 : arg5.overshoot;
            var loc2:*;
            arg1 = loc2 = (arg1 / arg4 - 1);
            return arg3 * (loc2 * arg1 * ((loc1 + 1) * arg1 + loc1) + 1) + arg2;
        }

        public static function easeInOutSine(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return (-arg3) / 2 * (Math.cos(Math.PI * arg1 / arg4) - 1) + arg2;
        }

        public static function easeInBack(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*=!Boolean(arg5) || isNaN(arg5.overshoot) ? 1.70158 : arg5.overshoot;
            var loc2:*;
            arg1 = loc2 = arg1 / arg4;
            return arg3 * loc2 * arg1 * ((loc1 + 1) * arg1 - loc1) + arg2;
        }

        public static function easeInQuart(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return arg3 * loc1 * arg1 * arg1 * arg1 + arg2;
        }

        public static function easeOutInQuint(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutQuint(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInQuint(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeOutInBounce(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutBounce(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInBounce(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function init():void
        {
            caurina.transitions.Tweener.registerTransition("easenone", easeNone);
            caurina.transitions.Tweener.registerTransition("linear", easeNone);
            caurina.transitions.Tweener.registerTransition("easeinquad", easeInQuad);
            caurina.transitions.Tweener.registerTransition("easeoutquad", easeOutQuad);
            caurina.transitions.Tweener.registerTransition("easeinoutquad", easeInOutQuad);
            caurina.transitions.Tweener.registerTransition("easeoutinquad", easeOutInQuad);
            caurina.transitions.Tweener.registerTransition("easeincubic", easeInCubic);
            caurina.transitions.Tweener.registerTransition("easeoutcubic", easeOutCubic);
            caurina.transitions.Tweener.registerTransition("easeinoutcubic", easeInOutCubic);
            caurina.transitions.Tweener.registerTransition("easeoutincubic", easeOutInCubic);
            caurina.transitions.Tweener.registerTransition("easeinquart", easeInQuart);
            caurina.transitions.Tweener.registerTransition("easeoutquart", easeOutQuart);
            caurina.transitions.Tweener.registerTransition("easeinoutquart", easeInOutQuart);
            caurina.transitions.Tweener.registerTransition("easeoutinquart", easeOutInQuart);
            caurina.transitions.Tweener.registerTransition("easeinquint", easeInQuint);
            caurina.transitions.Tweener.registerTransition("easeoutquint", easeOutQuint);
            caurina.transitions.Tweener.registerTransition("easeinoutquint", easeInOutQuint);
            caurina.transitions.Tweener.registerTransition("easeoutinquint", easeOutInQuint);
            caurina.transitions.Tweener.registerTransition("easeinsine", easeInSine);
            caurina.transitions.Tweener.registerTransition("easeoutsine", easeOutSine);
            caurina.transitions.Tweener.registerTransition("easeinoutsine", easeInOutSine);
            caurina.transitions.Tweener.registerTransition("easeoutinsine", easeOutInSine);
            caurina.transitions.Tweener.registerTransition("easeincirc", easeInCirc);
            caurina.transitions.Tweener.registerTransition("easeoutcirc", easeOutCirc);
            caurina.transitions.Tweener.registerTransition("easeinoutcirc", easeInOutCirc);
            caurina.transitions.Tweener.registerTransition("easeoutincirc", easeOutInCirc);
            caurina.transitions.Tweener.registerTransition("easeinexpo", easeInExpo);
            caurina.transitions.Tweener.registerTransition("easeoutexpo", easeOutExpo);
            caurina.transitions.Tweener.registerTransition("easeinoutexpo", easeInOutExpo);
            caurina.transitions.Tweener.registerTransition("easeoutinexpo", easeOutInExpo);
            caurina.transitions.Tweener.registerTransition("easeinelastic", easeInElastic);
            caurina.transitions.Tweener.registerTransition("easeoutelastic", easeOutElastic);
            caurina.transitions.Tweener.registerTransition("easeinoutelastic", easeInOutElastic);
            caurina.transitions.Tweener.registerTransition("easeoutinelastic", easeOutInElastic);
            caurina.transitions.Tweener.registerTransition("easeinback", easeInBack);
            caurina.transitions.Tweener.registerTransition("easeoutback", easeOutBack);
            caurina.transitions.Tweener.registerTransition("easeinoutback", easeInOutBack);
            caurina.transitions.Tweener.registerTransition("easeoutinback", easeOutInBack);
            caurina.transitions.Tweener.registerTransition("easeinbounce", easeInBounce);
            caurina.transitions.Tweener.registerTransition("easeoutbounce", easeOutBounce);
            caurina.transitions.Tweener.registerTransition("easeinoutbounce", easeInOutBounce);
            caurina.transitions.Tweener.registerTransition("easeoutinbounce", easeOutInBounce);
            return;
        }

        public static function easeOutExpo(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return arg1 != arg4 ? arg3 * 1.001 * (-Math.pow(2, -10 * arg1 / arg4) + 1) + arg2 : arg2 + arg3;
        }

        public static function easeOutInBack(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutBack(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInBack(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeInExpo(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return arg1 != 0 ? arg3 * Math.pow(2, 10 * (arg1 / arg4 - 1)) + arg2 - arg3 * 0.001 : arg2;
        }

        public static function easeInCubic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return arg3 * loc1 * arg1 * arg1 + arg2;
        }

        public static function easeInQuint(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return arg3 * loc1 * arg1 * arg1 * arg1 * arg1 + arg2;
        }

        public static function easeInOutCirc(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return (-arg3) / 2 * (Math.sqrt(1 - arg1 * arg1) - 1) + arg2;
            }
            arg1 = loc1 = arg1 - 2;
            return arg3 / 2 * (Math.sqrt(1 - loc1 * arg1) + 1) + arg2;
        }

        public static function easeInQuad(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return arg3 * loc1 * arg1 + arg2;
        }

        public static function easeInBounce(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return arg3 - easeOutBounce(arg4 - arg1, 0, arg3, arg4) + arg2;
        }

        public static function easeOutInExpo(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutExpo(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInExpo(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeOutQuart(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = (arg1 / arg4 - 1);
            return (-arg3) * (loc1 * arg1 * arg1 * arg1 - 1) + arg2;
        }

        public static function easeInSine(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return (-arg3) * Math.cos(arg1 / arg4 * Math.PI / 2) + arg3 + arg2;
        }

        public static function easeInOutQuart(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * arg1 * arg1 * arg1 * arg1 + arg2;
            }
            arg1 = loc1 = arg1 - 2;
            return (-arg3) / 2 * (loc1 * arg1 * arg1 * arg1 - 2) + arg2;
        }

        public static function easeOutQuad(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return (-arg3) * loc1 * (arg1 - 2) + arg2;
        }

        public static function easeOutInElastic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutElastic(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInElastic(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeInElastic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc2:*=NaN;
            if (arg1 == 0) 
            {
                return arg2;
            }
            var loc4:*;
            arg1 = loc4 = arg1 / arg4;
            if (loc4 == 1) 
            {
                return arg2 + arg3;
            }
            var loc1:*=!Boolean(arg5) || isNaN(arg5.period) ? arg4 * 0.3 : arg5.period;
            var loc3:*=!Boolean(arg5) || isNaN(arg5.amplitude) ? 0 : arg5.amplitude;
            if (!Boolean(loc3) || loc3 < Math.abs(arg3)) 
            {
                loc3 = arg3;
                loc2 = loc1 / 4;
            }
            else 
            {
                loc2 = loc1 / (2 * Math.PI) * Math.asin(arg3 / loc3);
            }
            --arg1;
            return -loc3 * Math.pow(2, 10 * loc4) * Math.sin((arg1 * arg4 - loc2) * 2 * Math.PI / loc1) + arg2;
        }

        public static function easeOutCubic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = (arg1 / arg4 - 1);
            return arg3 * (loc1 * arg1 * arg1 + 1) + arg2;
        }

        public static function easeOutQuint(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = (arg1 / arg4 - 1);
            return arg3 * (loc1 * arg1 * arg1 * arg1 * arg1 + 1) + arg2;
        }

        public static function easeOutInQuad(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutQuad(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInQuad(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeOutSine(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            return arg3 * Math.sin(arg1 / arg4 * Math.PI / 2) + arg2;
        }

        public static function easeInOutCubic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * arg1 * arg1 * arg1 + arg2;
            }
            arg1 = loc1 = arg1 - 2;
            return arg3 / 2 * (loc1 * arg1 * arg1 + 2) + arg2;
        }

        public static function easeInOutQuint(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * arg1 * arg1 * arg1 * arg1 * arg1 + arg2;
            }
            arg1 = loc1 = arg1 - 2;
            return arg3 / 2 * (loc1 * arg1 * arg1 * arg1 * arg1 + 2) + arg2;
        }

        public static function easeInCirc(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return (-arg3) * (Math.sqrt(1 - loc1 * arg1) - 1) + arg2;
        }

        public static function easeOutInSine(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutSine(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInSine(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeInOutExpo(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 == 0) 
            {
                return arg2;
            }
            if (arg1 == arg4) 
            {
                return arg2 + arg3;
            }
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * Math.pow(2, 10 * (arg1 - 1)) + arg2 - arg3 * 0.0005;
            }
            return arg3 / 2 * 1.0005 * (-Math.pow(2, -10 * --arg1) + 2) + arg2;
        }

        public static function easeOutElastic(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc2:*=NaN;
            if (arg1 == 0) 
            {
                return arg2;
            }
            var loc4:*;
            arg1 = loc4 = arg1 / arg4;
            if (loc4 == 1) 
            {
                return arg2 + arg3;
            }
            var loc1:*=!Boolean(arg5) || isNaN(arg5.period) ? arg4 * 0.3 : arg5.period;
            var loc3:*=!Boolean(arg5) || isNaN(arg5.amplitude) ? 0 : arg5.amplitude;
            if (!Boolean(loc3) || loc3 < Math.abs(arg3)) 
            {
                loc3 = arg3;
                loc2 = loc1 / 4;
            }
            else 
            {
                loc2 = loc1 / (2 * Math.PI) * Math.asin(arg3 / loc3);
            }
            return loc3 * Math.pow(2, -10 * arg1) * Math.sin((arg1 * arg4 - loc2) * 2 * Math.PI / loc1) + arg3 + arg2;
        }

        public static function easeOutCirc(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            var loc1:*;
            arg1 = loc1 = (arg1 / arg4 - 1);
            return arg3 * Math.sqrt(1 - loc1 * arg1) + arg2;
        }

        public static function easeOutInQuart(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutQuart(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInQuart(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }

        public static function easeOutInCirc(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Object=null):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return easeOutCirc(arg1 * 2, arg2, arg3 / 2, arg4, arg5);
            }
            return easeInCirc(arg1 * 2 - arg4, arg2 + arg3 / 2, arg3 / 2, arg4, arg5);
        }
    }
}
