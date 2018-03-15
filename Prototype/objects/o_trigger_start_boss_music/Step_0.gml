/// @description start boss music

if place_meeting(x, y, o_player) && !audio_is_playing(global.music) {
	audio_play_sound(a_song_demo_hardcore, 1, true);	
}