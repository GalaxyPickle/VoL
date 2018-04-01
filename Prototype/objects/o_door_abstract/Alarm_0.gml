/// @description get keys

// for every instance in the room of the current enemy...
if !ready && instance_exists(o_checkpoint) {
	
	for (var j = 0; j < instance_number(o_checkpoint); j++) {
		keys[j] = instance_find(o_checkpoint, j);
	}
	lock = instance_create_depth(x + sprite_width / 2, y + sprite_height / 2, 
		layer_get_depth(layer) - 1, o_lock);
}