/// @description code for player attacking executed every step

/// @param starting_attack
/// @param attack_mode

var starting = argument[0];
var attack_mode = argument[1];
// attack_mode
// 0 = default, queue empty
// 1 = default, queue populated
// 2 = charge attack, queue empty
// 3 = charge attack, queue populated
var enemy_in_range = argument[2];

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

// check for enemy in range
if enemy_in_range {
	
	// 1. check for collision with basic attack vs hitbox of enemy
	// if false
	// 2. check for collision with sweet spot vs hitbox of enemy
	// if false
	// 3. check for collisions with basic attack vs headbox of enemy
	// if false
	// 4. check for collisions with sweet spot vs headbox of enemy
	
	// apply any damage to enemy with script
}

// cancel out stamina regen
stamina_[2] -= stamina_[4];
	
// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1
	current_state = states.idle;