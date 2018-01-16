/// @description calculate all nearest enemy jazz

nearest_enemy = [];

// for every enemy in my list...
for (var i = 0; i < array_length_1d(enemy_list); i++) {
	
	// for every instance in the room of the current enemy...
	if instance_exists(enemy_list[i]) {
		for (var j = 0; j < instance_number(enemy_list[i]); j++) {
		
			// if the enemy is in range, add it to my nearest_enemy array
			var enemy = instance_find(enemy_list[i], j);
			
			if distance_to_object(enemy) < enemy_range
				nearest_enemy[j] = enemy;
		}
	}
}