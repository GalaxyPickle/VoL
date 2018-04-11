/// @description psuedo destroy

// Inherit the parent event
event_inherited();

global.player.vitality_max += global.player.vitality_max * .10;
global.player.vitality = global.player.vitality_max;

if ds_list_find_index(global.active_list, id) == -1
	ds_list_add(global.active_list, id);

// update the gui
with (o_gui) {
	mushrooms++;
}
