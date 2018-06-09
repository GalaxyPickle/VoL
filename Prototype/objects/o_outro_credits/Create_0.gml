/// @description start music and show subtitles

audio_play_sound(a_door_slam, 1, false);

// grab messages for intro
message = [];

current_message = -1;
display_text = message[0];
alpha = 0;

alpha_skip = 1;
alpha_switch = false;

// seconds for each subtitle
timer = 
[
	5,
	10,
	15,
	20,
	25,
	30
];
for (var i = 0; i < array_length_1d(timer); i++) {
	timer[i] *= room_speed;	
}

// set the timer length for each msg
alarm[0] = 1;

finished = false;