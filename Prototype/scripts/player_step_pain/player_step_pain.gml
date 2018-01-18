/// @description execute player pain animation and stat decrease

sprite_index = sprite_pain;

if starting {
	image_index = 0;
}

if !invincible {
	poise = poise_max;
	current_state = states.idle;
}