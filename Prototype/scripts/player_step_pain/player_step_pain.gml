/// @description execute player pain animation and stat decrease

sprite_index = sprite_pain;

if starting {
	image_index = 0;
	
	// sound
	audio_play_sound_on(s_emit, sound_poise_break, false, 1);
}

if !invincible {
	poise = poise_max;
	current_state = states.idle;
}