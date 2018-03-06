/// @description execute player pain animation and stat decrease

var ground_launch_velocity = image_xscale * TILE_SIZE - 1;

sprite_index = sprite_pain;
image_speed = 1;

if starting {
	image_index = 0;
	
	
	// sound
	audio_play_sound_on(s_emit, sound_poise_break, false, 1);
}

if !invincible {
	poise = poise_max;
	current_state = states.idle;
}