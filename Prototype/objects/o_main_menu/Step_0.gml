/// @description select option

if !audio_is_playing(a_song_spring) && audio_group_is_loaded(audiogroup_music)
	audio_play_sound(a_song_spring, 1, true);

if keyboard_check_pressed(global.key_enter) || keyboard_check_pressed(global.key_jump) ||
	gamepad_button_check_pressed(0, global.gp_key_enter) ||
	gamepad_button_check_pressed(0, global.gp_key_jump) 
{
	// fade out music
	audio_sound_gain(a_song_spring, 0, room_speed);
	
	if !global.died {
		switch current_option {	
			case 0:	// start game
				audio_play_sound(a_door_slam, 1, false);
				room_goto(start_room);
				break;
			
			case 1: // quit
				game_end();
				break;
		}
	}
	else {
		switch current_option {	
			case 0:	// continue
				audio_play_sound(a_door_slam, 1, false);
				room_goto(start_room);
				break;
				
			case 1:	// new game
				audio_play_sound(a_door_slam, 1, false);
				room_goto(r_intro);
				break;
			
			case 2: // quit
				game_end();
				break;
		}
	}
}

if alpha < 1
	alpha = lerp(alpha, 1, .05);