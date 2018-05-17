/// @description sunyata stuff

var_time_var+=0.04;

// sunyata is active!
if !surface_exists(global.ghost_surface)
	global.ghost_surface = surface_create(global.game_width, global.game_height);

surface_set_target(global.ghost_surface); 

var ghost_id = layer_tilemap_get_id(layer_get_id("layer_tile_ghost_base"));
//var ghost_id_2 = layer_tilemap_get_id(layer_get_id("layer_tile_ghost_base_top"));

draw_tilemap(ghost_id, -global.view_x, -global.view_y);
//shader_reset();
//draw_tilemap(ghost_id_2, -global.view_x, -global.view_y);

surface_reset_target();
draw_set_alpha(1);