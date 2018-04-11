/// @description ready false install lock

// Inherit the parent event
event_inherited();

ready = false;

// add it to the active list 
if ds_list_find_index(global.active_list, id) != -1
	ready = true;