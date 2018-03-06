var_time_var+=0.04;

var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

if !surface_exists(surf) {
	surf = surface_create(global.window_width, global.window_height);
}

//surface_set_target(application_surface);
surface_set_target(surf);
if shader_enabled shader_set(shd_wave);
    shader_set_uniform_f(uni_time, var_time_var);
    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_wave_amount, var_wave_amount);
    shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
    shader_set_uniform_f(uni_wave_speed, var_wave_speed);
draw_surface(surf, 0, 0);
surface_reset_target();
shader_reset();

/*
draw_text(0,0,string_hash_to_newline("Real FPS: "+string(fps_real)));
draw_text(0,12,string_hash_to_newline("Wave amount (Q & A to adjust): "+string(var_wave_amount)));
draw_text(0,24,string_hash_to_newline("Wave distortion (W & S to adjust): "+string(var_wave_distortion)));
draw_text(0,36,string_hash_to_newline("Wave speed (E & D to adjust): "+string(var_wave_speed)));

draw_text(0,60,string_hash_to_newline("Spacebar to toggle shader"));
draw_text(0,72,string_hash_to_newline("Shift key to toggle fullscreen or sprite only"));
draw_text(0,84,string_hash_to_newline("Escape key to exit"));

