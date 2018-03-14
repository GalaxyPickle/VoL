/// @description show door opening

with lock 
	kill = true;
audio_play_sound(a_hooray_full, 1, false);
	
with o_camera {
	alarm[1] = room_speed * 3;
	follow = other;
}