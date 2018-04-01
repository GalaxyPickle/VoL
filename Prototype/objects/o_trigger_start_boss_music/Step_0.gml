/// @description start boss music

if place_meeting(x, y, o_player) && !start_play {
	start_play = true;
	
	if audio_is_playing(global.music)
		audio_stop_sound(global.music);
		
		
	with o_music {
		global.mute = false;
		global.music = audio_play_sound(a_song_demo_hardcore, 1, true);
		audio_sound_gain(global.music, .75, 1);
	}
}