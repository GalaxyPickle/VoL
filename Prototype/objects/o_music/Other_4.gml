/// @description set audio for rooms

global.mute = false;

var play = true;
var song = -1;
play_breath_ambiance = true;
play_cave_ambiance = true;

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
		play_breath_ambiance = false;
		break;
		
	case "r_boss_room":
		play_breath_ambiance = false;
		play_cave_ambiance = false;
		break;
	
	// demo level
	case "r_demo_level":
		song = a_song_cavern_exploration;
		play_breath_ambiance = false;
		break;
		
	// DEFAULT
	default:
		play = false;
		break;
	
}

// play the music
if play
	global.music = audio_play_sound(song, 1, true);
else {
	if audio_is_playing(global.music)
		audio_stop_sound(global.music);
}

// play the breath intermitent ambiance
if play_ambiance 
	alarm[0] = room_speed * 15;

// play the cave ambiance
if play_cave_ambiance 
	audio_play_sound(a_cave_ambiance_muted, 1, true);
else {
	if audio_is_playing(a_cave_ambiance_muted)
		audio_stop_sound(a_cave_ambiance_muted);
}