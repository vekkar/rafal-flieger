package caurina.transitions 
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    
    public class Tweener extends Object
    {
        public function Tweener()
        {
            super();
            trace("Tweener is a static class and should not be instantiated.");
            return;
        }

        public static function registerSpecialPropertyModifier(arg1:String, arg2:Function, arg3:Function):void
        {
            if (!_inited) 
            {
                init();
            }
            var loc1:*=new caurina.transitions.SpecialPropertyModifier(arg2, arg3);
            _specialPropertyModifierList[arg1] = loc1;
            return;
        }

        public static function pauseTweenByIndex(arg1:Number):Boolean
        {
            var loc1:*=_tweenList[arg1];
            if (loc1 == null || loc1.isPaused) 
            {
                return false;
            }
            loc1.timePaused = getCurrentTweeningTime(loc1);
            loc1.isPaused = true;
            return true;
        }

        public static function getCurrentTweeningTime(arg1:Object):Number
        {
            return arg1.useFrames ? _currentTimeFrame : _currentTime;
        }

        public static function registerSpecialProperty(arg1:String, arg2:Function, arg3:Function, arg4:Array=null, arg5:Function=null):void
        {
            if (!_inited) 
            {
                init();
            }
            var loc1:*=new caurina.transitions.SpecialProperty(arg2, arg3, arg4, arg5);
            _specialPropertyList[arg1] = loc1;
            return;
        }

        public static function init(... rest):void
        {
            _inited = true;
            _transitionList = new Object();
            caurina.transitions.Equations.init();
            _specialPropertyList = new Object();
            _specialPropertyModifierList = new Object();
            _specialPropertySplitterList = new Object();
            return;
        }

        internal static function updateTweens():Boolean
        {
            var loc1:*=0;
            if (_tweenList.length == 0) 
            {
                return false;
            }
            loc1 = 0;
            while (loc1 < _tweenList.length) 
            {
                if (_tweenList[loc1] == undefined || !_tweenList[loc1].isPaused) 
                {
                    if (!updateTweenByIndex(loc1)) 
                    {
                        removeTweenByIndex(loc1);
                    }
                    if (_tweenList[loc1] == null) 
                    {
                        removeTweenByIndex(loc1, true);
                        --loc1;
                    }
                }
                ++loc1;
            }
            return true;
        }

        public static function addCaller(arg1:Object=null, arg2:Object=null):Boolean
        {
            var loc1:*=NaN;
            var loc2:*=null;
            var loc6:*=null;
            var loc7:*=null;
            var loc8:*=NaN;
            var loc9:*=null;
            if (!Boolean(arg1)) 
            {
                return false;
            }
            if (arg1 is Array) 
            {
                loc2 = arg1.concat();
            }
            else 
            {
                loc2 = [arg1];
            }
            var loc3:*=arg2;
            if (!_inited) 
            {
                init();
            }
            if (!_engineExists || !Boolean(__tweener_controller__)) 
            {
                startEngine();
            }
            var loc4:*=isNaN(loc3.time) ? 0 : loc3.time;
            var loc5:*=isNaN(loc3.delay) ? 0 : loc3.delay;
            if (typeof loc3.transition != "string") 
            {
                loc6 = loc3.transition;
            }
            else 
            {
                loc9 = loc3.transition.toLowerCase();
                loc6 = _transitionList[loc9];
            }
            if (!Boolean(loc6)) 
            {
                loc6 = _transitionList["easeoutexpo"];
            }
            loc1 = 0;
            while (loc1 < loc2.length) 
            {
                if (loc3.useFrames != true) 
                {
                    loc7 = new caurina.transitions.TweenListObj(loc2[loc1], _currentTime + loc5 * 1000 / _timeScale, _currentTime + (loc5 * 1000 + loc4 * 1000) / _timeScale, false, loc6, loc3.transitionParams);
                }
                else 
                {
                    loc7 = new caurina.transitions.TweenListObj(loc2[loc1], _currentTimeFrame + loc5 / _timeScale, _currentTimeFrame + (loc5 + loc4) / _timeScale, true, loc6, loc3.transitionParams);
                }
                loc7.properties = null;
                loc7.onStart = loc3.onStart;
                loc7.onUpdate = loc3.onUpdate;
                loc7.onComplete = loc3.onComplete;
                loc7.onOverwrite = loc3.onOverwrite;
                loc7.onStartParams = loc3.onStartParams;
                loc7.onUpdateParams = loc3.onUpdateParams;
                loc7.onCompleteParams = loc3.onCompleteParams;
                loc7.onOverwriteParams = loc3.onOverwriteParams;
                loc7.onStartScope = loc3.onStartScope;
                loc7.onUpdateScope = loc3.onUpdateScope;
                loc7.onCompleteScope = loc3.onCompleteScope;
                loc7.onOverwriteScope = loc3.onOverwriteScope;
                loc7.onErrorScope = loc3.onErrorScope;
                loc7.isCaller = true;
                loc7.count = loc3.count;
                loc7.waitFrames = loc3.waitFrames;
                _tweenList.push(loc7);
                if (loc4 == 0 && loc5 == 0) 
                {
                    loc8 = (_tweenList.length - 1);
                    updateTweenByIndex(loc8);
                    removeTweenByIndex(loc8);
                }
                ++loc1;
            }
            return true;
        }

        public static function getTweenCount(arg1:Object):Number
        {
            var loc1:*=0;
            if (!Boolean(_tweenList)) 
            {
                return 0;
            }
            var loc2:*=0;
            loc1 = 0;
            while (loc1 < _tweenList.length) 
            {
                if (Boolean(_tweenList[loc1]) && _tweenList[loc1].scope == arg1) 
                {
                    loc2 = loc2 + caurina.transitions.AuxFunctions.getObjectLength(_tweenList[loc1].properties);
                }
                ++loc1;
            }
            return loc2;
        }

        public static function pauseAllTweens():Boolean
        {
            var loc2:*=0;
            if (!Boolean(_tweenList)) 
            {
                return false;
            }
            var loc1:*=false;
            loc2 = 0;
            while (loc2 < _tweenList.length) 
            {
                pauseTweenByIndex(loc2);
                loc1 = true;
                ++loc2;
            }
            return loc1;
        }

        public static function removeTweens(arg1:Object, ... rest):Boolean
        {
            var loc2:*=0;
            var loc3:*=null;
            var loc4:*=null;
            var loc5:*=0;
            var loc1:*=new Array();
            loc2 = 0;
            while (loc2 < rest.length) 
            {
                if (typeof rest[loc2] == "string" && loc1.indexOf(rest[loc2]) == -1) 
                {
                    if (_specialPropertySplitterList[rest[loc2]]) 
                    {
                        loc4 = (loc3 = _specialPropertySplitterList[rest[loc2]]).splitValues(arg1, null);
                        loc5 = 0;
                        while (loc5 < loc4.length) 
                        {
                            loc1.push(loc4[loc5].name);
                            ++loc5;
                        }
                    }
                    else 
                    {
                        loc1.push(rest[loc2]);
                    }
                }
                ++loc2;
            }
            return affectTweens(removeTweenByIndex, arg1, loc1);
        }

        internal static function stopEngine():void
        {
            _engineExists = false;
            _tweenList = null;
            _currentTime = 0;
            _currentTimeFrame = 0;
            __tweener_controller__.removeEventListener(flash.events.Event.ENTER_FRAME, caurina.transitions.Tweener.onEnterFrame);
            __tweener_controller__ = null;
            return;
        }

        public static function removeTweensByTime(arg1:Object, arg2:Object, arg3:Number, arg4:Number):Boolean
        {
            var removed:Boolean;
            var p_properties:Object;
            var p_scope:Object;
            var p_timeStart:Number;
            var i:uint;
            var p_timeComplete:Number;
            var removedLocally:Boolean;
            var eventScope:Object;
            var pName:String;
            var tl:uint;

            var loc1:*;
            removedLocally = false;
            i = 0;
            pName = null;
            eventScope = null;
            p_scope = arg1;
            p_properties = arg2;
            p_timeStart = arg3;
            p_timeComplete = arg4;
            removed = false;
            tl = _tweenList.length;
            i = 0;
            while (i < tl) 
            {
                if (Boolean(_tweenList[i]) && p_scope == _tweenList[i].scope) 
                {
                    if (p_timeComplete > _tweenList[i].timeStart && p_timeStart < _tweenList[i].timeComplete) 
                    {
                        removedLocally = false;
                        var loc2:*=0;
                        var loc3:*=_tweenList[i].properties;
                        for (pName in loc3) 
                        {
                            if (!Boolean(p_properties[pName])) 
                            {
                                continue;
                            }
                            if (Boolean(_tweenList[i].onOverwrite)) 
                            {
                                eventScope = Boolean(_tweenList[i].onOverwriteScope) ? _tweenList[i].onOverwriteScope : _tweenList[i].scope;
                                try 
                                {
                                    _tweenList[i].onOverwrite.apply(eventScope, _tweenList[i].onOverwriteParams);
                                }
                                catch (e:Error)
                                {
                                    handleError(_tweenList[i], e, "onOverwrite");
                                }
                            }
                            _tweenList[i].properties[pName] = undefined;
                            delete _tweenList[i].properties[pName];
                            removedLocally = true;
                            removed = true;
                        }
                        if (removedLocally) 
                        {
                            if (caurina.transitions.AuxFunctions.getObjectLength(_tweenList[i].properties) == 0) 
                            {
                                removeTweenByIndex(i);
                            }
                        }
                    }
                }
                ++i;
            }
            return removed;
        }

        public static function updateFrame():void
        {
            var loc1:*;
            _currentTimeFrame++;
            return;
        }

        public static function registerSpecialPropertySplitter(arg1:String, arg2:Function, arg3:Array=null):void
        {
            if (!_inited) 
            {
                init();
            }
            var loc1:*=new caurina.transitions.SpecialPropertySplitter(arg2, arg3);
            _specialPropertySplitterList[arg1] = loc1;
            return;
        }

        public static function splitTweens(arg1:Number, arg2:Array):uint
        {
            var loc3:*=0;
            var loc4:*=null;
            var loc5:*=false;
            var loc1:*=_tweenList[arg1];
            var loc2:*=loc1.clone(false);
            loc3 = 0;
            while (loc3 < arg2.length) 
            {
                loc4 = arg2[loc3];
                if (Boolean(loc1.properties[loc4])) 
                {
                    loc1.properties[loc4] = undefined;
                    delete loc1.properties[loc4];
                }
                ++loc3;
            }
            var loc6:*=0;
            var loc7:*=loc2.properties;
            for (loc4 in loc7) 
            {
                loc5 = false;
                loc3 = 0;
                while (loc3 < arg2.length) 
                {
                    if (arg2[loc3] == loc4) 
                    {
                        loc5 = true;
                        break;
                    }
                    ++loc3;
                }
                if (loc5) 
                {
                    continue;
                }
                loc2.properties[loc4] = undefined;
                delete loc2.properties[loc4];
            }
            _tweenList.push(loc2);
            return (_tweenList.length - 1);
        }

        public static function removeTweenByIndex(arg1:Number, arg2:Boolean=false):Boolean
        {
            _tweenList[arg1] = null;
            if (arg2) 
            {
                _tweenList.splice(arg1, 1);
            }
            return true;
        }

        public static function resumeTweens(arg1:Object, ... rest):Boolean
        {
            var loc2:*=0;
            var loc1:*=new Array();
            loc2 = 0;
            while (loc2 < rest.length) 
            {
                if (typeof rest[loc2] == "string" && loc1.indexOf(rest[loc2]) == -1) 
                {
                    loc1.push(rest[loc2]);
                }
                ++loc2;
            }
            return affectTweens(resumeTweenByIndex, arg1, loc1);
        }

        public static function resumeTweenByIndex(arg1:Number):Boolean
        {
            var loc1:*=_tweenList[arg1];
            if (loc1 == null || !loc1.isPaused) 
            {
                return false;
            }
            var loc2:*=getCurrentTweeningTime(loc1);
            loc1.timeStart = loc1.timeStart + loc2 - loc1.timePaused;
            loc1.timeComplete = loc1.timeComplete + loc2 - loc1.timePaused;
            loc1.timePaused = undefined;
            loc1.isPaused = false;
            return true;
        }

        public static function pauseTweens(arg1:Object, ... rest):Boolean
        {
            var loc2:*=0;
            var loc1:*=new Array();
            loc2 = 0;
            while (loc2 < rest.length) 
            {
                if (typeof rest[loc2] == "string" && loc1.indexOf(rest[loc2]) == -1) 
                {
                    loc1.push(rest[loc2]);
                }
                ++loc2;
            }
            return affectTweens(pauseTweenByIndex, arg1, loc1);
        }

        public static function getVersion():String
        {
            return "AS3 1.33.74";
        }

        
        {
            _engineExists = false;
            _inited = false;
            _timeScale = 1;
            autoOverwrite = true;
        }

        public static function onEnterFrame(arg1:flash.events.Event):void
        {
            updateTime();
            updateFrame();
            var loc1:*=false;
            loc1 = updateTweens();
            if (!loc1) 
            {
                stopEngine();
            }
            return;
        }

        public static function updateTime():void
        {
            _currentTime = flash.utils.getTimer();
            return;
        }

        internal static function updateTweenByIndex(arg1:Number):Boolean
        {
            var tScope:Object;
            var nv:Number;
            var pv:Number;
            var cTime:Number;
            var eventScope:Object;
            var pName:String;
            var isOver:Boolean;
            var b:Number;
            var c:Number;
            var i:Number;
            var tTweening:caurina.transitions.TweenListObj;
            var tProperty:Object;
            var mustUpdate:Boolean;
            var d:Number;
            var t:Number;

            var loc1:*;
            tTweening = null;
            mustUpdate = false;
            nv = NaN;
            t = NaN;
            b = NaN;
            c = NaN;
            d = NaN;
            pName = null;
            eventScope = null;
            tScope = null;
            tProperty = null;
            pv = NaN;
            i = arg1;
            tTweening = _tweenList[i];
            if (tTweening == null || !Boolean(tTweening.scope)) 
            {
                return false;
            }
            isOver = false;
            cTime = getCurrentTweeningTime(tTweening);
            if (cTime >= tTweening.timeStart) 
            {
                tScope = tTweening.scope;
                if (tTweening.isCaller) 
                {
                    do 
                    {
                        t = (tTweening.timeComplete - tTweening.timeStart) / tTweening.count * (tTweening.timesCalled + 1);
                        b = tTweening.timeStart;
                        c = tTweening.timeComplete - tTweening.timeStart;
                        d = tTweening.timeComplete - tTweening.timeStart;
                        nv = tTweening.transition(t, b, c, d);
                        if (cTime >= nv) 
                        {
                            if (Boolean(tTweening.onUpdate)) 
                            {
                                eventScope = Boolean(tTweening.onUpdateScope) ? tTweening.onUpdateScope : tScope;
                                try 
                                {
                                    tTweening.onUpdate.apply(eventScope, tTweening.onUpdateParams);
                                }
                                catch (e1:Error)
                                {
                                    handleError(tTweening, e1, "onUpdate");
                                }
                            }
                            var loc3:*=((loc2 = tTweening).timesCalled + 1);
                            loc2.timesCalled = loc3;
                            if (tTweening.timesCalled >= tTweening.count) 
                            {
                                isOver = true;
                                break;
                            }
                            if (tTweening.waitFrames) 
                            {
                                break;
                            }
                        }
                    }
                    while (cTime >= nv);
                }
                else 
                {
                    mustUpdate = tTweening.skipUpdates < 1 || !tTweening.skipUpdates || tTweening.updatesSkipped >= tTweening.skipUpdates;
                    if (cTime >= tTweening.timeComplete) 
                    {
                        isOver = true;
                        mustUpdate = true;
                    }
                    if (!tTweening.hasStarted) 
                    {
                        if (Boolean(tTweening.onStart)) 
                        {
                            eventScope = Boolean(tTweening.onStartScope) ? tTweening.onStartScope : tScope;
                            try 
                            {
                                tTweening.onStart.apply(eventScope, tTweening.onStartParams);
                            }
                            catch (e2:Error)
                            {
                                handleError(tTweening, e2, "onStart");
                            }
                        }
                        loc2 = 0;
                        loc3 = tTweening.properties;
                        for (pName in loc3) 
                        {
                            if (tTweening.properties[pName].isSpecialProperty) 
                            {
                                if (Boolean(_specialPropertyList[pName].preProcess)) 
                                {
                                    tTweening.properties[pName].valueComplete = _specialPropertyList[pName].preProcess(tScope, _specialPropertyList[pName].parameters, tTweening.properties[pName].originalValueComplete, tTweening.properties[pName].extra);
                                }
                                pv = _specialPropertyList[pName].getValue(tScope, _specialPropertyList[pName].parameters, tTweening.properties[pName].extra);
                            }
                            else 
                            {
                                pv = tScope[pName];
                            }
                            tTweening.properties[pName].valueStart = isNaN(pv) ? tTweening.properties[pName].valueComplete : pv;
                        }
                        mustUpdate = true;
                        tTweening.hasStarted = true;
                    }
                    if (mustUpdate) 
                    {
                        loc2 = 0;
                        loc3 = tTweening.properties;
                        for (pName in loc3) 
                        {
                            tProperty = tTweening.properties[pName];
                            if (isOver) 
                            {
                                nv = tProperty.valueComplete;
                            }
                            else if (tProperty.hasModifier) 
                            {
                                t = cTime - tTweening.timeStart;
                                d = tTweening.timeComplete - tTweening.timeStart;
                                nv = tTweening.transition(t, 0, 1, d, tTweening.transitionParams);
                                nv = tProperty.modifierFunction(tProperty.valueStart, tProperty.valueComplete, nv, tProperty.modifierParameters);
                            }
                            else 
                            {
                                t = cTime - tTweening.timeStart;
                                b = tProperty.valueStart;
                                c = tProperty.valueComplete - tProperty.valueStart;
                                d = tTweening.timeComplete - tTweening.timeStart;
                                nv = tTweening.transition(t, b, c, d, tTweening.transitionParams);
                            }
                            if (tTweening.rounded) 
                            {
                                nv = Math.round(nv);
                            }
                            if (tProperty.isSpecialProperty) 
                            {
                                _specialPropertyList[pName].setValue(tScope, nv, _specialPropertyList[pName].parameters, tTweening.properties[pName].extra);
                                continue;
                            }
                            tScope[pName] = nv;
                        }
                        tTweening.updatesSkipped = 0;
                        if (Boolean(tTweening.onUpdate)) 
                        {
                            eventScope = Boolean(tTweening.onUpdateScope) ? tTweening.onUpdateScope : tScope;
                            try 
                            {
                                tTweening.onUpdate.apply(eventScope, tTweening.onUpdateParams);
                            }
                            catch (e3:Error)
                            {
                                handleError(tTweening, e3, "onUpdate");
                            }
                        }
                    }
                    else 
                    {
                        loc3 = ((loc2 = tTweening).updatesSkipped + 1);
                        loc2.updatesSkipped = loc3;
                    }
                }
                if (isOver && Boolean(tTweening.onComplete)) 
                {
                    eventScope = Boolean(tTweening.onCompleteScope) ? tTweening.onCompleteScope : tScope;
                    try 
                    {
                        tTweening.onComplete.apply(eventScope, tTweening.onCompleteParams);
                    }
                    catch (e4:Error)
                    {
                        handleError(tTweening, e4, "onComplete");
                    }
                }
                return !isOver;
            }
            return true;
        }

        public static function setTimeScale(arg1:Number):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            if (isNaN(arg1)) 
            {
                arg1 = 1;
            }
            if (arg1 < 1e-005) 
            {
                arg1 = 1e-005;
            }
            if (arg1 != _timeScale) 
            {
                if (_tweenList != null) 
                {
                    loc1 = 0;
                    while (loc1 < _tweenList.length) 
                    {
                        loc2 = getCurrentTweeningTime(_tweenList[loc1]);
                        _tweenList[loc1].timeStart = loc2 - (loc2 - _tweenList[loc1].timeStart) * _timeScale / arg1;
                        _tweenList[loc1].timeComplete = loc2 - (loc2 - _tweenList[loc1].timeComplete) * _timeScale / arg1;
                        if (_tweenList[loc1].timePaused != undefined) 
                        {
                            _tweenList[loc1].timePaused = loc2 - (loc2 - _tweenList[loc1].timePaused) * _timeScale / arg1;
                        }
                        ++loc1;
                    }
                }
                _timeScale = arg1;
            }
            return;
        }

        public static function resumeAllTweens():Boolean
        {
            var loc2:*=0;
            if (!Boolean(_tweenList)) 
            {
                return false;
            }
            var loc1:*=false;
            loc2 = 0;
            while (loc2 < _tweenList.length) 
            {
                resumeTweenByIndex(loc2);
                loc1 = true;
                ++loc2;
            }
            return loc1;
        }

        internal static function handleError(arg1:caurina.transitions.TweenListObj, arg2:Error, arg3:String):void
        {
            var pTweening:caurina.transitions.TweenListObj;
            var pError:Error;
            var eventScope:Object;
            var pCallBackName:String;

            var loc1:*;
            eventScope = null;
            pTweening = arg1;
            pError = arg2;
            pCallBackName = arg3;
            if (Boolean(pTweening.onError) && pTweening.onError is Function) 
            {
                eventScope = Boolean(pTweening.onErrorScope) ? pTweening.onErrorScope : pTweening.scope;
                try 
                {
                    pTweening.onError.apply(eventScope, [pTweening.scope, pError]);
                }
                catch (metaError:Error)
                {
                    printError(String(pTweening.scope) + " raised an error while executing the \'onError\' handler. Original error:\n " + pError.getStackTrace() + "\nonError error: " + metaError.getStackTrace());
                }
            }
            else if (!Boolean(pTweening.onError)) 
            {
                printError(String(pTweening.scope) + " raised an error while executing the \'" + pCallBackName + "\'handler. \n" + pError.getStackTrace());
            }
            return;
        }

        internal static function startEngine():void
        {
            _engineExists = true;
            _tweenList = new Array();
            __tweener_controller__ = new flash.display.MovieClip();
            __tweener_controller__.addEventListener(flash.events.Event.ENTER_FRAME, caurina.transitions.Tweener.onEnterFrame);
            _currentTimeFrame = 0;
            updateTime();
            return;
        }

        public static function removeAllTweens():Boolean
        {
            var loc2:*=0;
            if (!Boolean(_tweenList)) 
            {
                return false;
            }
            var loc1:*=false;
            loc2 = 0;
            while (loc2 < _tweenList.length) 
            {
                removeTweenByIndex(loc2);
                loc1 = true;
                ++loc2;
            }
            return loc1;
        }

        public static function addTween(arg1:Object=null, arg2:Object=null):Boolean
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=null;
            var loc4:*=null;
            var loc11:*=null;
            var loc12:*=null;
            var loc13:*=null;
            var loc14:*=NaN;
            var loc15:*=null;
            var loc16:*=null;
            var loc17:*=null;
            var loc18:*=null;
            if (!Boolean(arg1)) 
            {
                return false;
            }
            if (arg1 is Array) 
            {
                loc4 = arg1.concat();
            }
            else 
            {
                loc4 = [arg1];
            }
            var loc5:*=caurina.transitions.TweenListObj.makePropertiesChain(arg2);
            if (!_inited) 
            {
                init();
            }
            if (!_engineExists || !Boolean(__tweener_controller__)) 
            {
                startEngine();
            }
            var loc6:*=isNaN(loc5.time) ? 0 : loc5.time;
            var loc7:*=isNaN(loc5.delay) ? 0 : loc5.delay;
            var loc8:*=new Array();
            var loc9:*={"overwrite":true, "time":true, "delay":true, "useFrames":true, "skipUpdates":true, "transition":true, "transitionParams":true, "onStart":true, "onUpdate":true, "onComplete":true, "onOverwrite":true, "onError":true, "rounded":true, "onStartParams":true, "onUpdateParams":true, "onCompleteParams":true, "onOverwriteParams":true, "onStartScope":true, "onUpdateScope":true, "onCompleteScope":true, "onOverwriteScope":true, "onErrorScope":true};
            var loc10:*=new Object();
            var loc19:*=0;
            var loc20:*=loc5;
            for (loc3 in loc20) 
            {
                if (loc9[loc3]) 
                {
                    continue;
                }
                if (_specialPropertySplitterList[loc3]) 
                {
                    loc15 = _specialPropertySplitterList[loc3].splitValues(loc5[loc3], _specialPropertySplitterList[loc3].parameters);
                    loc1 = 0;
                    while (loc1 < loc15.length) 
                    {
                        if (_specialPropertySplitterList[loc15[loc1].name]) 
                        {
                            loc16 = _specialPropertySplitterList[loc15[loc1].name].splitValues(loc15[loc1].value, _specialPropertySplitterList[loc15[loc1].name].parameters);
                            loc2 = 0;
                            while (loc2 < loc16.length) 
                            {
                                loc8[loc16[loc2].name] = {"valueStart":undefined, "valueComplete":loc16[loc2].value, "arrayIndex":loc16[loc2].arrayIndex, "isSpecialProperty":false};
                                ++loc2;
                            }
                        }
                        else 
                        {
                            loc8[loc15[loc1].name] = {"valueStart":undefined, "valueComplete":loc15[loc1].value, "arrayIndex":loc15[loc1].arrayIndex, "isSpecialProperty":false};
                        }
                        ++loc1;
                    }
                    continue;
                }
                if (_specialPropertyModifierList[loc3] != undefined) 
                {
                    loc17 = _specialPropertyModifierList[loc3].modifyValues(loc5[loc3]);
                    loc1 = 0;
                    while (loc1 < loc17.length) 
                    {
                        loc10[loc17[loc1].name] = {"modifierParameters":loc17[loc1].parameters, "modifierFunction":_specialPropertyModifierList[loc3].getValue};
                        ++loc1;
                    }
                    continue;
                }
                loc8[loc3] = {"valueStart":undefined, "valueComplete":loc5[loc3]};
            }
            loc19 = 0;
            loc20 = loc8;
            for (loc3 in loc20) 
            {
                if (_specialPropertyList[loc3] != undefined) 
                {
                    loc8[loc3].isSpecialProperty = true;
                    continue;
                }
                if (loc4[0][loc3] != undefined) 
                {
                    continue;
                }
                printError("The property \'" + loc3 + "\' doesn\'t seem to be a normal object property of " + String(loc4[0]) + " or a registered special property.");
            }
            loc19 = 0;
            loc20 = loc10;
            for (loc3 in loc20) 
            {
                if (loc8[loc3] == undefined) 
                {
                    continue;
                }
                loc8[loc3].modifierParameters = loc10[loc3].modifierParameters;
                loc8[loc3].modifierFunction = loc10[loc3].modifierFunction;
            }
            if (typeof loc5.transition != "string") 
            {
                loc11 = loc5.transition;
            }
            else 
            {
                loc18 = loc5.transition.toLowerCase();
                loc11 = _transitionList[loc18];
            }
            if (!Boolean(loc11)) 
            {
                loc11 = _transitionList["easeoutexpo"];
            }
            loc1 = 0;
            while (loc1 < loc4.length) 
            {
                loc12 = new Object();
                loc19 = 0;
                loc20 = loc8;
                for (loc3 in loc20) 
                {
                    loc12[loc3] = new caurina.transitions.PropertyInfoObj(loc8[loc3].valueStart, loc8[loc3].valueComplete, loc8[loc3].valueComplete, loc8[loc3].arrayIndex, {}, loc8[loc3].isSpecialProperty, loc8[loc3].modifierFunction, loc8[loc3].modifierParameters);
                }
                if (loc5.useFrames != true) 
                {
                    loc13 = new caurina.transitions.TweenListObj(loc4[loc1], _currentTime + loc7 * 1000 / _timeScale, _currentTime + (loc7 * 1000 + loc6 * 1000) / _timeScale, false, loc11, loc5.transitionParams);
                }
                else 
                {
                    loc13 = new caurina.transitions.TweenListObj(loc4[loc1], _currentTimeFrame + loc7 / _timeScale, _currentTimeFrame + (loc7 + loc6) / _timeScale, true, loc11, loc5.transitionParams);
                }
                loc13.properties = loc12;
                loc13.onStart = loc5.onStart;
                loc13.onUpdate = loc5.onUpdate;
                loc13.onComplete = loc5.onComplete;
                loc13.onOverwrite = loc5.onOverwrite;
                loc13.onError = loc5.onError;
                loc13.onStartParams = loc5.onStartParams;
                loc13.onUpdateParams = loc5.onUpdateParams;
                loc13.onCompleteParams = loc5.onCompleteParams;
                loc13.onOverwriteParams = loc5.onOverwriteParams;
                loc13.onStartScope = loc5.onStartScope;
                loc13.onUpdateScope = loc5.onUpdateScope;
                loc13.onCompleteScope = loc5.onCompleteScope;
                loc13.onOverwriteScope = loc5.onOverwriteScope;
                loc13.onErrorScope = loc5.onErrorScope;
                loc13.rounded = loc5.rounded;
                loc13.skipUpdates = loc5.skipUpdates;
                if (loc5.overwrite != undefined ? loc5.overwrite : autoOverwrite) 
                {
                    removeTweensByTime(loc13.scope, loc13.properties, loc13.timeStart, loc13.timeComplete);
                }
                _tweenList.push(loc13);
                if (loc6 == 0 && loc7 == 0) 
                {
                    loc14 = (_tweenList.length - 1);
                    updateTweenByIndex(loc14);
                    removeTweenByIndex(loc14);
                }
                ++loc1;
            }
            return true;
        }

        public static function registerTransition(arg1:String, arg2:Function):void
        {
            if (!_inited) 
            {
                init();
            }
            _transitionList[arg1] = arg2;
            return;
        }

        public static function printError(arg1:String):void
        {
            trace("## [Tweener] Error: " + arg1);
            return;
        }

        internal static function affectTweens(arg1:Function, arg2:Object, arg3:Array):Boolean
        {
            var loc2:*=0;
            var loc3:*=null;
            var loc4:*=0;
            var loc5:*=0;
            var loc6:*=0;
            var loc1:*=false;
            if (!Boolean(_tweenList)) 
            {
                return false;
            }
            loc2 = 0;
            while (loc2 < _tweenList.length) 
            {
                if (_tweenList[loc2] && _tweenList[loc2].scope == arg2) 
                {
                    if (arg3.length != 0) 
                    {
                        loc3 = new Array();
                        loc4 = 0;
                        while (loc4 < arg3.length) 
                        {
                            if (Boolean(_tweenList[loc2].properties[arg3[loc4]])) 
                            {
                                loc3.push(arg3[loc4]);
                            }
                            ++loc4;
                        }
                        if (loc3.length > 0) 
                        {
                            if ((loc5 = caurina.transitions.AuxFunctions.getObjectLength(_tweenList[loc2].properties)) != loc3.length) 
                            {
                                loc6 = splitTweens(loc2, loc3);
                                arg1(loc6);
                                loc1 = true;
                            }
                            else 
                            {
                                arg1(loc2);
                                loc1 = true;
                            }
                        }
                    }
                    else 
                    {
                        arg1(loc2);
                        loc1 = true;
                    }
                }
                ++loc2;
            }
            return loc1;
        }

        public static function getTweens(arg1:Object):Array
        {
            var loc1:*=0;
            var loc2:*=null;
            if (!Boolean(_tweenList)) 
            {
                return [];
            }
            var loc3:*=new Array();
            loc1 = 0;
            while (loc1 < _tweenList.length) 
            {
                if (Boolean(_tweenList[loc1]) && _tweenList[loc1].scope == arg1) 
                {
                    var loc4:*=0;
                    var loc5:*=_tweenList[loc1].properties;
                    for (loc2 in loc5) 
                    {
                        loc3.push(loc2);
                    }
                }
                ++loc1;
            }
            return loc3;
        }

        public static function isTweening(arg1:Object):Boolean
        {
            var loc1:*=0;
            if (!Boolean(_tweenList)) 
            {
                return false;
            }
            loc1 = 0;
            while (loc1 < _tweenList.length) 
            {
                if (Boolean(_tweenList[loc1]) && _tweenList[loc1].scope == arg1) 
                {
                    return true;
                }
                ++loc1;
            }
            return false;
        }

        internal static var _timeScale:Number=1;

        internal static var _currentTimeFrame:Number;

        internal static var _specialPropertySplitterList:Object;

        public static var autoOverwrite:Boolean=true;

        internal static var _engineExists:Boolean=false;

        internal static var _currentTime:Number;

        internal static var _tweenList:Array;

        internal static var _specialPropertyModifierList:Object;

        internal static var _specialPropertyList:Object;

        internal static var _transitionList:Object;

        internal static var _inited:Boolean=false;

        internal static var __tweener_controller__:flash.display.MovieClip;
    }
}
