/// @description display player GUI on screen

// grab player
player = instance_exists(o_player) ? o_player : noone;

flash = false;
flash_time = room_speed;
flash_stats = false;
alpha = 1;
alpha_default = 1;

flash_max = 0.005;