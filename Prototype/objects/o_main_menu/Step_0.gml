/// @description select option

if keyboard_check_released(KEY_ENTER) {
	
	switch current_option {	
		case 0:	// start game
			room_goto_next();
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