/// @description player movement script

var x_input = x_direction * horizontal_acceleration;
var vector2_x = 0;
var vector2_y = 1;

if gamepad_input {
	var jump_key_pressed = keyboard_check_pressed(key_jump) || gamepad_button_check_pressed(0, gp_jump);
	var jump_key_released = keyboard_check_pressed(key_jump) || gamepad_button_check_released(0, gp_jump);
}
else {
	var jump_key_pressed = keyboard_check_pressed(key_jump);
	var jump_key_released = keyboard_check_pressed(key_jump);
}

// horizontal movement
if !pause_input
	velocity[vector2_x] = clamp( velocity[vector2_x] + x_input, -max_velocity_x, max_velocity_x);

// ground movement
if on_ground {
	
	if just_landed {
		pause_input_start = true;
		sprite_index = sprite_recover;
		current_state = states.recover;
	}
	
	// set ground sprites
	if x_direction != 0 {
		sprite_index = sprite_run;
		
		if play_sound_footstep {
			if !audio_is_playing(sound_step)
				sound_step = audio_play_sound_on(s_emit, sound_run, false, 1);
		}
	}
	else {
		sprite_index = sprite_rest;
	}
	
	// jumping
	if jump_key_pressed && stamina >= jump_stamina_cost {
		velocity[vector2_y] = -jump_speed_y;
		stamina -= jump_stamina_cost;
		
		// sound
		audio_play_sound_on(s_emit, sound_jump, false, 1);
	}
}
// wall jumping
else if on_wall_left || on_wall_right {
	// make player face away from the wall
	sprite_index = sprite_walljump;
	
	// jumping
	if jump_key_pressed && stamina >= jump_stamina_cost {
		
		// make player face opposite direction after jumping
		if on_wall_left
			image_xscale = 1;
		if on_wall_right
			image_xscale = -1;
			
		velocity = [jump_speed_y * image_xscale, -jump_speed_y];
		stamina -= jump_stamina_cost;
		
		pause_input_start = true;
		
		// sound
		audio_play_sound_on(s_emit, a_player_jump, false, 1);
	}
}
else {
	// set jump sprite
	sprite_index = sprite_air;
	
	if jump_key_released && velocity[vector2_y] <= -(jump_speed_y / 3) {
		velocity[vector2_y] = -(jump_speed_y / 3);
	}
}