/// @description set damage number, draw, end.

origin = noone;

starting = true;
flash = false;
fade = false;

damage = 0;
sweetspot = false;
headshot = false;

size_base = .1;
size = size_base;
size_target = 1;
alpha = 1;
y_target = y;

placement_range = 20;
rotation = random_range(-30, 30);
size_cap = 5;
damage_size_max = 200;
flash_time = room_speed / 30;

xx = random_range(-placement_range, placement_range);
yy = random_range(-placement_range, 0);

alarm[1] = room_speed;