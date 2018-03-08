////////////////////////////////////////
// setup
////////////////////////////////////////

window_center();
// flush texture page
draw_texture_flush();

///////////////////////////////////////
// bg scale
///////////////////////////////////////

var lay_id = layer_get_id("layer_bg");
var back_id = layer_background_get_id(lay_id);
var scale = 2;

layer_background_xscale(back_id, scale);
layer_background_yscale(back_id, scale);

////////////////////////////////////////
// ghost platform and collision layers
////////////////////////////////////////

var ghost_id = layer_get_id("layer_tile_ghost_base");
var ghost_id_2 = layer_get_id("layer_tile_ghost_base_top");

var collision_id = layer_get_id("layer_tile_collision");
var platform_id = layer_get_id("layer_tile_platform");

layer_set_visible(ghost_id, false);
layer_set_visible(ghost_id_2, false);

/*
for (var i = 0; i < room_width; i += TILE_SIZE) {
	for (var j = 0; j < room_height; j += TILE_SIZE) {
		var data = return_tile_data(collision_id, i, j);
		if data == 1 {
			tilemap_set_at_pixel(layer_tilemap_get_id(ghost_id), 15, i, j);
		}
	}
}









