package caurina.transitions.properties 
{
    import caurina.transitions.*;
    
    public class CurveModifiers extends Object
    {
        public function CurveModifiers()
        {
            super();
            trace("This is an static class and should not be instantiated.");
            return;
        }

        public static function init():void
        {
            caurina.transitions.Tweener.registerSpecialPropertyModifier("_bezier", _bezier_modifier, _bezier_get);
            return;
        }

        public static function _bezier_get(arg1:Number, arg2:Number, arg3:Number, arg4:Array):Number
        {
            var loc1:*=0;
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=NaN;
            if (arg4.length == 1) 
            {
                return arg1 + arg3 * (2 * (1 - arg3) * (arg4[0] - arg1) + arg3 * (arg2 - arg1));
            }
            loc1 = Math.floor(arg3 * arg4.length);
            loc2 = (arg3 - loc1 * 1 / arg4.length) * arg4.length;
            if (loc1 != 0) 
            {
                if (loc1 != (arg4.length - 1)) 
                {
                    loc3 = (arg4[(loc1 - 1)] + arg4[loc1]) / 2;
                    loc4 = (arg4[loc1] + arg4[loc1 + 1]) / 2;
                }
                else 
                {
                    loc3 = (arg4[(loc1 - 1)] + arg4[loc1]) / 2;
                    loc4 = arg2;
                }
            }
            else 
            {
                loc3 = arg1;
                loc4 = (arg4[0] + arg4[1]) / 2;
            }
            return loc3 + loc2 * (2 * (1 - loc2) * (arg4[loc1] - loc3) + loc2 * (loc4 - loc3));
        }

        public static function _bezier_modifier(arg1:*):Array
        {
            var loc2:*=null;
            var loc3:*=0;
            var loc4:*=null;
            var loc1:*=[];
            if (arg1 is Array) 
            {
                loc2 = arg1;
            }
            else 
            {
                loc2 = [arg1];
            }
            var loc5:*={};
            loc3 = 0;
            while (loc3 < loc2.length) 
            {
                var loc6:*=0;
                var loc7:*=loc2[loc3];
                for (loc4 in loc7) 
                {
                    if (loc5[loc4] == undefined) 
                    {
                        loc5[loc4] = [];
                    }
                    loc5[loc4].push(loc2[loc3][loc4]);
                }
                ++loc3;
            }
            loc6 = 0;
            loc7 = loc5;
            for (loc4 in loc7) 
            {
                loc1.push({"name":loc4, "parameters":loc5[loc4]});
            }
            return loc1;
        }
    }
}
