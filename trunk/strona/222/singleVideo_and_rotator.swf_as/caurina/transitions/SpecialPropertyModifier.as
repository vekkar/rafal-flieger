package caurina.transitions 
{
    public class SpecialPropertyModifier extends Object
    {
        public function SpecialPropertyModifier(arg1:Function, arg2:Function)
        {
            super();
            this.modifyValues = arg1;
            this.getValue = arg2;
            return;
        }

        public function toString():String
        {
            var loc1:*="";
            loc1 = loc1 + "[SpecialPropertyModifier ";
            loc1 = loc1 + "modifyValues:" + String(this.modifyValues);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "getValue:" + String(this.getValue);
            loc1 = loc1 + "]";
            return loc1;
        }

        public var getValue:Function;

        public var modifyValues:Function;
    }
}
