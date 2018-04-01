/// @description draw shaders and self

event_inherited();

if invincible && !ghost_mode {
	//setting up shader
	if flash_entity {
		shader_set(sh_color_overlay);
		scr_shader_set_color(c_dkgray, .8);
	}
	draw_self();
	shader_reset();
}
else if !global.sunyata {
	outline_start(outline_thickness, outline_color, sprite_index, 4);
	draw_self();
	outline_end();
}
