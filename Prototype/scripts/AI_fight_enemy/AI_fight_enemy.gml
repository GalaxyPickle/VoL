/// @description FIGHT THE PLAYER

var is_entity = false;
if object_get_parent(object_get_parent(AI_goal_object)) == o_abstract_parent
	is_entity = true;
	
//if !is_entity exit;
////////////////////////////////
// stack queue
////////////////////////////////
move = false;

// X
// face the goal object always 
if AI_goal_object.x < x
	x_direction = -1;
else if AI_goal_object.x > x
	x_direction = 1;

// first off, what is higher priority? my health or killing player?
//	obviously, killing player!!!
if on_ground {
	
	/////////////////////////////////////////////
	// if I'm being attacked
	/////////////////////////////////////////////
	if AI_goal_object.current_state == states.attack { 
		if roll_chance(.5) {
			NPC_step_queue(states.dodge);
		}
		else {
			if roll_chance(.4) {
				NPC_step_queue(states.attack);	
			}
		}
		exit;
	}
	/////////////////////////////////////////////
	// if enemy is idling get 'em
	/////////////////////////////////////////////
	if roll_chance(.4) {
		NPC_step_queue(states.attack);
	}
	else {
		if roll_chance(.4) {
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
else {
	
}