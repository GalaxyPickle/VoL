/// @description start boss music

if place_meeting(x, y, o_player) && !audio_is_playing(global.music) {
	audio_play_sound(global.music, 1, true);	
	
}