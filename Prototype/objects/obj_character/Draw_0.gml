/// @description DRAW

if !(mouse_check_button(mb_left))
{
	//SETTING UP THE SHADER
	shader_set(sh_color_overlay);
	scr_shader_set_color( v_cor, 1);

	//DRAWING
	draw_self();

	//RESETING SHADER
	shader_reset();
}
else
{
	draw_self();
}