/// @description player get input

//////////////////////////////////////////////////////////////////////////////
// 1. get direction
//////////////////////////////////////////////////////////////////////////////

x_direction = keyboard_check(key_right) - keyboard_check(key_left);

//////////////////////////////////////////////////////////////////////////////
// get input for dodge, attack, and special
//////////////////////////////////////////////////////////////////////////////

// record input for attack, dodge, and special
var queue_max = 2;

if ds_queue_size(input_queue) < queue_max {
	if keyboard_check_pressed(key_attack)
		ds_queue_enqueue(input_queue, states.attack);

	else if keyboard_check_pressed(key_dodge)
		ds_queue_enqueue(input_queue, states.dodge);

	else if keyboard_check_pressed(key_special)
		ds_queue_enqueue(input_queue, states.special);
}

if !ds_queue_empty(input_queue) && just_landed {
	ds_queue_clear(input_queue);	
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
		
			current_state = ds_queue_dequeue(input_queue);
			starting = true;
				
			break;
			
		//////////////////////////
		// SPECIAL INPUT
		//////////////////////////
		case states.special:
					
			break;
	}
}