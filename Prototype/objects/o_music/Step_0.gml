/// @description mute audio

// slow down music for shadow vision
if global.sunyata {
	audio_sound_pitch(global.music, .5);
}
else audio_sound_pitch(global.music, 1);

// if upgrade sound is playing, pause music
if audio_is_playing(a_impact_creepy) && alarm[1] < 0 && alarm[2] < 0 {
	alarm[1] = 3 * room_speed;
	alarm[2] = 7 * room_speed;
	global.mute = true;
}

// if mute is on, mute music
if global.mute {
	audio_pause_sound(global.music);	
}
if !global.mute {
	audio_resume_sound(global.music);	
}

// let clouds follow player
// set the emitter region
if foggy {
	part_emitter_region(global.ps, first_emitter,
		global.view_x - global.game_width, 
		global.view_x + global.game_width + global.game_width,
		global.view_y - global.game_height, 
		global.view_y + global.game_height + global.game_height,
		ps_shape_rectangle, ps_distr_linear);
}