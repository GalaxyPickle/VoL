/// @description sunyata stuff

var ghost_id = layer_get_id("layer_tile_ghost_base");
var ghost_id_2 = layer_get_id("layer_tile_ghost_base_top");

if !global.sunyata {
	layer_set_visible(ghost_id, false);
	layer_set_visible(ghost_id_2, false);
	exit;
}
else {
	layer_set_visible(ghost_id, false);
	layer_set_visible(ghost_id_2, false);
}

// sunyata is active!
if !surface_exists(global.ghost_surface)
	global.ghost_surface = surface_create(global.window_width, global.window_height);

surface_set_target(global.ghost_surface);

draw_tilemap(layer_tilemap_get_id(ghost_id), 0, 0);
draw_tilemap(layer_tilemap_get_id(ghost_id_2), 0, 0);

draw_arrow(100, 100, 200, 200, 20);

surface_reset_target()