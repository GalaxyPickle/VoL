/// @description play and mute audio/music


global.music = a_song_demo_hardcore;

global.music_intro = a_song_cavern_exploration;
if audio_is_playing(global.music_intro)
	audio_stop_sound(global.music_intro);
	
audio_play_sound(global.music_intro, 1, true);
audio_sound_gain(a_song_cavern_exploration, .8, 0);