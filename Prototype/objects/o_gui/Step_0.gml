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

// flash special timer
if player.special >= player.special_max
	special_full = true;
else special_full = false;

if special_full && alarm[0] < 0
	alarm[0] = flash_special_time;
	
// track player object
if global.player == noone && instance_exists(o_player)
	global.player = instance_nearest(x, y, o_player);