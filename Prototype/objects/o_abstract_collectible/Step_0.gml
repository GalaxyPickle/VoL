/// @description draw particles

// setup particle system on create
#region
if one_shot {
	
	one_shot = false;
}
#endregion

// get ready for pickin' if player is in distance range
if global.player != noone && distance_to_object(global.player) < sight_range {
	within_range = true;	
}
else within_range = false;