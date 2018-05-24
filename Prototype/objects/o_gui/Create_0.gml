/// @description display player GUI on screen

// grab player
player = instance_exists(o_player) ? o_player : noone;

flash = false;
flash_time = room_speed;
flash_stats = false;
alpha = 1;
alpha_default = 1;

flash_max = 0.005;
cur_combo = 0;
rot = true;

///////////// special

special_full = false;
flash_special = false;
flash_special_time = room_speed / 20;
alarm[0] = flash_special_time;

//////////////// checkpoints and mushrooms
mushrooms_max = 0;
mushrooms = 0;

checkpoints_max = 0;
checkpoints = 0;

alarm[1] = 1;