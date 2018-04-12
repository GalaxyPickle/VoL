/// @description NPC_pain

sprite_index = sprite_pain;

if starting {
	image_index = 0;
}

if alarm[0] < room_speed / 2 {
	poise = poise_max;
	current_state = states.idle;
}