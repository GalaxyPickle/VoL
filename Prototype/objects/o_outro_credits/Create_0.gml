/// @description start music and show subtitles

audio_play_sound(a_door_slam, 1, false);

if audio_is_playing(a_song_demo_hardcore)
	audio_sound_gain(a_song_demo_hardcore, 8, room_speed * 55);

// grab messages for intro
message = ["x"];

current_message = -1;
display_text = message[0];
alpha = 0;

alpha_skip = 1;
alpha_switch = false;

// seconds for each subtitle
timer = 
[
	8,
	8,
	8,
	8,
	8,
	8
];
for (var i = 0; i < array_length_1d(timer); i++) {
	timer[i] *= room_speed;	
}

// set the timer length for each msg
alarm[0] = 1;

finished = false;