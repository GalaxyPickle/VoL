/// @description set audio for rooms

global.mute = false;

var play = true;
var song = -1;
var fog = false;
play_breath_ambiance = true;
play_cave_ambiance = true;

// choose song based on room
switch room_get_name(room) {
	
	// MAIN MENU
	case "r_main_menu":
		play = false;
		play_breath_ambiance = false;
		play_cave_ambiance = false;
		break;
		
	// INTRO AREA
	case "r_first_room":
		play = false;
		fog = true;
		break;
	
	// SHORT PASSAGE TO ENTRANCE CAVE
	case "r_second_room":
		play = false;
		fog = true;
		break;
	
	// ENTRANCE CAVE
	case "r_entrance_room":
		play_breath_ambiance = false;
		play_cave_ambiance = false;
		song = a_song_cavern_exploration;
		break;
		
	// CHAMBER OF EYES
	case "r_sunyata_room":
		play_cave_ambiance = false;
		play = false;
		break;
		
	// TITAN ROOM
	case "r_titan_room":
		play_breath_ambiance = false;
		play_cave_ambiance = false;
		break;
		
	// TITAN ROOM
	case "r_trial_room":
		play_breath_ambiance = false;
		play_cave_ambiance = false;
		song = a_song_cavern_exploration;
		break;
	
	//////////////////////////////////
	////////////// OLD ///////////////
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
		play_breath_ambiance = false;
		play_cave_ambiance = false;
		break;
	
}

// play the music
if play {
	if !audio_is_playing(song)
		global.music = audio_play_sound(song, 1, true);
}
else {
	if audio_is_playing(global.music)
		audio_stop_sound(global.music);
}

// play the breath intermitent ambiance
if play_breath_ambiance 
	alarm[0] = room_speed * 15;

// play the cave ambiance
if play_cave_ambiance && !audio_is_playing(a_cave_ambiance_muted)
	audio_play_sound(a_cave_ambiance_muted, 1, true);
else if !play_cave_ambiance {
	if audio_is_playing(a_cave_ambiance_muted)
		audio_stop_sound(a_cave_ambiance_muted);
}

if fog {
	foggy = true;
	
	//////////////////////////////////////////////////
	// make a particle type to use with the system
	//////////////////////////////////////////////////
	first_particle = part_type_create();

	// set the shape of the particle
	part_type_shape(first_particle, pt_shape_cloud);
	// set the scale of the particle
	part_type_scale(first_particle, 3, 1);
	// set the start size
	part_type_size(first_particle, 1, 2, 0, 0);
	// set the color over time
	part_type_color1(first_particle, c_gray);
	// set the alpha over time
	part_type_alpha3(first_particle, 0, 1, 0);
	// set the speed over time
	part_type_speed(first_particle, -1, 1, 0, 0);
	// set the direction in degrees
	part_type_direction(first_particle, 0, 0, 0, 0);
	// set the gravity and direction in degrees
	part_type_gravity(first_particle, 0, 0);
	// orientation???
	part_type_orientation(first_particle, 0, 0, 0, 0, true);
	// particle life in game frames
	part_type_life(first_particle, 360, 720);
	// blend the particles
	part_type_blend(first_particle, true);

	// create an emitter
	first_emitter = part_emitter_create(global.ps);
	// set the emitter region
	part_emitter_region(global.ps, first_emitter,
		global.view_x, global.view_x + global.game_width,
		global.view_y, global.view_y + global.game_height,
		ps_shape_rectangle, ps_distr_linear);

	// make a burst from the emitter
	part_emitter_stream(global.ps, first_emitter, first_particle, -2);
}
else foggy = false;