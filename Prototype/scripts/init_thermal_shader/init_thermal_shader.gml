/// @desc setup thermal shader stuff

uni_time = shader_get_uniform(shd_thermal,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_thermal,"mouse_pos");
var_mouse_pos_x = 0;
var_mouse_pos_y = 0;

uni_resolution = shader_get_uniform(shd_thermal,"resolution");
var_resolution_x = global.view_x;
var_resolution_y = global.view_y;