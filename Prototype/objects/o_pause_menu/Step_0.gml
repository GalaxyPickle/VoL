/// @description pause button

if keyboard_check_pressed(global.key_escape) || gamepad_button_check_pressed(0, global.gp_key_escape)
{
	global.pause = !global.pause;	
}