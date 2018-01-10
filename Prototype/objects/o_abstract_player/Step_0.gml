/// @description FSM movement, attack, dodge, pain, etc

event_inherited();

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

// first off, restart dequeue alarm every .5 seconds
if alarm[0] == -1
	alarm[0] = room_speed / 2;
	
///////////////////////////////////////////////////////////////////////////////
// logic for hitboxes, attack combos, and which state to be in
///////////////////////////////////////////////////////////////////////////////

var attack_mode = 0;
var starting = false;

// if idling, accept the first item from the input queue
if current_state == states.idle {
	if !ds_queue_empty(input_queue) {
		current_state = ds_queue_dequeue(input_queue);
		starting = true;
	}
}
		
///////////////////////////////////////////////////////////////////////////////
// now we can do the real FSM logic for stuff
///////////////////////////////////////////////////////////////////////////////

switch (current_state) {
	case states.pain:
		player_step_pain();
		break;
	
	case states.idle:
		player_step_movement();
		break;
	
	case states.attack:
		player_step_attack(starting, attack_mode);
		break;
	
	case states.dodge:
		player_step_dodge();
		break;
	
	case states.recover:
		player_step_recover();
		break;
}