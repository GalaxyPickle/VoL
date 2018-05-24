/// @description show count for objects

// for every CHECKPOINT in the room...
// for every instance in the room...
if instance_exists(o_checkpoint) {
	for (var j = 0; j < instance_number(o_checkpoint); j++) {
		checkpoints_max++;
	}
}
// for every GOLDEN WORM