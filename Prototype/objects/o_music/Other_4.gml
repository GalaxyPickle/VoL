/// @description set audio for rooms

if audio_is_playing(global.music)
	audio_stop_sound(global.music);

var play = true;
var song = -1;
var play_ambiance = true;

// choose song based on room
switch room_get_name(room) {
	// MAIN MENU
	case "r_main_menu":
		song = a_song_demo_hardcore;
		break;
		
	// INTRO AREA
	case "r_first_room":
		break;
	
	// demo level
	case "r_demo_level":
		song = a_song_cavern_exploration;
		break;
		
	// DEFAULT
	default:
		break;
	
}
if play
	global.music = audio_play_sound(song, 1, true);

if play_ambiance 
	alarm[0] = room_speed * 15;