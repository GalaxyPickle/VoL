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

// first off, restart dequeue alarm every .3 seconds
if alarm[0] == -1
	alarm[0] = room_speed / 3;
	
///////////////////////////////////////////////////////////////////////////////
// logic for hitboxes, attack combos, and which state to be in
///////////////////////////////////////////////////////////////////////////////

var attack_mode = 0;
var starting = false;
var enemy_in_range = false;

nearest_enemy = instance_exists(o_reptilian_large) ? instance_nearest(x, y, o_reptilian_large) : noone;

if distance_to_object(nearest_enemy) <= 200
	enemy_in_range = true;

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

// if my poise is broken, immediately enter into hurt animation and get hit
if poise_[2] <= 0 {
	current_state = states.pain;
	starting = true;
}
		
///////////////////////////////////////////////////////////////////////////////
// now we can do the real FSM
///////////////////////////////////////////////////////////////////////////////

switch (current_state) {
	case states.pain:
		player_step_pain(starting);
		break;
	
	case states.idle:
		player_step_movement();
		break;
	
	case states.attack:
		player_step_attack(starting, attack_mode, enemy_in_range);
		break;
	
	case states.dodge:
		player_step_dodge();
		break;
	
	case states.recover:
		player_step_recover();
		break;
}