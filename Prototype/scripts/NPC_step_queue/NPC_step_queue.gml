/// @description player get input

// @param AI_next_choice
var next_choice = argument[0];

//////////////////////////////////////////////////////////////////////////////
// get input for dodge, attack, and special
//////////////////////////////////////////////////////////////////////////////

// record input for attack, dodge, and special
var queue_max = 2;

if ds_queue_size(input_queue) < queue_max && next_choice != -1 {
	ds_queue_enqueue(input_queue, next_choice);
}

// first off, restart dequeue alarm every .3 seconds
if alarm[11] == -1
	alarm[11] = room_speed / 2;
	
// if idling, accept the first item from the input queue
if current_state == states.idle && !ds_queue_empty(input_queue) {
		
	// case for attack, dodge, special input
	switch ds_queue_head(input_queue) {
			
		//////////////////////////
		// ATTACK INPUT
		//////////////////////////
		case states.attack:
				
			current_state = ds_queue_dequeue(input_queue);
			starting = true;
				
			break;
			
		//////////////////////////
		// DODGE INPUT
		//////////////////////////
		case states.dodge:
				
			break;
			
		//////////////////////////
		// SPECIAL INPUT
		//////////////////////////
		case states.special:
			if special < special_max
				break;
				
					
			break;
	}
}