/// @description surf

application_surface_draw_enable(false);
application_surface_enable(true);

scr_shader_overlay_init();

// shaders
////////////////////// wave shader
draw_set_color(c_white);

uni_time = shader_get_uniform(shd_wave,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_wave,"mouse_pos");

uni_resolution = shader_get_uniform(shd_wave,"resolution");
var_resolution_x = global.window_width;
var_resolution_y = global.window_height;

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
var_wave_amount = 40; //higher = more waves

uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
var_wave_distortion = 60; //higher = less distortion

uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
var_wave_speed = 1.5; //higher = faster

shader_enabled = true;
full_screen_effect = true;

//////////////////////////////////////////