////////////////////////////////////////
// setup
////////////////////////////////////////

// flush texture page
draw_texture_flush();

var pos = [0, 0];
if ds_map_exists(global.room_list_pos, global.death_room)
	pos = ds_map_find_value(global.room_list_pos, global.death_room);
instance_create_layer(pos[0], pos[1], "layer_instance_player", o_player);

room_goto(global.death_room);