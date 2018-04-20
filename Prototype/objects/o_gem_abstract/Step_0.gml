/// @description check for range

// get ready for pickin' if player is in distance range
if global.player != noone && distance_to_object(global.player) < sight_range {
	within_range = true;
}
else within_range = false;

interact_conditions = ready && within_range;