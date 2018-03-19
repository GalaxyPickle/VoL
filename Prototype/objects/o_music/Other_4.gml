/// @description set audio for rooms

if audio_is_playing(global.music)
	audio_stop_sound(global.music);

var play = true;
var song = -1;
play_ambiance = true;

// choose song based on room
switch room_get_name(room) {
	// MAIN MENU
	case "r_main_menu":
		play = false;
		break;
		
	// INTRO AREA
	case "r_first_room":
		play = false;
		break;
		
	case "r_second_room":
		song = a_song_cavern_exploration;
		play_ambiance = false;
		break;
	
	// demo level
	case "r_demo_level":
		song = a_song_cavern_exploration;
		play_ambiance = false;
		break;
		
	// DEFAULT
	default:
		play = false;
		break;
	
}
if play
	global.music = audio_play_sound(song, 1, true);

if play_ambiance 
	alarm[0] = room_speed * 15;