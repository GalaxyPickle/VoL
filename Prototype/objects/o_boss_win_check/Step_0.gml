/// @description

if !show_win && global.boss_killed_reptilian {
	show_win = true;
	
	// stop boss music
	if audio_is_playing(global.music) {
		global.mute = true;
		//audio_sound_gain(a_song_demo_hardcore, 0, room_speed * 3);
	}
	audio_play_sound(a_explosion_headshot, 1, true);
	alarm[0] = room_speed;
}