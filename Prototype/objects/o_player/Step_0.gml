/// @description check for gameover

// Inherit the parent event
event_inherited();

if vitality <= 0 && !start_gameover {
	start_gameover = true;
	
	pause_input = true;
	
	visible = false;
	
	effect_create_above(ef_firework, x, y, 2, c_red);
	with (o_pause_menu) {
		alarm[1] = room_speed * 2;	
	}
	
	// play death sound
	audio_play_sound(a_player_death, 1, false);
	
	// play gameoover music
	global.mute = true;
	audio_play_sound(a_song_metal_lol, 1, false);
}