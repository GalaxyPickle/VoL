/// @description update light engine

pl_update();

if alarm[0] > -1
	exit;

// for each light, deactivate if outside of view and sight range
for (var i = 0; i < ds_list_size(global.light_list); i++) {
	var instance = global.light_list[| i];
	if instance == -1 || instance == undefined || instance == noone || instance == pointer_null
		continue;
	
	var dist = point_distance(global.player.x, global.player.y, instance.x, instance.y);
	
	if dist > global.game_width / 2 + instance._pl_radius {
		instance_deactivate_object(instance);
	}
	// we're within range bois, let player know there's an enemy
	else {
		instance_activate_object(instance);
	}
}