/// @description fade out

if !instance_exists(o_player)
	exit;

var player = instance_nearest(x, y, o_player);
//////////////////////////////////////////
// CALC GAME PERCENT COMPLETE
global.game_percent = 0;
	
// percent of health
global.game_percent += (player.vitality_max / 100) * 2;
// percent of sunyata
global.game_percent += (player.special_max / 100) * 2;
	
// percent of glyphs
var temp = 0;
for (var i = 0; i < array_length_1d(global.glyphs); i++) {
	var arr = global.glyphs[i];
	for (var j = 0; j < array_length_1d(arr); j++) {
		if arr[j] == true
			temp++;
	}
}
global.game_percent += temp * 2;
	
// percent of gems
temp = 0;
for (var i = 0; i < array_length_1d(global.gems); i++) {
	if global.gems[i] == true
		temp += 14;
}
	
global.game_percent += temp;
	
// percent of last boss y0000
if global.boss_killed_reptilian
	global.game_percent += 14;
///////////////////////////////////////////
if global.game_percent >= 100
	var msg = "Wow, impressive. Now you can boast to your friends!";
else
	var msg = "Aw, you missed some things! Try again!";

message = 
[
	"The Demon who came to destroy you has been defeated",
	"Now, The Last Hope may be awakened",
	"Congratulations, You Win!",
	string(global.game_percent) + "% Completed \n" + msg,
	"Thank you for playing! \n" + "~ Made by Alex Lang ~",
	"With help from Isananda"
];

// fade text in and out
if finished {
	
	reset_progression();
	quit_to_menu();
	
	audio_stop_sound(a_song_demo_hardcore);
	audio_stop_sound(a_song_spring);
	
	exit;
}
	
var ff = 1.5;
if alarm[0] > timer[current_message] - ff * room_speed
	alpha += .011;
else if alarm[0] < ff * room_speed
	alpha -= .011;
else alpha = 1;

if finished && alpha > 0
	alpha -= .011;