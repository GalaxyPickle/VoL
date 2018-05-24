/// @desc saves progression thus far

if instance_exists(o_player)
	player = instance_nearest(x, y, o_player);
else 
	exit;

global.death_vitality = player.vitality_max;
global.death_vitality_current = player.vitality;

global.death_sunyata = player.special_max;
global.death_sunyata_current = player.special;

global.death_room = room;
global.died = true;