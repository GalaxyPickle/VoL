/// @description step state for SPECIAL

var special_key_released = keyboard_check_released(global.key_special) || 
	gamepad_button_check_released(0, global.gp_key_special);

if special <= 0 || special_key_released {
	current_state = states.idle;
	global.sunyata = false;
	exit;
}

global.sunyata = true;

special -= .5;