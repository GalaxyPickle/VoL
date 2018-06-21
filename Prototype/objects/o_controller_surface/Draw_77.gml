/// @description surf

var sun_p = sun;
sun = global.sunyata;

var xx = (global.player.x - global.view_x) * 2;
var yy = (global.player.y - global.view_y) * 2;

draw_set_alpha(1);
if global.sunyata {
	
	if sun != sun_p {
		surface_set_target(global.player_surface);
		draw_clear_alpha(c_black, 0);
		surface_reset_target();

		surface_set_target(global.ghost_surface);
		draw_clear_alpha(c_black, 0);
		surface_reset_target();
	}

	// draw application surface to surf
	if !surface_exists(surf)
		surf = surface_create(global.window_width, global.window_height);
		
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	shader_set(shd_radial_blur);
	    shader_set_uniform_f(uni_time, var_time_var);
	    shader_set_uniform_f(uni_mouse_pos, xx, yy);
	    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
		
	    shader_set_uniform_f(uni_radial_blur_offset, var_radial_blur_offset);
	    shader_set_uniform_f(uni_radial_brightness, var_radial_brightness);
	
	draw_surface(application_surface, 0, 0);
	shader_reset();
	surface_reset_target();
	
	// then draw the surf as the app surface with another shader on it
	shader_set(shd_wave);
    
		shader_set_uniform_f(uni_time_wave, var_time_var);
	    shader_set_uniform_f(uni_mouse_pos_wave, xx, yy);
	    shader_set_uniform_f(uni_resolution_wave, var_resolution_x, var_resolution_y);
		
	    shader_set_uniform_f(uni_wave_amount, var_wave_amount);
	    shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
	    shader_set_uniform_f(uni_wave_speed, var_wave_speed);
	
	draw_surface(surf, 0, 0);
	shader_reset();
	
	// draw all the surfaces
	
	if surface_exists(global.ghost_surface)
		draw_surface_stretched(global.ghost_surface, 0, 0, global.window_width, global.window_height);
	
	if surface_exists(global.normal_surface) {
		draw_surface_stretched_ext(global.normal_surface, 0, 0, global.window_width, global.window_height,
			c_white, .25);
	}
	
	if surface_exists(global.player_surface)
		draw_surface(global.player_surface, 0, 0);
		
	// clear the alpha
	surface_set_target(global.ghost_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	
	surface_set_target(global.normal_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	
	surface_set_target(global.player_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
else {
	// not sunyata mode
	draw_surface(application_surface, 0, 0);
	
	if surface_exists(global.ghost_surface) {
		draw_surface_stretched_ext(global.ghost_surface, 0, 0, global.window_width, global.window_height,
			c_white, .25);
	}
	
	if surface_exists(global.normal_surface)
		draw_surface_stretched(global.normal_surface, 0, 0, global.window_width, global.window_height);

	// clear the alpha
	surface_set_target(global.ghost_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	
	surface_set_target(global.normal_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}