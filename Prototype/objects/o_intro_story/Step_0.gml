/// @description finish and goto intro area

if dialogue_read && ( keyboard_check_pressed(global.key_interact) || 
		gamepad_button_check_pressed(0, global.gp_key_interact) ) ||
	( keyboard_check_pressed(global.key_enter) ||
		gamepad_button_check_pressed(0, global.gp_key_enter) )
{
	global.chatbox_up = false;
	room_goto(r_first_room);
}