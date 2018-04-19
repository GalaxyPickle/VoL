/// @description check for range

// get ready for pickin' if player is in distance range
if global.player != noone && distance_to_object(global.player) < sight_range {
	within_range = true;
	
	if (keyboard_check_pressed(global.key_interact) || 
		gamepad_button_check_pressed(0, global.gp_key_interact) ) 
	{
		alarm[0] = 1;
	}
}
else within_range = false;

interact_conditions = ready && within_range;