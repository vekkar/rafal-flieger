package caurina.transitions 
{
    public class SpecialPropertySplitter extends Object
    {
        public function SpecialPropertySplitter(arg1:Function, arg2:Array)
        {
            super();
            this.splitValues = arg1;
            this.parameters = arg2;
            return;
        }

        public function toString():String
        {
            var loc1:*="";
            loc1 = loc1 + "[SpecialPropertySplitter ";
            loc1 = loc1 + "splitValues:" + String(this.splitValues);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "parameters:" + String(this.parameters);
            loc1 = loc1 + "]";
            return loc1;
        }

        public var parameters:Array;

        public var splitValues:Function;
    }
}
