package caurina.transitions 
{
    public class AuxFunctions extends Object
    {
        public function AuxFunctions()
        {
            super();
            return;
        }

        public static function getObjectLength(arg1:Object):uint
        {
            var loc2:*=null;
            var loc1:*=0;
            var loc3:*=0;
            var loc4:*=arg1;
            for (loc2 in loc4) 
            {
                ++loc1;
            }
            return loc1;
        }

        public static function numberToG(arg1:Number):Number
        {
            return (arg1 & 65280) >> 8;
        }

        public static function numberToB(arg1:Number):Number
        {
            return arg1 & 255;
        }

        public static function numberToR(arg1:Number):Number
        {
            return (arg1 & 16711680) >> 16;
        }

        public static function concatObjects(... rest):Object
        {
            var loc2:*=null;
            var loc4:*=null;
            var loc1:*={};
            var loc3:*=0;
            while (loc3 < rest.length) 
            {
                loc2 = rest[loc3];
                var loc5:*=0;
                var loc6:*=loc2;
                for (loc4 in loc6) 
                {
                    if (loc2[loc4] == null) 
                    {
                        delete loc1[loc4];
                        continue;
                    }
                    loc1[loc4] = loc2[loc4];
                }
                ++loc3;
            }
            return loc1;
        }
    }
}
