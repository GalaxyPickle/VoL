/// @description sunyata stuff

var_time_var+=0.04;

// sunyata is active!
if !surface_exists(global.normal_surface)
	global.normal_surface = surface_create(global.game_width, global.game_height);

surface_set_target(global.normal_surface);

var normal_id = layer_tilemap_get_id(layer_get_id("layer_tile_normal_base"));
draw_tilemap(normal_id, -global.view_x, -global.view_y);

surface_reset_target();
draw_set_alpha(1);