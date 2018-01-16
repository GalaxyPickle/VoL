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

// first off, restart dequeue alarm every .3 seconds
if alarm[11] == -1
	alarm[11] = room_speed / 3;
	
// if idling, accept the first item from the input queue
if current_state == states.idle {
	if !ds_queue_empty(input_queue) {
		
		if (on_ground && stamina_[2] >= attack_ground_1_stats[2]) ||
			(!on_ground && stamina_[2] >= attack_air_1_stats[2]) {
			current_state = ds_queue_dequeue(input_queue);
			starting = true;
		}
	}
}