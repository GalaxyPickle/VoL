/// @description start music and show subtitles

if !audio_is_playing(a_song_intro_score)
	audio_play_sound(a_song_intro_score, 1, false);

// grab messages for intro
message = global.message_intro;
current_message = -1;
display_text = message[0];
alpha = 0;

// seconds for each subtitle
timer = 
[
	11,
	19 - 11,
	28 - 19,
	40 - 28,
	44 - 40,
	54 - 44,
	64 - 54,
	74 - 64,
	88 - 74,
	101 - 88,
	117 - 101,
	128 - 117,
	137 - 128,
	144 - 137,
	155 - 144,
	167 - 155,
	177 - 167
];
for (var i = 0; i < array_length_1d(timer); i++) {
	timer[i] *= room_speed;	
}

// set the timer length for each msg
alarm[0] = 1;

finished = false;

first_room = r_init_room;