/// @description set damage number, draw, end.

origin = noone;

vitality_damage_number = 0;
poise_damage_number = 0;

sweetspot = false;
headshot = false;

range = 20;
alpha = 1;

x += random_range(-range, range);
y += random_range(-range, range);

draw_array = [ 0, 0, "no sweetspot!", "no headshot!" ];