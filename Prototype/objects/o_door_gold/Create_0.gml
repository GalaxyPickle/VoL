/// @description ready false install lock

// Inherit the parent event
event_inherited();

ready = false;

// see if it's active already
if check_if_activated()
	ready = true;