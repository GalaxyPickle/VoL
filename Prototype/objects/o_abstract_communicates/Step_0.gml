/// @description check for interactiong

start_interaction = false;

// if player is in interactable range...
if interactable && distance_to_object(global.player) < close_range &&
	!global.sunyata && !global.pause {
	
	// do the bouncy arrow sound
	//if move_arrow && !audio_is_playing(a_arrow_bounce)
	//	audio_play_sound(a_arrow_bounce, 1, false);
	
	// if I press the interact button...
	if ( keyboard_check_pressed(global.key_interact) || 
		gamepad_button_check_pressed(0, global.gp_key_interact) ) && !interacting {
		interacting = true;
		start_interaction = true;
		audio_play_sound(message_sound, 1, false);
	}
}
else {
	if interacting && global.chatbox_up
		global.chatbox_up = false;
	interacting = false;
}

// if you finished reading and leave and come back, reset the dialogue
if !interacting && done_interacting
	message_current = 0;
	
// move sprite animation of arrow
if alarm[4] < 0
	alarm[4] = room_speed / 6;