/// @description mute audio

if global.sunyata {
	audio_sound_pitch(global.music, .5);	
}
else audio_sound_pitch(global.music, 1);


// muting music
if keyboard_check_pressed(ord("M")) {
	global.mute = !global.mute;	
}

// if mute is on, mute music
if global.mute {
	audio_pause_sound(global.music);	
}
if !global.mute {
	audio_resume_sound(global.music);	
}