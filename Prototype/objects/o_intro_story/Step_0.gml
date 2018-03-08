/// @description Insert description here
// You can write your code in this editor

if dialogue_read && ( keyboard_check_pressed(global.key_interact) || 
	gamepad_button_check_pressed(0, global.gp_key_interact) )
{
	room_goto(r_intro_area);
}