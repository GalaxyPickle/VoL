/// @description change alpha

if starting {
	size_target = (damage / damage_size_max) * size_cap;
	
	if size_target < size_base
		size_target = size_base;
	if size_target > size_cap
		size_target = size_cap;
	
	starting = false;
}

if fade
	alpha -= .05;

if alpha < 0
	instance_destroy();
	
y_target = lerp(y_target, y_target - placement_range, 1 / 30);
size = lerp(size, size_target, 1 / 5);

if alarm[0] < 0
	alarm[0] = flash_time;