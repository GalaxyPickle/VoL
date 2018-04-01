/// @description FIGHT THE PLAYER

////////////////////////////////
// stack queue
////////////////////////////////
move = false;

// X
// face the goal object always
if distance_to_object(AI_goal_object) > close_range * 3 / 4 {
	if AI_goal_object.x < x
		x_direction = -1;
	else if AI_goal_object.x > x
		x_direction = 1;
}

// first off, what is higher priority? my health or killing player?
//	obviously, killing player!!!
if on_ground && can_attack_ground {
	
	/////////////////////////////////////////////
	// if I'm being attacked
	/////////////////////////////////////////////
	/*
	if AI_goal_object.current_state == states.attack { 
		if roll_chance(.5) && can_dodge {
			NPC_step_queue(states.dodge);
		}
		else {
			if roll_chance(.4) {
				NPC_step_queue(states.attack);	
			}
		}
		exit;
	}
	*/
	if AI_goal_object.x < x
		x_direction = -1;
	else if AI_goal_object.x > x
		x_direction = 1;
	/////////////////////////////////////////////
	// if enemy is idling get 'em
	/////////////////////////////////////////////
	if roll_chance(1) {
		NPC_step_queue(states.attack);
	}
	else {
		if roll_chance(.4) && can_dodge {
			NPC_step_queue(states.dodge);
		}
		else {
			// do nothing...	
		}
	}
	exit;
	/////////////////////////////////////////////
}
// different logic for air attack stuff?
else if on_ground && !can_attack_ground {
	if roll_chance(.1)
		key_jump = true;
	move = true;
}
else if !on_ground && !can_attack_air {
	move = true;
}
else if !on_ground && can_attack_air {
	if roll_chance(.1) {
		NPC_step_queue(states.attack);
	}
}

// if I'm in the air
if !on_ground {
	if AI_goal_object.y > y + close_range / 2
		key_jump = false;
}