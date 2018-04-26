/// @description player get input

// do we have a gamepad connected?
if gamepad_is_connected(0)
	gamepad_input = true;
else gamepad_input = false;

var attack_key_pressed = keyboard_check_pressed(key_attack) || gamepad_button_check_pressed(0, gp_attack);
var dodge_key_pressed = keyboard_check_pressed(key_dodge) || gamepad_button_check_pressed(0, gp_dodge);

var special_key_pressed = keyboard_check_pressed(key_special) || gamepad_button_check_pressed(0, gp_special);
var special_key_held = keyboard_check(key_special) || gamepad_button_check(0, gp_special);

//////////////////////////////////////////////////////////////////////////////
// 1. get direction
//////////////////////////////////////////////////////////////////////////////

if gamepad_input {
	var hd = gamepad_axis_value(0, gp_axislh);
	x_direction = clamp( (abs(hd) > .5 ? sign(hd) : 0) + 
		keyboard_check(key_right) - keyboard_check(key_left), -1, 1 );
}
else {
	x_direction = keyboard_check(key_right) - keyboard_check(key_left);
}

//////////////////////////////////////////////////////////////////////////////
// get input for dodge, attack, and special
//////////////////////////////////////////////////////////////////////////////

// record input for attack, dodge, and special
var queue_max = 2;

if ds_queue_size(input_queue) < queue_max {
	if attack_key_pressed
		ds_queue_enqueue(input_queue, states.attack);

	else if dodge_key_pressed
		ds_queue_enqueue(input_queue, states.dodge);
}

if !ds_queue_empty(input_queue) && just_landed {
	ds_queue_clear(input_queue);	
}

// first off, restart dequeue alarm every .3 seconds
if alarm[11] == -1
	alarm[11] = room_speed / 2;
	
// if idling, accept the first item from the input queue
if current_state == states.idle && !ds_queue_empty(input_queue) {
	current_state = ds_queue_dequeue(input_queue);
	starting = true;
}

////////////////////////////////////////////////////
// SUNYATA
////////////////////////////////////////////////////

if global.ability_sunyata {
	// sunyata
	if global.sunyata {
		ghost_mode = true;
	}
	else ghost_mode = false;

	// switching
	if !global.sunyata && special_key_pressed && special > 0 {
		global.sunyata = true;
		audio_play_sound(a_special_shift, 1, false);
		changed = false;
	}
	else if global.sunyata && (special_key_pressed || special <= 0) {
		global.sunyata = false;
		changed = false;
		audio_play_sound(a_special_unshift, 1, false);
	}
}