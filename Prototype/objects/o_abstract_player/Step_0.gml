/// @description FSM

event_inherited();

//////////////////////////////////////////////////////////////////////////////
// get input for dodge, attack, and special
//////////////////////////////////////////////////////////////////////////////
	
// set sound listener to be at camera position
audio_listener_position(x, y, 0);

player_step_queue();