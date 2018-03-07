/// @description update light engine


var sun_p = sun;
sun = global.sunyata;

if sun != sun_p {
	if global.sunyata {
		pl_option_set_ambience(c_dkgray, .3);	
	}
	else pl_option_set_ambience(c_black, .5);
}

pl_update();

if alarm[0] > -1
	exit;

// for each light, deactivate if outside of view and sight range
for (var i = 0; i < ds_list_size(global.light_list); i++) {
	var instance = global.light_list[| i];
	if instance == -1 || instance == undefined || instance == noone || instance == pointer_null
		continue;
	
	var dist = point_distance(global.player.x, global.player.y, instance.x, instance.y);
	
	if instance.pl_active && dist > global.game_width / 2 + instance._pl_radius {
		instance.pl_active = false;
	}
	// we're within range bois
	else {
		instance.pl_active = true;
	}
}