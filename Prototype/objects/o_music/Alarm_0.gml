/// @description play ambiance
if !play_breath_ambiance
	exit;
	
alarm[0] = room_speed * 90; // repeate every 1.5 minutes

audio_play_sound(a_breath_ambiance, 1, false);
audio_play_sound(a_ambiance_rumble, 1, false);