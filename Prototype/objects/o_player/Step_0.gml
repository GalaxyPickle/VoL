/// @description check for gameover

// Inherit the parent event
event_inherited();

if check_door {
	check_door = false;
	
	var door = instance_nearest(x, y, o_door_abstract);
	global.death_room_pos = 
	[
		door.x + sprite_get_width(s_door_gold) / 2,
		door.y + sprite_get_height(s_door_gold) / 2
	];
}

if vitality <= 0 {
	pause_input = true;
	vitality = -1;
	
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