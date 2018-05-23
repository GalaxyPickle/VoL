/// @description give player full ghost

// Inherit the parent event
event_inherited();

with global.player {
	special = special_max;
}