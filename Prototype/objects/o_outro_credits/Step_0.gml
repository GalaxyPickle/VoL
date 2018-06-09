/// @description fade out

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

message = 
[
	"The Demon who came to destroy you has been defeated!",
	"Now, The Last Hope may be awakened!",
	"You win!",
	
	string(global.game_percent) + " Percent Completed \n" +
		global.game_percent >= 100 ?
			"Wow, impressive. Now you can boast to your friends!"
		:
			"Aw, you missed some things! Try again!",
	
	"Thank you for playing! \n" + "~ Made by Alex Lang ~"
];

// fade text in and out
if finished {
	
	reset_progression();
	quit_to_menu();
	
	if audio_is_playing(a_song_demo_hardcore)
		audio_stop_sound(a_song_demo_hardcore);
	
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