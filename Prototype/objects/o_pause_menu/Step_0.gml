 /// @description pause button

if keyboard_check_pressed(global.key_escape) ||
	gamepad_button_check_pressed(0, global.gp_key_enter)
{
	global.pause = !global.pause;	
}

if alpha < 1
	alpha = lerp(alpha, 1, .05);

if keyboard_check_pressed(global.key_enter) ||
	keyboard_check_pressed(global.key_jump) ||
	gamepad_button_check_pressed(0, global.gp_key_jump) {
	
	switch current_option {	
		case 0:	// resume game
			global.pause = false;
			break;
			
		case 1: // quit playthrough?
			
			save_progress();
			quit_to_menu();
			
			break;
	}
}