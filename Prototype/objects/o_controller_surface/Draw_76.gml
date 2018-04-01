/// @description clear app surf

surface_set_target(application_surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();