/// @description check for interactiong

start_interaction = false;

// if player is in interactable range...
if interactable && distance_to_object(global.player) < sight_range {
	// if I press the interact button...
	if keyboard_check_pressed(global.key_interact) && !interacting {
		interacting = true;
		start_interaction = true;
		audio_play_sound(a_message_popup, 1, false);
	}
}
else {
	interacting = false;
}

// if you finished reading and leave and come back, reset the dialogue
if !interacting && done_interacting
	message_current = 0;
	
// move sprite animation of arrow
if alarm[4] < 0
	alarm[4] = room_speed / 6;