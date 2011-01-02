package caurina.transitions 
{
    public class TweenListObj extends Object
    {
        public function TweenListObj(arg1:Object, arg2:Number, arg3:Number, arg4:Boolean, arg5:Function, arg6:Object)
        {
            super();
            this.scope = arg1;
            this.timeStart = arg2;
            this.timeComplete = arg3;
            this.useFrames = arg4;
            this.transition = arg5;
            this.transitionParams = arg6;
            this.properties = new Object();
            this.isPaused = false;
            this.timePaused = undefined;
            this.isCaller = false;
            this.updatesSkipped = 0;
            this.timesCalled = 0;
            this.skipUpdates = 0;
            this.hasStarted = false;
            return;
        }

        public function toString():String
        {
            var loc3:*=null;
            var loc1:*="\n[TweenListObj ";
            loc1 = loc1 + "scope:" + String(this.scope);
            loc1 = loc1 + ", properties:";
            var loc2:*=true;
            var loc4:*=0;
            var loc5:*=this.properties;
            for (loc3 in loc5) 
            {
                if (!loc2) 
                {
                    loc1 = loc1 + ",";
                }
                loc1 = loc1 + "[name:" + this.properties[loc3].name;
                loc1 = loc1 + ",valueStart:" + this.properties[loc3].valueStart;
                loc1 = loc1 + ",valueComplete:" + this.properties[loc3].valueComplete;
                loc1 = loc1 + "]";
                loc2 = false;
            }
            loc1 = loc1 + ", timeStart:" + String(this.timeStart);
            loc1 = loc1 + ", timeComplete:" + String(this.timeComplete);
            loc1 = loc1 + ", useFrames:" + String(this.useFrames);
            loc1 = loc1 + ", transition:" + String(this.transition);
            loc1 = loc1 + ", transitionParams:" + String(this.transitionParams);
            if (this.skipUpdates) 
            {
                loc1 = loc1 + ", skipUpdates:" + String(this.skipUpdates);
            }
            if (this.updatesSkipped) 
            {
                loc1 = loc1 + ", updatesSkipped:" + String(this.updatesSkipped);
            }
            if (Boolean(this.onStart)) 
            {
                loc1 = loc1 + ", onStart:" + String(this.onStart);
            }
            if (Boolean(this.onUpdate)) 
            {
                loc1 = loc1 + ", onUpdate:" + String(this.onUpdate);
            }
            if (Boolean(this.onComplete)) 
            {
                loc1 = loc1 + ", onComplete:" + String(this.onComplete);
            }
            if (Boolean(this.onOverwrite)) 
            {
                loc1 = loc1 + ", onOverwrite:" + String(this.onOverwrite);
            }
            if (Boolean(this.onError)) 
            {
                loc1 = loc1 + ", onError:" + String(this.onError);
            }
            if (this.onStartParams) 
            {
                loc1 = loc1 + ", onStartParams:" + String(this.onStartParams);
            }
            if (this.onUpdateParams) 
            {
                loc1 = loc1 + ", onUpdateParams:" + String(this.onUpdateParams);
            }
            if (this.onCompleteParams) 
            {
                loc1 = loc1 + ", onCompleteParams:" + String(this.onCompleteParams);
            }
            if (this.onOverwriteParams) 
            {
                loc1 = loc1 + ", onOverwriteParams:" + String(this.onOverwriteParams);
            }
            if (this.onStartScope) 
            {
                loc1 = loc1 + ", onStartScope:" + String(this.onStartScope);
            }
            if (this.onUpdateScope) 
            {
                loc1 = loc1 + ", onUpdateScope:" + String(this.onUpdateScope);
            }
            if (this.onCompleteScope) 
            {
                loc1 = loc1 + ", onCompleteScope:" + String(this.onCompleteScope);
            }
            if (this.onOverwriteScope) 
            {
                loc1 = loc1 + ", onOverwriteScope:" + String(this.onOverwriteScope);
            }
            if (this.onErrorScope) 
            {
                loc1 = loc1 + ", onErrorScope:" + String(this.onErrorScope);
            }
            if (this.rounded) 
            {
                loc1 = loc1 + ", rounded:" + String(this.rounded);
            }
            if (this.isPaused) 
            {
                loc1 = loc1 + ", isPaused:" + String(this.isPaused);
            }
            if (this.timePaused) 
            {
                loc1 = loc1 + ", timePaused:" + String(this.timePaused);
            }
            if (this.isCaller) 
            {
                loc1 = loc1 + ", isCaller:" + String(this.isCaller);
            }
            if (this.count) 
            {
                loc1 = loc1 + ", count:" + String(this.count);
            }
            if (this.timesCalled) 
            {
                loc1 = loc1 + ", timesCalled:" + String(this.timesCalled);
            }
            if (this.waitFrames) 
            {
                loc1 = loc1 + ", waitFrames:" + String(this.waitFrames);
            }
            if (this.hasStarted) 
            {
                loc1 = loc1 + ", hasStarted:" + String(this.hasStarted);
            }
            loc1 = loc1 + "]\n";
            return loc1;
        }

        public static function makePropertiesChain(arg1:Object):Object
        {
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=null;
            var loc5:*=NaN;
            var loc6:*=NaN;
            var loc7:*=NaN;
            var loc1:*=arg1.base;
            if (loc1) 
            {
                loc2 = {};
                if (loc1 is Array) 
                {
                    loc3 = [];
                    loc7 = 0;
                    while (loc7 < loc1.length) 
                    {
                        loc3.push(loc1[loc7]);
                        ++loc7;
                    }
                }
                else 
                {
                    loc3 = [loc1];
                }
                loc3.push(arg1);
                loc5 = loc3.length;
                loc6 = 0;
                while (loc6 < loc5) 
                {
                    if (loc3[loc6]["base"]) 
                    {
                        loc4 = caurina.transitions.AuxFunctions.concatObjects(makePropertiesChain(loc3[loc6]["base"]), loc3[loc6]);
                    }
                    else 
                    {
                        loc4 = loc3[loc6];
                    }
                    loc2 = caurina.transitions.AuxFunctions.concatObjects(loc2, loc4);
                    ++loc6;
                }
                if (loc2["base"]) 
                {
                    delete loc2["base"];
                }
                return loc2;
            }
            return arg1;
        }

        public function clone(arg1:Boolean):caurina.transitions.TweenListObj
        {
            var loc2:*=null;
            var loc1:*=new caurina.transitions.TweenListObj(this.scope, this.timeStart, this.timeComplete, this.useFrames, this.transition, this.transitionParams);
            loc1.properties = new Array();
            var loc3:*=0;
            var loc4:*=this.properties;
            for (loc2 in loc4) 
            {
                loc1.properties[loc2] = this.properties[loc2].clone();
            }
            loc1.skipUpdates = this.skipUpdates;
            loc1.updatesSkipped = this.updatesSkipped;
            if (!arg1) 
            {
                loc1.onStart = this.onStart;
                loc1.onUpdate = this.onUpdate;
                loc1.onComplete = this.onComplete;
                loc1.onOverwrite = this.onOverwrite;
                loc1.onError = this.onError;
                loc1.onStartParams = this.onStartParams;
                loc1.onUpdateParams = this.onUpdateParams;
                loc1.onCompleteParams = this.onCompleteParams;
                loc1.onOverwriteParams = this.onOverwriteParams;
                loc1.onStartScope = this.onStartScope;
                loc1.onUpdateScope = this.onUpdateScope;
                loc1.onCompleteScope = this.onCompleteScope;
                loc1.onOverwriteScope = this.onOverwriteScope;
                loc1.onErrorScope = this.onErrorScope;
            }
            loc1.rounded = this.rounded;
            loc1.isPaused = this.isPaused;
            loc1.timePaused = this.timePaused;
            loc1.isCaller = this.isCaller;
            loc1.count = this.count;
            loc1.timesCalled = this.timesCalled;
            loc1.waitFrames = this.waitFrames;
            loc1.hasStarted = this.hasStarted;
            return loc1;
        }

        public var hasStarted:Boolean;

        public var onUpdate:Function;

        public var useFrames:Boolean;

        public var count:Number;

        public var onOverwriteParams:Array;

        public var timeStart:Number;

        public var timeComplete:Number;

        public var onStartParams:Array;

        public var onUpdateScope:Object;

        public var rounded:Boolean;

        public var onUpdateParams:Array;

        public var properties:Object;

        public var onComplete:Function;

        public var transitionParams:Object;

        public var updatesSkipped:Number;

        public var onStart:Function;

        public var scope:Object;

        public var isCaller:Boolean;

        public var timePaused:Number;

        public var transition:Function;

        public var skipUpdates:Number;

        public var onCompleteParams:Array;

        public var onError:Function;

        public var timesCalled:Number;

        public var onErrorScope:Object;

        public var onOverwrite:Function;

        public var onStartScope:Object;

        public var isPaused:Boolean;

        public var waitFrames:Boolean;

        public var onCompleteScope:Object;

        public var onOverwriteScope:Object;
    }
}
