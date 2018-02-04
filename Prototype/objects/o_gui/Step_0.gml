/// @description flash alpha of stats for health

if alpha <= 0
	flash = false;
else if alpha >= 1
	flash = true;

flash_time = 1 / (player.vitality / player.vitality_max) * flash_max;

if !flash
	alpha += flash_time;
else if flash
	alpha -= flash_time;

if player.vitality <= player.vitality_max / 2
	flash_health = true;
else flash_health = false;