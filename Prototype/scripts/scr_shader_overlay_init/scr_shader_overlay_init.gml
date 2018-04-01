///@description scr_shader_overlay_init( c_color)
///scr_shader_overlay_init( c_color)
upixel_colorR = shader_get_uniform( sh_color_overlay, "pixel_colorR");
upixel_colorG = shader_get_uniform( sh_color_overlay, "pixel_colorG");
upixel_colorB = shader_get_uniform( sh_color_overlay, "pixel_colorB");
upixel_alphaBl= shader_get_uniform( sh_color_overlay, "pixel_AlphaBlend");

//VARIABLE COLOR
v_cor = c_white;