sun = false;

application_surface_draw_enable(false);
application_surface_enable(true);

surf = -1;
mother_surf = -1;

uni_time_wave = shader_get_uniform(shd_wave,"time");
uni_mouse_pos_wave = shader_get_uniform(shd_wave,"mouse_pos");
uni_resolution_wave = shader_get_uniform(shd_wave,"resolution");

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
var_wave_amount = 50; //higher = more waves

uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
var_wave_distortion = 200; //higher = less distortion

uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
var_wave_speed = -3; //higher = faster


/// shader
uni_time = shader_get_uniform(shd_radial_blur, "time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_radial_blur,"mouse_pos");

uni_resolution = shader_get_uniform(shd_radial_blur,"resolution");
var_resolution_x = global.window_width;
var_resolution_y = global.window_height;

uni_radial_blur_offset = shader_get_uniform(shd_radial_blur,"radial_blur_offset");
var_radial_blur_offset = 0.1;	// higher = more blur

uni_radial_brightness = shader_get_uniform(shd_radial_blur,"radial_brightness");
var_radial_brightness = 1;