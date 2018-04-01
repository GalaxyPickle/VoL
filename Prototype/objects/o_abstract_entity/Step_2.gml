/// @description call FSM switch

// if dead, DIE!!!
if dead && NPC {
	current_state = states.death;
	starting = true;	
}
	
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