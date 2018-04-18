/// @description either wander or follow player

// set AI_goal_object
AI_get_nearest_goal_object();

// DEFAULT
if AI_goal_object == noone {
	AI_goal = AI_states.wander;
}
else {
	AI_goal = AI_states.seek;	
}

// IMMOVABLE
if AI == AI_type.immovable {
	AI_goal = AI_states.wait;
	exit;
}
	
// HIDE
if AI == AI_type.friendly_hide {
	for (var i = 0; i < array_length_1d(enemy_list); i++) {
		var emmy = enemy_list[i];
		if instance_exists(emmy) && distance_to_object(instance_nearest(x, y, emmy)) < sight_range {
			AI_goal = AI_states.wait;
			exit;
		}
	}
	AI_goal = AI_states.wander;
	exit;
}
