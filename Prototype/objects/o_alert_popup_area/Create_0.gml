/// @description show text for few secs

alpha = 0;
text = "testing";
height = 0;
height_max = 22;
shutdown = false;

max_a = 5 * room_speed;
alarm[0] = max_a;

audio_sound_gain(a_area_popup, .75, 0);
audio_play_sound(a_area_popup, 1, false);

outline_init();