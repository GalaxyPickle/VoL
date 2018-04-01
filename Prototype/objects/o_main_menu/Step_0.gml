/// @description select option

if keyboard_check_pressed(global.key_enter) || keyboard_check_pressed(global.key_jump) ||
	gamepad_button_check_pressed(0, global.gp_key_enter) ||
	gamepad_button_check_pressed(0, global.gp_key_jump) {
	
	switch current_option {	
		case 0:	// start game
			room_goto(start_room);
			break;
			
		case 1: // settings?
			game_end();
			break;
	}
}