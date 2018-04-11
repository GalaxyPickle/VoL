/// @description boss choose what state to be in

// set AI_goal_object
AI_get_nearest_goal_object();

////////////////////////////////
// determine what goal to have
////////////////////////////////

if alarm[8] > 0
	exit;
else {
	// default speed for next "think" (1 sec)
	alarm[8] = room_speed;
	
	// if I just attacked, I have to rest
	if AI_goal == AI_states.fight && vitality > vitality_max / 4 {
		AI_goal = AI_states.wait;
		alarm[8] = room_speed * 3;
		exit;
	}
}

// if I don't have a goal object (no one to fight or follow)
//	then either sit still or wander in one direction
if AI_goal_object == noone {
	AI_goal = AI_states.wait;
}
else if vitality < vitality_max / 4 {
	if distance_to_object(AI_goal_object) < close_range {
		AI_goal = AI_states.fight;
		alarm[8] = room_speed / 4;
	}
	else AI_goal = AI_states.seek;
}
else {
	if roll_chance(1) && distance_to_object(AI_goal_object) < close_range {
		AI_goal = AI_states.fight;
		alarm[8] = room_speed * 3;
	}
	else if roll_chance(.90) && distance_to_object(AI_goal_object) > close_range {
		AI_goal = AI_states.seek;	
	}
	else AI_goal = AI_states.wait;
}
				
////////////////////////////////
// end
////////////////////////////////
		