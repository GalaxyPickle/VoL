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

var sweetspot = false;
var headshot = false;
var found = false;

var vel_x = 0;

// ground attacks
if on_ground {
	
	if attack_mode == 0 {
		current_point_array = attack_ground_1_point_array;
		current_attack_stats = attack_ground_1_stats;
		
		sprite_index = sprite_attack_ground_1;
	}
	
	if starting {
		stamina -= current_attack_stats[2];
		velocity[vel_x] = image_xscale * TILE_SIZE - 1;
		
		image_index = 0;
	}
}
else {	// air attacks!
	
}

// check for enemy in range
if enemy_in_range {
	
	// get array of triangle points from preset data
	var a = current_point_array[ floor(image_index) ];
	
	if array_length_1d(a) > 0 {
		var basic = a[0];
		var b = a[1];
			
		// direction
		var d = image_xscale;
		
		// 1. check for collision with basic attack vs hitbox of enemy
		if point_in_rectangle(x + d * basic[0], y + basic[1],
			nearest_enemy.hitbox_left, 
			nearest_enemy.hitbox_top,
			nearest_enemy.hitbox_right, 
			nearest_enemy.hitbox_bottom) ||
			point_in_rectangle(x + d * basic[2], y + basic[3],
			nearest_enemy.hitbox_left, 
			nearest_enemy.hitbox_top,
			nearest_enemy.hitbox_right, 
			nearest_enemy.hitbox_bottom) ||
			point_in_rectangle(x + d * basic[4], y + basic[5],
			nearest_enemy.hitbox_left, 
			nearest_enemy.hitbox_top,
			nearest_enemy.hitbox_right, 
			nearest_enemy.hitbox_bottom)
			/*
			x + d * basic[0], y + basic[1], 
			x + d * basic[2], y + basic[3], 
			x + d * basic[4], y + basic[5]) 
			*/
		{
			///////////////////
			// EVALUATION
			///////////////////
			sweetspot = false;
			headshot = false;
			found = true;
		}
		// 2. check for collision with sweet spot vs hitbox of enemy
		else if array_length_1d(b) > 0 {
				
			// iterate through all sweet-spot triangles in array and check for collision
			for (var i = 0; i < array_length_1d(b); i++) {
				var sweet = b[i];
				
				if point_in_rectangle(x + d * sweet[0], y + sweet[1],
					nearest_enemy.hitbox_left, 
					nearest_enemy.hitbox_top,
					nearest_enemy.hitbox_right, 
					nearest_enemy.hitbox_bottom) ||
					point_in_rectangle(x + d * sweet[2], y + sweet[3],
					nearest_enemy.hitbox_left, 
					nearest_enemy.hitbox_top,
					nearest_enemy.hitbox_right, 
					nearest_enemy.hitbox_bottom) ||
					point_in_rectangle(x + d * sweet[4], y + sweet[5],
					nearest_enemy.hitbox_left, 
					nearest_enemy.hitbox_top,
					nearest_enemy.hitbox_right, 
					nearest_enemy.hitbox_bottom)
					/*
					x + d * sweet[0], y + sweet[1],
					x + d * sweet[2], y + sweet[3], 
					x + d * sweet[4], y + sweet[5])
					*/
				{
					///////////////////
					// EVALUATION
					///////////////////
					sweetspot = true;
					headshot = false;
					found = true;
				}
			}	
		}
		if !found {
		
			// 3. check for collisions with basic attack vs headbox of enemy
			if rectangle_in_triangle(nearest_enemy.hitbox_head_left, nearest_enemy.hitbox_head_top,
				nearest_enemy.hitbox_head_right, nearest_enemy.hitbox_head_bottom,
				x + d * basic[0], y + basic[1], x + d * basic[2], 
				y + basic[3], x + d * basic[4], y + basic[5]) 
				> 0
			{
				///////////////////
				// EVALUATION
				///////////////////
				sweetspot = false;
				headshot = true;
				found = true;
			}
			/*
			// 4. check for collisions with sweet spot vs headbox of enemy
			else if array_length_1d(b) > 0 {
				
				// iterate through all sweet-spot triangles in array and check for collision
				for (var i = 0; i < array_length_1d(b); i++) {
					var sweet = b[i];
				
					if rectangle_in_triangle(nearest_enemy.hitbox_head_left, nearest_enemy.hitbox_head_top,
						nearest_enemy.hitbox_head_right, nearest_enemy.hitbox_head_bottom,
						x + d * sweet[0], y + sweet[1], x + d * sweet[2],
						y + sweet[3], x + d * sweet[4], y + sweet[5])
						> 0
					{
						///////////////////
						// EVALUATION
						///////////////////
						sweetspot = true;
						headshot = true;
						found = true;
					}
				}	
			}
			*/
		}
		
	}
	
	// apply any damage to enemy with script
	if found && !nearest_enemy.invincible
		apply_damage_other(current_attack_stats, nearest_enemy, sweetspot, headshot);
}

// cancel out stamina regen
stamina_[2] -= stamina_[4];
	
// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1
	current_state = states.idle;