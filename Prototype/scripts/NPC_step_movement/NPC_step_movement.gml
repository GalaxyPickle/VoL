/// @description NPC movement

var x_input = move * x_direction * horizontal_acceleration;
var vector2_x = 0;
var vector2_y = 1;

// horizontal movement
velocity[vector2_x] = clamp( velocity[vector2_x] + x_input, -max_velocity_x, max_velocity_x);

// ground moving
if on_ground {
	// set ground sprites
	if move && !on_wall {
		sprite_index = sprite_run;
		
		var img = array_length_1d(image_number);
		if (floor(image_index) == img / 2 || floor(image_index) == img - 1) && !audio_is_playing(sound_run) {
			audio_play_sound_on(s_emit, sound_run, false, 1);
		}
	}
	else {
		sprite_index = sprite_rest;
	}
	
	// jumping
	if key_jump && stamina >= jump_stamina_cost {
		velocity[vector2_y] = -jump_speed_y;
		stamina -= jump_stamina_cost;
		
		// sound
		audio_play_sound_on(s_emit, sound_jump, false, 1);
	}
}
else {
	// set jump sprite
	sprite_index = sprite_air;
	
	// short hop
	if !key_jump && velocity[vector2_y] <= -(jump_speed_y / 3) {
		velocity[vector2_y] = -(jump_speed_y / 3);
	}
}