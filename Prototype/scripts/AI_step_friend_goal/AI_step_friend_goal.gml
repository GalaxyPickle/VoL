/// @description either wander or follow player

// set AI_goal_object
AI_get_nearest_goal_object();

if AI_goal_object == noone {
	AI_goal = AI_states.wander;
}
else {
	AI_goal = AI_states.seek;	
}

if AI == AI_type.immovable
	AI_goal = AI_states.wait;