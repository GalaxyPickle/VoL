/// @description execute player pain animation and stat decrease

var ground_launch_velocity = image_xscale * TILE_SIZE - 1;

sprite_index = sprite_pain;
image_speed = 1;

if starting {
	image_index = 0;
}

if alarm[0] < room_speed / 2 {
	poise = poise_max;
	current_state = states.idle;
}