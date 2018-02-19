/// @description AI

// Inherit the parent event
event_inherited();

///////////////////////////////////////////////////////////////////////////////
// AI
///////////////////////////////////////////////////////////////////////////////

if current_state != states.idle && current_state != states.attack
	exit;

// first off set the AI goal object to nearest goal or noone
//	and determine what goal the AI thinks is the current (highest) one
if alarm[3] < 0
	script_execute(script_AI_goal);

// next off execute the proper AI
switch AI_goal {
	case AI_states.fight: AI_fight_enemy();
		break;
	case AI_states.run: AI_flee_enemy();
		break;
	case AI_states.seek: AI_follow_enemy();
		break;
	case AI_states.spice: AI_spice();
		break;
	case AI_states.wander: AI_wander();
		break;
	case AI_states.wait: AI_wait();
		break;
}