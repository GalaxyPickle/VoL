/// @description player movement script

var x_input = x_direction * horizontal_acceleration;
var vector2_x = 0;
var vector2_y = 1;

// horizontal movement
velocity[vector2_x] = clamp( velocity[vector2_x] + x_input, -max_velocity_x, max_velocity_x);

// ground movement
if on_ground {
	// set ground sprites
	if x_direction != 0 {
		sprite_index = sprite_run;
	}
	else {
		sprite_index = sprite_rest;
	}
	
	// jumping
	if keyboard_check_pressed(key_jump) && stamina >= jump_stamina_cost {
		velocity[vector2_y] = -jump_speed_y;
		stamina -= jump_stamina_cost;
	}
}
else if on_wall_left {
	// make player face away from the wall
	sprite_index = sprite_walljump;
	
	// jumping
	if keyboard_check_pressed(key_jump) && stamina >= jump_stamina_cost {
		
		velocity = [jump_speed_y, -jump_speed_y / 2];
		stamina -= jump_stamina_cost;
		
		pause_input_start = true;
		image_xscale = 1;
	}
}
else if on_wall_right {
	// make player face away from the wall
	sprite_index = sprite_walljump;
	
	// jumping
	if keyboard_check_pressed(key_jump) && stamina >= jump_stamina_cost {
		
		velocity = [-jump_speed_y, -jump_speed_y / 2];
		stamina -= jump_stamina_cost;
		
		pause_input_start = true;
		image_xscale = -1;
	}
}
else {
	// set jump sprite
	sprite_index = sprite_jump;
	
	if keyboard_check_released(key_jump) && velocity[vector2_y] <= -(jump_speed_y / 3) {
		velocity[vector2_y] = -(jump_speed_y / 3);
	}
}