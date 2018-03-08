/// @description ...

sun = true;


/// shader
uni_time = shader_get_uniform(shd_radial_blur,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_radial_blur,"mouse_pos");

uni_resolution = shader_get_uniform(shd_radial_blur,"resolution");
var_resolution_x = global.window_width;
var_resolution_y = global.window_height;

uni_radial_blur_offset = shader_get_uniform(shd_radial_blur,"radial_blur_offset");
var_radial_blur_offset = 0.05;

uni_radial_brightness = shader_get_uniform(shd_radial_blur,"radial_brightness");
var_radial_brightness = 1;