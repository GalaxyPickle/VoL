/// @description psuedo destroy

// Inherit the parent event
event_inherited();

global.player.vitality = global.player.vitality_max;

// update the gui
with (o_gui) {
	mushrooms++;
}
