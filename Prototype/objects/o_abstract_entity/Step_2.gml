/// @description call FSM switch

// if dead, DIE!!!
if dead
	current_state = states.death;
	
if just_landed {
	starting = true;
	current_state = states.recover;
}

if interacting
	move = false;

///////////////////////////////////////////////////////////////////////////////
// now we can do the real FSM
///////////////////////////////////////////////////////////////////////////////

FSM_switch();