/// @description

// Inherit the parent event
event_inherited();

if distance_to_object(global.player) < sight_range && !global.chat_titan && !seen {
	// show the player TITAN HEAD!!!
	with o_camera {
		alarm[1] = room_speed * 3;
		follow = other;
	}
	seen = true;
	audio_play_sound(a_mystery_plucks, 1, false);
}

if distance_to_object(global.player) < close_range {
	within_range = true;	
}
else within_range = false;

if dialogue_read && !global.chat_titan {
	instance_destroy(Q);
	global.chat_titan = true;
}