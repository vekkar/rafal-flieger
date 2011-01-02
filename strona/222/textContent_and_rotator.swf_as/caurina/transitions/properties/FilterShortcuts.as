package caurina.transitions.properties 
{
    import caurina.transitions.*;
    import flash.display.*;
    import flash.filters.*;
    import flash.geom.*;
    
    public class FilterShortcuts extends Object
    {
        public function FilterShortcuts()
        {
            super();
            trace("This is an static class and should not be instantiated.");
            return;
        }

        public static function init():void
        {
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_filter", _filter_splitter);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_angle", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "angle"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_blurX", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "blurX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_blurY", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "blurY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_distance", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "distance"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightAlpha", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "highlightAlpha"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_Bevel_highlightColor", _generic_color_splitter, ["_Bevel_highlightColor_r", "_Bevel_highlightColor_g", "_Bevel_highlightColor_b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightColor_r", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "highlightColor", "color", "r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightColor_g", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "highlightColor", "color", "g"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightColor_b", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "highlightColor", "color", "b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_knockout", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "knockout"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_quality", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "quality"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowAlpha", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "shadowAlpha"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_Bevel_shadowColor", _generic_color_splitter, ["_Bevel_shadowColor_r", "_Bevel_shadowColor_g", "_Bevel_shadowColor_b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowColor_r", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "shadowColor", "color", "r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowColor_g", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "shadowColor", "color", "g"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowColor_b", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "shadowColor", "color", "b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_strength", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "strength"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Bevel_type", _filter_property_get, _filter_property_set, [flash.filters.BevelFilter, "type"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Blur_blurX", _filter_property_get, _filter_property_set, [flash.filters.BlurFilter, "blurX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Blur_blurY", _filter_property_get, _filter_property_set, [flash.filters.BlurFilter, "blurY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Blur_quality", _filter_property_get, _filter_property_set, [flash.filters.BlurFilter, "quality"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_ColorMatrix_matrix", _generic_matrix_splitter, [[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0], ["_ColorMatrix_matrix_rr", "_ColorMatrix_matrix_rg", "_ColorMatrix_matrix_rb", "_ColorMatrix_matrix_ra", "_ColorMatrix_matrix_ro", "_ColorMatrix_matrix_gr", "_ColorMatrix_matrix_gg", "_ColorMatrix_matrix_gb", "_ColorMatrix_matrix_ga", "_ColorMatrix_matrix_go", "_ColorMatrix_matrix_br", "_ColorMatrix_matrix_bg", "_ColorMatrix_matrix_bb", "_ColorMatrix_matrix_ba", "_ColorMatrix_matrix_bo", "_ColorMatrix_matrix_ar", "_ColorMatrix_matrix_ag", "_ColorMatrix_matrix_ab", "_ColorMatrix_matrix_aa", "_ColorMatrix_matrix_ao"]]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_rr", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 0]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_rg", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 1]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_rb", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 2]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ra", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 3]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ro", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 4]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_gr", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 5]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_gg", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 6]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_gb", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 7]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ga", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 8]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_go", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 9]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_br", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 10]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_bg", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 11]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_bb", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 12]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ba", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 13]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_bo", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 14]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ar", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 15]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ag", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 16]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ab", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 17]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_aa", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 18]);
            caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ao", _filter_property_get, _filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 19]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_alpha", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "alpha"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_bias", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "bias"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_clamp", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "clamp"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_Convolution_color", _generic_color_splitter, ["_Convolution_color_r", "_Convolution_color_g", "_Convolution_color_b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_color_r", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "color", "color", "r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_color_g", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "color", "color", "g"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_color_b", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "color", "color", "b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_divisor", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "divisor"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_matrixX", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "matrixX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_matrixY", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "matrixY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Convolution_preserveAlpha", _filter_property_get, _filter_property_set, [flash.filters.ConvolutionFilter, "preserveAlpha"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_alpha", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "alpha"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_DisplacementMap_color", _generic_color_splitter, ["_DisplacementMap_color_r", "_DisplacementMap_color_r", "_DisplacementMap_color_r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_color_r", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "color", "color", "r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_color_g", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "color", "color", "g"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_color_b", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "color", "color", "b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_componentX", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "componentX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_componentY", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "componentY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mapBitmap", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "mapBitmap"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_DisplacementMap_mapPoint", _generic_point_splitter, ["_DisplacementMap_mapPoint_x", "_DisplacementMap_mapPoint_y"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mapPoint_x", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "mapPoint", "point", "x"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mapPoint_y", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "mapPoint", "point", "y"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mode", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "mode"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_scaleX", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "scaleX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_scaleY", _filter_property_get, _filter_property_set, [flash.filters.DisplacementMapFilter, "scaleY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_alpha", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "alpha"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_angle", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "angle"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_blurX", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "blurX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_blurY", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "blurY"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_DropShadow_color", _generic_color_splitter, ["_DropShadow_color_r", "_DropShadow_color_g", "_DropShadow_color_b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_color_r", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "color", "color", "r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_color_g", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "color", "color", "g"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_color_b", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "color", "color", "b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_distance", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "distance"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_hideObject", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "hideObject"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_inner", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "inner"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_knockout", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "knockout"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_quality", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "quality"]);
            caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_strength", _filter_property_get, _filter_property_set, [flash.filters.DropShadowFilter, "strength"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_alpha", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "alpha"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_blurX", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "blurX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_blurY", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "blurY"]);
            caurina.transitions.Tweener.registerSpecialPropertySplitter("_Glow_color", _generic_color_splitter, ["_Glow_color_r", "_Glow_color_g", "_Glow_color_b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_color_r", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "color", "color", "r"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_color_g", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "color", "color", "g"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_color_b", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "color", "color", "b"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_inner", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "inner"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_knockout", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "knockout"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_quality", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "quality"]);
            caurina.transitions.Tweener.registerSpecialProperty("_Glow_strength", _filter_property_get, _filter_property_set, [flash.filters.GlowFilter, "strength"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_angle", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "angle"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_blurX", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "blurX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_blurY", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "blurY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_distance", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "distance"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_quality", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "quality"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_strength", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "strength"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_type", _filter_property_get, _filter_property_set, [flash.filters.GradientBevelFilter, "type"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_angle", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "angle"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_blurX", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "blurX"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_blurY", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "blurY"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_distance", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "distance"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_knockout", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "knockout"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_quality", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "quality"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_strength", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "strength"]);
            caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_type", _filter_property_get, _filter_property_set, [flash.filters.GradientGlowFilter, "type"]);
            return;
        }

        public static function _filter_property_get(arg1:Object, arg2:Array, arg3:Object=null):Number
        {
            var loc2:*=NaN;
            var loc6:*=null;
            var loc7:*=null;
            var loc1:*=arg1.filters;
            var loc3:*=arg2[0];
            var loc4:*=arg2[1];
            var loc5:*=arg2[2];
            loc2 = 0;
            while (loc2 < loc1.length) 
            {
                if (loc1[loc2] is Class(loc3)) 
                {
                    if (loc5 != "color") 
                    {
                        if (loc5 == "matrix") 
                        {
                            return loc1[loc2][loc4][arg2[3]];
                        }
                        if (loc5 == "point") 
                        {
                            return loc1[loc2][loc4][arg2[3]];
                        }
                        return loc1[loc2][loc4];
                    }
                    else 
                    {
                        if ((loc7 = arg2[3]) == "r") 
                        {
                            return caurina.transitions.AuxFunctions.numberToR(loc1[loc2][loc4]);
                        }
                        if (loc7 == "g") 
                        {
                            return caurina.transitions.AuxFunctions.numberToG(loc1[loc2][loc4]);
                        }
                        if (loc7 == "b") 
                        {
                            return caurina.transitions.AuxFunctions.numberToB(loc1[loc2][loc4]);
                        }
                    }
                }
                ++loc2;
            }
            var loc8:*=loc3;
            switch (loc8) 
            {
                case flash.filters.BevelFilter:
                {
                    loc6 = {"angle":NaN, "blurX":0, "blurY":0, "distance":0, "highlightAlpha":1, "highlightColor":NaN, "knockout":null, "quality":NaN, "shadowAlpha":1, "shadowColor":NaN, "strength":2, "type":null};
                    break;
                }
                case flash.filters.BlurFilter:
                {
                    loc6 = {"blurX":0, "blurY":0, "quality":NaN};
                    break;
                }
                case flash.filters.ColorMatrixFilter:
                {
                    loc6 = {"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]};
                    break;
                }
                case flash.filters.ConvolutionFilter:
                {
                    loc6 = {"alpha":0, "bias":0, "clamp":null, "color":NaN, "divisor":1, "matrix":[1], "matrixX":1, "matrixY":1, "preserveAlpha":null};
                    break;
                }
                case flash.filters.DisplacementMapFilter:
                {
                    loc6 = {"alpha":0, "color":NaN, "componentX":null, "componentY":null, "mapBitmap":null, "mapPoint":null, "mode":null, "scaleX":0, "scaleY":0};
                    break;
                }
                case flash.filters.DropShadowFilter:
                {
                    loc6 = {"distance":0, "angle":NaN, "color":NaN, "alpha":1, "blurX":0, "blurY":0, "strength":1, "quality":NaN, "inner":null, "knockout":null, "hideObject":null};
                    break;
                }
                case flash.filters.GlowFilter:
                {
                    loc6 = {"alpha":1, "blurX":0, "blurY":0, "color":NaN, "inner":null, "knockout":null, "quality":NaN, "strength":2};
                    break;
                }
                case flash.filters.GradientBevelFilter:
                {
                    loc6 = {"alphas":null, "angle":NaN, "blurX":0, "blurY":0, "colors":null, "distance":0, "knockout":null, "quality":NaN, "ratios":NaN, "strength":1, "type":null};
                    break;
                }
                case flash.filters.GradientGlowFilter:
                {
                    loc6 = {"alphas":null, "angle":NaN, "blurX":0, "blurY":0, "colors":null, "distance":0, "knockout":null, "quality":NaN, "ratios":NaN, "strength":1, "type":null};
                    break;
                }
            }
            if (loc5 == "color") 
            {
                return NaN;
            }
            if (loc5 == "matrix") 
            {
                return loc6[loc4][arg2[3]];
            }
            if (loc5 == "point") 
            {
                return loc6[loc4][arg2[3]];
            }
            return loc6[loc4];
        }

        public static function _filter_property_set(arg1:Object, arg2:Number, arg3:Array, arg4:Object=null):void
        {
            var loc2:*=NaN;
            var loc6:*=null;
            var loc7:*=null;
            var loc8:*=null;
            var loc9:*=null;
            var loc1:*=arg1.filters;
            var loc3:*=arg3[0];
            var loc4:*=arg3[1];
            var loc5:*=arg3[2];
            loc2 = 0;
            while (loc2 < loc1.length) 
            {
                if (loc1[loc2] is Class(loc3)) 
                {
                    if (loc5 != "color") 
                    {
                        if (loc5 != "matrix") 
                        {
                            if (loc5 != "point") 
                            {
                                loc1[loc2][loc4] = arg2;
                            }
                            else 
                            {
                                (loc9 = flash.geom.Point(loc1[loc2][loc4]))[arg3[3]] = arg2;
                                loc1[loc2][loc4] = loc9;
                            }
                        }
                        else 
                        {
                            (loc8 = loc1[loc2][loc4])[arg3[3]] = arg2;
                            loc1[loc2][loc4] = loc8;
                        }
                    }
                    else 
                    {
                        if ((loc7 = arg3[3]) == "r") 
                        {
                            loc1[loc2][loc4] = loc1[loc2][loc4] & 65535 | arg2 << 16;
                        }
                        if (loc7 == "g") 
                        {
                            loc1[loc2][loc4] = loc1[loc2][loc4] & 16711935 | arg2 << 8;
                        }
                        if (loc7 == "b") 
                        {
                            loc1[loc2][loc4] = loc1[loc2][loc4] & 16776960 | arg2;
                        }
                    }
                    arg1.filters = loc1;
                    return;
                }
                ++loc2;
            }
            if (loc1 == null) 
            {
                loc1 = new Array();
            }
            var loc10:*=loc3;
            switch (loc10) 
            {
                case flash.filters.BevelFilter:
                {
                    loc6 = new flash.filters.BevelFilter(0, 45, 16777215, 1, 0, 1, 0, 0);
                    break;
                }
                case flash.filters.BlurFilter:
                {
                    loc6 = new flash.filters.BlurFilter(0, 0);
                    break;
                }
                case flash.filters.ColorMatrixFilter:
                {
                    loc6 = new flash.filters.ColorMatrixFilter([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);
                    break;
                }
                case flash.filters.ConvolutionFilter:
                {
                    loc6 = new flash.filters.ConvolutionFilter(1, 1, [1], 1, 0, true, true, 0, 0);
                    break;
                }
                case flash.filters.DisplacementMapFilter:
                {
                    loc6 = new flash.filters.DisplacementMapFilter(new flash.display.BitmapData(10, 10), new flash.geom.Point(0, 0), 0, 1, 0, 0);
                    break;
                }
                case flash.filters.DropShadowFilter:
                {
                    loc6 = new flash.filters.DropShadowFilter(0, 45, 0, 1, 0, 0);
                    break;
                }
                case flash.filters.GlowFilter:
                {
                    loc6 = new flash.filters.GlowFilter(16711680, 1, 0, 0);
                    break;
                }
                case flash.filters.GradientBevelFilter:
                {
                    loc6 = new flash.filters.GradientBevelFilter(0, 45, [16777215, 0], [1, 1], [32, 223], 0, 0);
                    break;
                }
                case flash.filters.GradientGlowFilter:
                {
                    loc6 = new flash.filters.GradientGlowFilter(0, 45, [16777215, 0], [1, 1], [32, 223], 0, 0);
                    break;
                }
            }
            loc1.push(loc6);
            arg1.filters = loc1;
            _filter_property_set(arg1, arg2, arg3);
            return;
        }

        public static function _generic_color_splitter(arg1:Number, arg2:Array):Array
        {
            var loc1:*=new Array();
            loc1.push({"name":arg2[0], "value":caurina.transitions.AuxFunctions.numberToR(arg1)});
            loc1.push({"name":arg2[1], "value":caurina.transitions.AuxFunctions.numberToG(arg1)});
            loc1.push({"name":arg2[2], "value":caurina.transitions.AuxFunctions.numberToB(arg1)});
            return loc1;
        }

        public static function _generic_point_splitter(arg1:flash.geom.Point, arg2:Array):Array
        {
            var loc1:*=new Array();
            loc1.push({"name":arg2[0], "value":arg1.x});
            loc1.push({"name":arg2[1], "value":arg1.y});
            return loc1;
        }

        public static function _generic_matrix_splitter(arg1:Array, arg2:Array):Array
        {
            if (arg1 == null) 
            {
                arg1 = arg2[0].concat();
            }
            var loc1:*=new Array();
            var loc2:*=0;
            while (loc2 < arg1.length) 
            {
                loc1.push({"name":arg2[1][loc2], "value":arg1[loc2]});
                ++loc2;
            }
            return loc1;
        }

        public static function _filter_splitter(arg1:flash.filters.BitmapFilter, arg2:Array, arg3:Object=null):Array
        {
            var loc1:*=new Array();
            if (arg1 is flash.filters.BevelFilter) 
            {
                loc1.push({"name":"_Bevel_angle", "value":flash.filters.BevelFilter(arg1).angle});
                loc1.push({"name":"_Bevel_blurX", "value":flash.filters.BevelFilter(arg1).blurX});
                loc1.push({"name":"_Bevel_blurY", "value":flash.filters.BevelFilter(arg1).blurY});
                loc1.push({"name":"_Bevel_distance", "value":flash.filters.BevelFilter(arg1).distance});
                loc1.push({"name":"_Bevel_highlightAlpha", "value":flash.filters.BevelFilter(arg1).highlightAlpha});
                loc1.push({"name":"_Bevel_highlightColor", "value":flash.filters.BevelFilter(arg1).highlightColor});
                loc1.push({"name":"_Bevel_knockout", "value":flash.filters.BevelFilter(arg1).knockout});
                loc1.push({"name":"_Bevel_quality", "value":flash.filters.BevelFilter(arg1).quality});
                loc1.push({"name":"_Bevel_shadowAlpha", "value":flash.filters.BevelFilter(arg1).shadowAlpha});
                loc1.push({"name":"_Bevel_shadowColor", "value":flash.filters.BevelFilter(arg1).shadowColor});
                loc1.push({"name":"_Bevel_strength", "value":flash.filters.BevelFilter(arg1).strength});
                loc1.push({"name":"_Bevel_type", "value":flash.filters.BevelFilter(arg1).type});
            }
            else if (arg1 is flash.filters.BlurFilter) 
            {
                loc1.push({"name":"_Blur_blurX", "value":flash.filters.BlurFilter(arg1).blurX});
                loc1.push({"name":"_Blur_blurY", "value":flash.filters.BlurFilter(arg1).blurY});
                loc1.push({"name":"_Blur_quality", "value":flash.filters.BlurFilter(arg1).quality});
            }
            else if (arg1 is flash.filters.ColorMatrixFilter) 
            {
                loc1.push({"name":"_ColorMatrix_matrix", "value":flash.filters.ColorMatrixFilter(arg1).matrix});
            }
            else if (arg1 is flash.filters.ConvolutionFilter) 
            {
                loc1.push({"name":"_Convolution_alpha", "value":flash.filters.ConvolutionFilter(arg1).alpha});
                loc1.push({"name":"_Convolution_bias", "value":flash.filters.ConvolutionFilter(arg1).bias});
                loc1.push({"name":"_Convolution_clamp", "value":flash.filters.ConvolutionFilter(arg1).clamp});
                loc1.push({"name":"_Convolution_color", "value":flash.filters.ConvolutionFilter(arg1).color});
                loc1.push({"name":"_Convolution_divisor", "value":flash.filters.ConvolutionFilter(arg1).divisor});
                loc1.push({"name":"_Convolution_matrixX", "value":flash.filters.ConvolutionFilter(arg1).matrixX});
                loc1.push({"name":"_Convolution_matrixY", "value":flash.filters.ConvolutionFilter(arg1).matrixY});
                loc1.push({"name":"_Convolution_preserveAlpha", "value":flash.filters.ConvolutionFilter(arg1).preserveAlpha});
            }
            else if (arg1 is flash.filters.DisplacementMapFilter) 
            {
                loc1.push({"name":"_DisplacementMap_alpha", "value":flash.filters.DisplacementMapFilter(arg1).alpha});
                loc1.push({"name":"_DisplacementMap_color", "value":flash.filters.DisplacementMapFilter(arg1).color});
                loc1.push({"name":"_DisplacementMap_componentX", "value":flash.filters.DisplacementMapFilter(arg1).componentX});
                loc1.push({"name":"_DisplacementMap_componentY", "value":flash.filters.DisplacementMapFilter(arg1).componentY});
                loc1.push({"name":"_DisplacementMap_mapBitmap", "value":flash.filters.DisplacementMapFilter(arg1).mapBitmap});
                loc1.push({"name":"_DisplacementMap_mapPoint", "value":flash.filters.DisplacementMapFilter(arg1).mapPoint});
                loc1.push({"name":"_DisplacementMap_mode", "value":flash.filters.DisplacementMapFilter(arg1).mode});
                loc1.push({"name":"_DisplacementMap_scaleX", "value":flash.filters.DisplacementMapFilter(arg1).scaleX});
                loc1.push({"name":"_DisplacementMap_scaleY", "value":flash.filters.DisplacementMapFilter(arg1).scaleY});
            }
            else if (arg1 is flash.filters.DropShadowFilter) 
            {
                loc1.push({"name":"_DropShadow_alpha", "value":flash.filters.DropShadowFilter(arg1).alpha});
                loc1.push({"name":"_DropShadow_angle", "value":flash.filters.DropShadowFilter(arg1).angle});
                loc1.push({"name":"_DropShadow_blurX", "value":flash.filters.DropShadowFilter(arg1).blurX});
                loc1.push({"name":"_DropShadow_blurY", "value":flash.filters.DropShadowFilter(arg1).blurY});
                loc1.push({"name":"_DropShadow_color", "value":flash.filters.DropShadowFilter(arg1).color});
                loc1.push({"name":"_DropShadow_distance", "value":flash.filters.DropShadowFilter(arg1).distance});
                loc1.push({"name":"_DropShadow_hideObject", "value":flash.filters.DropShadowFilter(arg1).hideObject});
                loc1.push({"name":"_DropShadow_inner", "value":flash.filters.DropShadowFilter(arg1).inner});
                loc1.push({"name":"_DropShadow_knockout", "value":flash.filters.DropShadowFilter(arg1).knockout});
                loc1.push({"name":"_DropShadow_quality", "value":flash.filters.DropShadowFilter(arg1).quality});
                loc1.push({"name":"_DropShadow_strength", "value":flash.filters.DropShadowFilter(arg1).strength});
            }
            else if (arg1 is flash.filters.GlowFilter) 
            {
                loc1.push({"name":"_Glow_alpha", "value":flash.filters.GlowFilter(arg1).alpha});
                loc1.push({"name":"_Glow_blurX", "value":flash.filters.GlowFilter(arg1).blurX});
                loc1.push({"name":"_Glow_blurY", "value":flash.filters.GlowFilter(arg1).blurY});
                loc1.push({"name":"_Glow_color", "value":flash.filters.GlowFilter(arg1).color});
                loc1.push({"name":"_Glow_inner", "value":flash.filters.GlowFilter(arg1).inner});
                loc1.push({"name":"_Glow_knockout", "value":flash.filters.GlowFilter(arg1).knockout});
                loc1.push({"name":"_Glow_quality", "value":flash.filters.GlowFilter(arg1).quality});
                loc1.push({"name":"_Glow_strength", "value":flash.filters.GlowFilter(arg1).strength});
            }
            else if (arg1 is flash.filters.GradientBevelFilter) 
            {
                loc1.push({"name":"_GradientBevel_angle", "value":flash.filters.GradientBevelFilter(arg1).strength});
                loc1.push({"name":"_GradientBevel_blurX", "value":flash.filters.GradientBevelFilter(arg1).blurX});
                loc1.push({"name":"_GradientBevel_blurY", "value":flash.filters.GradientBevelFilter(arg1).blurY});
                loc1.push({"name":"_GradientBevel_distance", "value":flash.filters.GradientBevelFilter(arg1).distance});
                loc1.push({"name":"_GradientBevel_quality", "value":flash.filters.GradientBevelFilter(arg1).quality});
                loc1.push({"name":"_GradientBevel_strength", "value":flash.filters.GradientBevelFilter(arg1).strength});
                loc1.push({"name":"_GradientBevel_type", "value":flash.filters.GradientBevelFilter(arg1).type});
            }
            else if (arg1 is flash.filters.GradientGlowFilter) 
            {
                loc1.push({"name":"_GradientGlow_angle", "value":flash.filters.GradientGlowFilter(arg1).strength});
                loc1.push({"name":"_GradientGlow_blurX", "value":flash.filters.GradientGlowFilter(arg1).blurX});
                loc1.push({"name":"_GradientGlow_blurY", "value":flash.filters.GradientGlowFilter(arg1).blurY});
                loc1.push({"name":"_GradientGlow_distance", "value":flash.filters.GradientGlowFilter(arg1).distance});
                loc1.push({"name":"_GradientGlow_knockout", "value":flash.filters.GradientGlowFilter(arg1).knockout});
                loc1.push({"name":"_GradientGlow_quality", "value":flash.filters.GradientGlowFilter(arg1).quality});
                loc1.push({"name":"_GradientGlow_strength", "value":flash.filters.GradientGlowFilter(arg1).strength});
                loc1.push({"name":"_GradientGlow_type", "value":flash.filters.GradientGlowFilter(arg1).type});
            }
            else 
            {
                trace("Tweener FilterShortcuts Error :: Unknown filter class used");
            }
            return loc1;
        }
    }
}
