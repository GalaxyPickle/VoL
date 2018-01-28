/// @description try to beat up the player and dodge like a pr0

var next_choice = -1;
var next_input_chance = .010;

// for every enemy in my list...
for (var i = 0; i < array_length_1d(enemy_list); i++) {
	
	// for every instance in the room of the current enemy...
	if instance_exists(enemy_list[i]) {
		for (var j = 0; j < instance_number(enemy_list[i]); j++) {
		
			var enemy = instance_find(enemy_list[i], j);
				
			////////////////////////////////
			// attack player?
			////////////////////////////////
				
			if distance_to_object(enemy) < enemy_range {
				
				if distance_to_point(x, enemy.y) < 50 
					&& irandom(room_speed) < room_speed * next_input_chance {
					// attack1!!!!!
					next_choice = states.attack;
				}
			}
				
			////////////////////////////////
			// end
			////////////////////////////////
		}
	}
}

// return -1 status on no choice
return next_choice;