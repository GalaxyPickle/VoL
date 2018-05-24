/// @description fade out

if !audio_is_playing(intro) || keyboard_check_pressed(global.key_enter) || 
	gamepad_button_check_pressed(0, global.gp_key_enter) 
{
	room_goto(first_room);
	audio_stop_sound(intro);
	
	global.death_vitality = global.player_start_vitality;
	global.death_vitality_current = global.death_vitality;
	
	global.death_sunyata = global.player_start_special;
	global.death_sunyata_current = global.death_sunyata;
	
	global.active_list = ds_list_create();
}

// fade text in and out
if finished
	exit;
	
var ff = 1.5;
if alarm[0] > timer[current_message] - ff * room_speed
	alpha += .011;
else if alarm[0] < ff * room_speed
	alpha -= .011;
else alpha = 1;

if finished && alpha > 0
	alpha -= .011;