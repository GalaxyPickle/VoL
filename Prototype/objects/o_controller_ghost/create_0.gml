/// @description ...

var_time_var = 0;
var_resolution_x = global.window_width;
var_resolution_y = global.window_height;

// wave shader
uni_time_wave = shader_get_uniform(shd_wave,"time");
uni_mouse_pos_wave = shader_get_uniform(shd_wave,"mouse_pos");
uni_resolution_wave = shader_get_uniform(shd_wave,"resolution");

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
var_wave_amount = 50; //higher = more waves

uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
var_wave_distortion = 200; //higher = less distortion

uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
var_wave_speed = -3; //higher = faster