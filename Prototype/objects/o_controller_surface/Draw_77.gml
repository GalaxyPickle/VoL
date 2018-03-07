/// @description surf

draw_set_alpha(1);
if global.sunyata {
	shader_set(shd_wave);
    
	shader_set_uniform_f(uni_time, var_time_var);
    shader_set_uniform_f(uni_mouse_pos, mouse_x, mouse_y);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_wave_amount, var_wave_amount);
    shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
    shader_set_uniform_f(uni_wave_speed, var_wave_speed);
	
	draw_surface(application_surface, 0, 0);
	shader_reset();
	
	var ghost_id = layer_get_id("layer_tile_ghost_base");
	var ghost_id_2 = layer_get_id("layer_tile_ghost_base_top");
	
	draw_tilemap(layer_tilemap_get_id(ghost_id), 0, 0);
	draw_tilemap(layer_tilemap_get_id(ghost_id_2), 0, 0);
	
	if surface_exists(global.player_surface)
		draw_surface(global.player_surface, 0, 0);
	
	if surface_exists(global.ghost_surface)
		draw_surface(global.ghost_surface, 0, 0);
}
else draw_surface(application_surface, 0, 0);