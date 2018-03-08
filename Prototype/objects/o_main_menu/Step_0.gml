/// @description select option

if keyboard_check_released(global.key_enter) || keyboard_check_released(global.key_jump) ||
	gamepad_button_check_released(0, global.gp_key_enter) ||
	gamepad_button_check_released(0, global.gp_key_jump) {
	
	switch current_option {	
		case 0:	// start game
			room_goto(start_room);
			break;
		
		case 1: // load?
			break;
			
		case 2: // settings?
			break;
			
		case 3: // quit game
			game_end();
			break;
	}
}