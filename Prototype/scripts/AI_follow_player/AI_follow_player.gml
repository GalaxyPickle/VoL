/// @description just follows the player including jumps

if current_state != states.idle
	exit;

// for every enemy in my list...
for (var i = 0; i < array_length_1d(enemy_list); i++) {
	
	// for every instance in the room of the current enemy...
	if instance_exists(enemy_list[i]) {
		for (var j = 0; j < instance_number(enemy_list[i]); j++) {
		
			// if the enemy is in range...
			var enemy = instance_find(enemy_list[i], j);
			
			if distance_to_object(enemy) < sight_range {
				
				////////////////////////////////
				// face player
				////////////////////////////////
				
				// X
				if !combo {
					if enemy.x < x
						x_direction = -1;
					else if enemy.x > x
						x_direction = 1;
				}
				
				if distance_to_object(enemy) > enemy_range {
					
					move = true
						
					// JUMPing and following player
					if enemy.y + enemy_range / 2 < y
						key_jump = true;
					// stop holding down the jump key when you get above the player's level
					if !on_ground && enemy.y - enemy_range > y
						key_jump = false;
					// if I am stuck against a small wall and getting nowhere
					if on_wall_bottom_left || on_wall_bottom_right {
						key_jump = true;	
					}
				}
				else {
					move = false;
				}
				
				////////////////////////////////
				// end
				////////////////////////////////
			}
		}
	}
}