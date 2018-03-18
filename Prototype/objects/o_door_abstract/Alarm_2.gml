/// @description show door opening

with lock 
	kill = true;
audio_play_sound(a_hooray_full, 1, false);

// fade out music
if audio_is_playing(global.music)
	global.mute = true;
	
// show the player the door opening...
with o_camera {
	alarm[1] = room_speed * 3;
	follow = other;
}

alarm[4] = room_speed * audio_sound_length(a_hooray_full);