/// @description

var_time_var += 0.04;

if shader_enabled shader_set(shd_wave);
    shader_set_uniform_f(uni_time, var_time_var);
    shader_set_uniform_f(uni_mouse_pos, mouse_x, mouse_y);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_wave_amount, var_wave_amount);
    shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
    shader_set_uniform_f(uni_wave_speed, var_wave_speed);
	
draw_clear_alpha(c_black, 0);
draw_surface(application_surface, 0, 0);

shader_reset();