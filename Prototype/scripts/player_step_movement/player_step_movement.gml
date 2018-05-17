/// @description player movement script

var x_input = x_direction * horizontal_acceleration;
var vector2_x = 0;
var vector2_y = 1;

var jump_key_pressed = keyboard_check_pressed(key_jump) || gamepad_button_check_pressed(0, gp_jump);
var jump_key_released = keyboard_check_released(key_jump) || gamepad_button_check_released(0, gp_jump);
var jump_key_held = keyboard_check(key_jump) || gamepad_button_check(0, gp_jump);
var down_key_held = keyboard_check(key_down) || gamepad_axis_value(0, gp_axislv) <= -.5;

// horizontal movement
if !pause_input {
	velocity[vector2_x] = clamp( velocity[vector2_x] + x_input, -max_velocity_x, max_velocity_x);
}
	
image_speed = 1;

// ground movement
if on_ground {
	
	global.double_jump = true;
	
	if just_landed {
		pause_input_start = true;
		sprite_index = sprite_recover;
		current_state = states.recover;
	}
	
	// set ground sprites
	if x_direction != 0 {
		sprite_index = sprite_run;
		
		var run_playing = false;
		for (var i = 0; i < array_length_1d(run_sounds); i++) {
			if audio_is_playing(run_sounds[i]) {
				run_playing = true;
				break;
			}
		}
		
		if (floor(image_index) == 3 || floor(image_index) == 7) && !run_playing {
			var snd = tile_collide_at_points_sound(sound_tile_map_id,
				[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]);
				
			audio_play_sound_on(s_emit, run_sounds[snd >= 0 ? snd : 0], false, 1);
			//show_debug_message("playing run sound: " + string(snd));
		}
	}
	else {
		sprite_index = sprite_rest;
	}
	
	// jumping
	if jump_key_pressed && !pause_input {
		velocity[vector2_y] = -jump_speed_y;
		stamina -= jump_stamina_cost;
		
		// sound
		audio_play_sound_on(s_emit, sound_jump, false, 1);
	}
}
// wall jumping
else if on_wall_jump_left || on_wall_jump_right {
	
	sprite_index = sprite_air;
	
	// jumping
	if (x_direction == 1 && on_wall_jump_left) || (x_direction == -1 && on_wall_jump_right) {
		
		if jump_key_pressed {
			// extra check to ensure no stuck walljumps
			if x_direction == -1 image_xscale = -1;
			else if x_direction == 1 image_xscale = 1;
			
			velocity = [jump_speed_y * image_xscale, -jump_speed_y];
			pause_input_start = true;
			
			// sound
			audio_play_sound_on(s_emit, sound_jump, false, 1);
		}
	}
}
// not on ground - in air!
else {
	// set jump sprite
	sprite_index = sprite_air;
}

// double jump if you have the ability
if global.ability_ascension && global.double_jump && jump_key_pressed {
		
	velocity[vector2_y] = -jump_speed_y * 5 / 4;
		
	//global.double_jump = false;
	// sound
	audio_play_sound_on(s_emit, sound_jump, false, 1);
}

// short hop
if !on_ground && !jump_key_held && velocity[vector2_y] < 0 {
	velocity[vector2_y] = lerp(velocity[vector2_y], 0, .1);
}