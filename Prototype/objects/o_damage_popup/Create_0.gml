/// @description set damage number, draw, end.

starting = true;
flash = false;
fade = false;

damage = 0;
positive = true;
sweetspot = false;
headshot = false;

size_base = .3;
size = size_base;
size_target = .5;
size_cap = 2;
damage_size_max = 500;
damage_size_flash = 225;

alpha = 1;
placement_range = 5;
rotation = random_range(-5, 5);
flash_time = room_speed / 30;

flash_color = c_white;
base_color = c_red;

x += random_range(-placement_range, placement_range);
yy = y - 20;

alarm[1] = room_speed;