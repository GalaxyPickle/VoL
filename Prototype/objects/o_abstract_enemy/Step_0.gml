/// @description FSM and AI
// You can write your code in this editor

// Inherit the parent event
event_inherited();

///////////////////////////////////////////////////////////////////////////////
// logic for hitboxes, attack combos, and which state to be in
///////////////////////////////////////////////////////////////////////////////

nearest_enemy = instance_exists(o_player) ? instance_nearest(x, y, o_player) : noone;

var attack_mode = 0;
var starting = false;
var hit = false;

///////////////////////////////////////////////////////////////////////////////
// now we can do the real FSM
///////////////////////////////////////////////////////////////////////////////

switch (current_state) {
	case states.pain:
		enemy_step_pain(starting);
		break;
	
	case states.idle:
		enemy_step_movement();
		break;
	
	case states.attack:
		enemy_step_attack(starting, attack_mode);
		break;
	
	case states.dodge:
		enemy_step_dodge();
		break;
	
	case states.recover:
		enemy_step_recover();
		break;
}