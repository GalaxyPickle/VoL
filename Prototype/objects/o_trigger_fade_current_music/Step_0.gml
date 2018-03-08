/// @description fade current exploration music if any

if place_meeting(x, y, o_player) && audio_is_playing(global.music_intro) {
	audio_sound_gain(global.music_intro, 0, 5000);	
}