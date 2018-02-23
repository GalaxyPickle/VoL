/// @description check for gameover

// Inherit the parent event
event_inherited();

if vitality <= 0
	global.gameover = true;