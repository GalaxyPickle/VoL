/// @description check for gameover

// Inherit the parent event
event_inherited();

if vitality <= 0 {
	pause_input = true;
	vitality = -1;
	
	global.death_vitality = vitality_max;
	global.death_sunyata = special_max;
	global.death_room = room;
	global.died = true;
	
	image_index = 0;
	
	if !start_gameover {
		start_gameover = true;
	
		visible = false;
	
		effect_create_above(ef_firework, x, y, 2, c_red);
		with (o_pause_menu) {
			alarm[1] = room_speed * 2;	
		}
	
		// play death sound
		audio_play_sound(a_player_death, 1, false);
	
		// play gameoover music
		global.mute = true;
		//audio_play_sound(a_song_metal_lol, 1, false);
		instance_create(x, y, o_gameover);
	}
}