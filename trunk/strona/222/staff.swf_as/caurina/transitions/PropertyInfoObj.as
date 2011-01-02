package caurina.transitions 
{
    public class PropertyInfoObj extends Object
    {
        public function PropertyInfoObj(arg1:Number, arg2:Number, arg3:Object, arg4:Number, arg5:Object, arg6:Boolean, arg7:Function, arg8:Array)
        {
            super();
            this.valueStart = arg1;
            this.valueComplete = arg2;
            this.originalValueComplete = arg3;
            this.arrayIndex = arg4;
            this.extra = arg5;
            this.isSpecialProperty = arg6;
            this.hasModifier = Boolean(arg7);
            this.modifierFunction = arg7;
            this.modifierParameters = arg8;
            return;
        }

        public function toString():String
        {
            var loc1:*="\n[PropertyInfoObj ";
            loc1 = loc1 + "valueStart:" + String(this.valueStart);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "valueComplete:" + String(this.valueComplete);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "originalValueComplete:" + String(this.originalValueComplete);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "arrayIndex:" + String(this.arrayIndex);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "extra:" + String(this.extra);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "isSpecialProperty:" + String(this.isSpecialProperty);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "hasModifier:" + String(this.hasModifier);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "modifierFunction:" + String(this.modifierFunction);
            loc1 = loc1 + ", ";
            loc1 = loc1 + "modifierParameters:" + String(this.modifierParameters);
            loc1 = loc1 + "]\n";
            return loc1;
        }

        public function clone():caurina.transitions.PropertyInfoObj
        {
            var loc1:*=new caurina.transitions.PropertyInfoObj(this.valueStart, this.valueComplete, this.originalValueComplete, this.arrayIndex, this.extra, this.isSpecialProperty, this.modifierFunction, this.modifierParameters);
            return loc1;
        }

        public var modifierParameters:Array;

        public var isSpecialProperty:Boolean;

        public var valueComplete:Number;

        public var modifierFunction:Function;

        public var extra:Object;

        public var valueStart:Number;

        public var hasModifier:Boolean;

        public var arrayIndex:Number;

        public var originalValueComplete:Object;
    }
}
