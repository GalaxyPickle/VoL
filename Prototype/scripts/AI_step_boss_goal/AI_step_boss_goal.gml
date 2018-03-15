/// @description boss choose what state to be in

// set AI_goal_object
AI_get_nearest_goal_object();

////////////////////////////////
// determine what goal to have
////////////////////////////////

// if I don't have a goal object (no one to fight or follow)
//	then either sit still or wander in one direction
if AI_goal_object == noone {
	AI_goal = AI_states.wait;
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
				
////////////////////////////////
// end
////////////////////////////////
		