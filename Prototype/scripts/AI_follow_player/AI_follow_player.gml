/// @description just follows the player including jumps

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
				if enemy.x < x
					x_direction = -1;
				else if enemy.x > x
					x_direction = 1;
				
				if distance_to_object(enemy) > enemy_range {
					
					move = true
						
					// JUMP Y
					if enemy.y + enemy_range < y
						key_jump = true;
					
					if !on_ground && enemy.y - enemy_range > y
						key_jump = false;
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