/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
	
var door = instance_nearest(x, y, o_door_abstract);
global.death_room_pos = 
[
	door.x + sprite_get_width(s_door_gold) / 2,
	door.y + sprite_get_height(s_door_gold) / 2
];