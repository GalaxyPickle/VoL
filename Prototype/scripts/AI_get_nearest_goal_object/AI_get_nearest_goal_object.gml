/// @desc return nearest enemy or object to use as goal

var goal_object = noone;

// for every enemy in my list...
for (var i = 0; i < array_length_1d(enemy_list); i++) {
	
	// for every instance in the room of the current enemy...
	if instance_exists(enemy_list[i]) {
		
		// set the default goal object
		goal_object = instance_find(enemy_list[i], 0);
		
		// if another object of same type is closer, that is the goal object
		for (var j = 0; j < instance_number(enemy_list[i]); j++) {
			var enemy = instance_find(enemy_list[i], j);
			
			if distance_to_object(enemy) < sight_range &&
				distance_to_object(enemy) < distance_to_object(goal_object) 
			{
				goal_object = enemy;
			}
		}
	}
}
if goal_object != noone && distance_to_object(goal_object) < sight_range {
	AI_goal_object = goal_object;
}
else AI_goal_object = noone;