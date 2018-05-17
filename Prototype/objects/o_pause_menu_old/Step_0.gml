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
	}
	
	if keyboard_check_pressed(global.key_enter) || gamepad_button_check_pressed(0, global.gp_key_enter)
	{
		room_goto(r_main_menu);
		layer_destroy_instances("layer_instance_NPC");
		layer_destroy_instances("layer_instance_between");
		audio_stop_all();
	}

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
			audio_play_sound(a_menu_escape, 1, false);
			instance_activate_all();
			break;
			
		case 1: // quit
			audio_play_sound(a_menu_harsh_select, 1, false);
			room_goto(r_main_menu);
			layer_destroy_instances("layer_instance_NPC");
			layer_destroy_instances("layer_instance_between");
			audio_stop_all();
			
			break;
	}
}
else {
	if keyboard_check_pressed(global.key_escape) ||
		gamepad_button_check_pressed(0, global.gp_key_enter) 
	{
		audio_play_sound(a_menu_escape, 1, false);
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