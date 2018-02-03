/// @description select option

// set timer to countdown showing fail screen
if global.gameover {
	audio_stop_all();
	
	if alarm[0] == -1 {
		alarm[0] = gameover_display_time;
		
		pause_screenshot = sprite_create_from_surface(
			application_surface, 0, 0,
			surface_get_width(application_surface), 
			surface_get_height(application_surface), 
			false, true, 0, 0);	
	
		instance_deactivate_all(true);
	}

	exit;
}

if global.pause && keyboard_check_released(KEY_ENTER) {
	
	switch current_option {	
		case 0:	// resume game
			global.pause = false;
			instance_activate_all();
			break;
			
		case 1: // quit
			audio_stop_all();
			room_goto(r_main_menu);
			break;
	}
}

if keyboard_check_pressed(KEY_ESCAPE) {
	global.pause = !global.pause;
	
	// if paused take a screenshot of the game and set it as the bg
	if global.pause {
		pause_screenshot = sprite_create_from_surface(
			application_surface, 0, 0,
			surface_get_width(application_surface), 
			surface_get_height(application_surface), 
			false, true, 0, 0);	
	
		instance_deactivate_all(true);
	}
	if !global.pause {
		instance_activate_all();
	}
}