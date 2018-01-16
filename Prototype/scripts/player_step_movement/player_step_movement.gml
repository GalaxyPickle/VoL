/// @description player movement script

var x_input = x_direction * horizontal_acceleration;
var vector2_x = 0;
var vector2_y = 1;

// horizontal movement
velocity[vector2_x] = clamp( velocity[vector2_x] + x_input, -max_velocity_x, max_velocity_x);

// jumping
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
else {
	// set jump sprite
	sprite_index = sprite_jump;
	
	if keyboard_check_released(key_jump) && velocity[vector2_y] <= -(jump_speed_y / 3) {
		velocity[vector2_y] = -(jump_speed_y / 3);
	}
}