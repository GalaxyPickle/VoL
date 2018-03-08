/// @description optimize entities

if alarm[0] > -1
	exit;

// for each NPC, deactivate if outside of view and sight range
for (var i = 0; i < ds_list_size(global.NPC_list); i++) {
	
	var instance = global.NPC_list[| i];
	if string(instance) == "<undefined>" || instance == undefined || 
		instance == noone || instance == pointer_null {
		continue;
	}
	
	var dist = point_distance(global.player.x, global.player.y, instance.x, instance.y);
	
	if dist > global.game_width * 3 / 2 && dist > instance.sight_range {
		instance_deactivate_object(instance);
	}
	// we're within range bois, let player know there's an enemy
	else {
		instance_activate_object(instance);
		
		if dist < global.player.sight_range && instance.enemy {
			instance.outline_color = c_red;
		}
		else {
			instance.outline_color = c_black;	
		}
	}
}