/// @description code for player attacking executed every step

var vel_x = 0;

// ground attacks
if on_ground {
	
	// set current attack based on combo info
	if true {
		current_point_array = attack_ground_1_point_array;
		current_attack_stats = attack_ground_1_stats;
		
		sprite_index = sprite_attack_ground_1;
	}
	
	// if starting, take out stamina and start animation
	if starting {
		stamina -= current_attack_stats[2];
		
		velocity[vel_x] = image_xscale * TILE_SIZE - 1;
		
		image_index = 0;
	}
}
else {	// air attacks!
	
}

// check for enemy in range
for (var i = 0; i < array_length_1d(nearest_enemy); i++) {
	
	var enemy = nearest_enemy[@ i];
	
	// returns [found?, sweetspot?, headshot?]
	var hit_array = check_attack_collision(enemy);
	
	var found = hit_array[0];
	var sweetspot = hit_array[1];
	var headshot = hit_array[2];
	
	// apply any damage to enemy with script
	if found && !enemy.invincible
		apply_damage_other(current_attack_stats, enemy, sweetspot, headshot);
}

// cancel out stamina regen
stamina_[2] -= stamina_[4];
	
// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1
	current_state = states.idle;