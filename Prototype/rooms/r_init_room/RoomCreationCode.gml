////////////////////////////////////////
// setup
////////////////////////////////////////

// flush texture page
draw_texture_flush();

// make player start near last door
var pos = global.death_room_pos;
if global.death_room == r_first_room
	pos = [230, 660];
	
instance_create_layer(pos[0], pos[1], "layer_instance_player", o_player);

room_goto(global.death_room);