/// @description try to beat up the player and dodge like a pr0

AI_get_nearest_goal_object();

if AI_goal_object == noone {
	if roll_chance(.30)
		AI_goal = AI_states.wait;
	else AI_goal = AI_states.wander;
}
else {
	if roll_chance(.20) {
		AI_goal = AI_states.spice;
	}
	else if distance_to_object(AI_goal_object) < close_range {
		AI_goal = AI_states.fight;	
	}
	else if distance_to_object(AI_goal_object) > close_range {
		AI_goal = AI_states.seek;
	}
}