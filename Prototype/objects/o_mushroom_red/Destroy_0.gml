/// @description increase health

// Inherit the parent event
event_inherited();

global.player.vitality_max += global.player.vitality_max * .10;
global.player.vitality = global.player.vitality_max;