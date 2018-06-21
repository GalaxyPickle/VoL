/// @description lightsource size

if !activated
	image_speed = 0;

if !activated && place_meeting(x, y, global.player) {
	
	// update the gui
	with (o_gui) {
		checkpoints++;
	}
	
	activated = true;
	with lightsource _pl_color = c_lime;
	audio_play_sound(a_choir_ah, 1, false);
	
	// turn on particles
	alarm[0] = 1;
	
	// add it to the active list 
	add_to_activated();
}

if activated {
	if image_index < image_number - 1
		image_speed = 1;
	else image_index = image_number - 1;
}