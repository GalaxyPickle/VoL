/// @description code for player attacking executed every step

/// @param starting_attack
/// @param attack_mode

var starting = argument[0];
var attack_mode = argument[1];
// 0 = default, queue empty
// 1 = default, queue populated
// 2 = charge attack, queue empty
// 3 = charge attack, queue populated

var vel_x = 0;

// ground attacks
if on_ground {
	
	if starting {
		image_index = 0;
		stamina_[2] -= attack_ground_1_stats[2];
		velocity[vel_x] = image_xscale * TILE_SIZE - 1;
	}
	
	if attack_mode == 0 {
		current_attack = attack_ground_1_point_array;
		sprite_index = sprite_attack_ground_1;
	}
}
else {	// air attacks!
	
}

// cancel out stamina regen
stamina_[2] -= stamina_[4];
	
// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1
	current_state = states.idle;