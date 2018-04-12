/// @description ready to show

if image_index >= image_number - 1 {
	
	image_speed = 0;
	timer++;
	if timer > 40 {
		image_speed = -s_speed;
		timer = 0;
		
		// play the transition sound
		//if !audio_is_playing(a_transition)
		//	audio_play_sound(a_transition, 1, false);
	}
}

if sign(image_speed) == -1 && round(image_index) == 0 {
	instance_destroy();
}