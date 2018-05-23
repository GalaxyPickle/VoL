////////////////////////////////////////
// setup
////////////////////////////////////////

#region
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

#endregion

var pos = [0, 0];
if ds_map_exists(global.room_list_pos, global.death_room)
	pos = ds_map_find_value(global.room_list_pos, global.death_room);
instance_create_layer(pos[0], pos[1], "layer_instance_player", o_player);

room_goto(global.death_room);