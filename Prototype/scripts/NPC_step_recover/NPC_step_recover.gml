/// @description healing ability for player step script

sprite_index = sprite_recover;

if starting {
	image_index = 0;
	velocity = [0, 0];
}

// end mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1 {
	
	// reset state to idle for next input or no input
	sprite_index = sprite_rest;
	current_state = states.idle;
}