/// @description NPC_pain

if starting {
	image_index = 0;
	sprite_index = sprite_pain;
}

if !invincible {
	poise = poise_max;
	current_state = states.idle;
}