/// @description select option

// set timer to countdown showing fail screen
if global.gameover {
	
	if !gameover_start {
		gameover_start = true;
		alarm[0] = gameover_display_time;
		alarm[2] = room_speed / 4;
		
		pause_screenshot = sprite_create_from_surface(
			application_surface, 0, 0,
			surface_get_width(application_surface), 
			surface_get_height(application_surface), 
			false, true, 0, 0);	
	
		instance_deactivate_all(true);
	}
	
	if keyboard_check_pressed(global.key_enter) || gamepad_button_check_pressed(0, global.gp_key_enter)
		room_goto(r_main_menu);

	exit;
}

if global.pause && ( keyboard_check_pressed(global.key_enter) ||
	keyboard_check_pressed(global.key_jump) ||
	gamepad_button_check_pressed(0, global.gp_key_jump) ||
	gamepad_button_check_pressed(0, global.gp_key_enter) ) 
{	
	switch current_option {	
		case 0:	// resume game
			global.pause = false;
			instance_activate_all();
			break;
			
		case 1: // quit
			room_goto(r_main_menu);
			break;
	}
}
else {
	if keyboard_check_pressed(global.key_escape) ||
		gamepad_button_check_pressed(0, global.gp_key_enter) 
	{
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
}