/// @description delete from NPC list

// Inherit the parent event
event_inherited();

var index = ds_list_find_index(global.NPC_list, id);
ds_list_replace(global.NPC_list, index, noone);