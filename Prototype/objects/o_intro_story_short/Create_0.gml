/// @description start music and show subtitles

intro = a_song_intro_score_short;

if !audio_is_playing(intro)
	audio_play_sound(intro, 1, false);

// grab messages for intro
message = global.message_intro;
current_message = -1;
display_text = message[0];
alpha = 0;

// seconds for each subtitle
timer = 
[
	11,
	23 - 11,
	29 - 23,
	41 - 29,
	57 - 41,
	68 - 57,
	76 - 68,
	84 - 76,
	94 - 84
];
for (var i = 0; i < array_length_1d(timer); i++) {
	timer[i] *= room_speed;	
}

// set the timer length for each msg
alarm[0] = 1;

finished = false;

first_room = r_init_room;