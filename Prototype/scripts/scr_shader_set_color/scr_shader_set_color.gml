///@description scr_shader_set_color( c_color, alpha_blend)
///scr_shader_set_color( c_color, alpha_blend)
///@param c_color
///@param alpha_blend
if shader_is_compiled( sh_color_overlay)
{
	shader_set_uniform_f( upixel_colorR, color_get_red( argument0)*0.003921568);
	shader_set_uniform_f( upixel_colorG, color_get_green( argument0)*0.003921568);
	shader_set_uniform_f( upixel_colorB, color_get_blue( argument0)*0.003921568);
	shader_set_uniform_f( upixel_alphaBl, argument1);
	
	return 1;
}
else
{
	return 0;
}