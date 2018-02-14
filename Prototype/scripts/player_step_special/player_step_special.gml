/// @description step state for SPECIAL

if special < special_max && sprite_index != sprite_special {
	current_state = states.idle;
	exit;
}

sprite_index = sprite_special;

// draw laser delayed
if starting {
	start_special = false;
	
	image_index = 0;
	velocity = [0, 0];
	
	alarm[9] = room_speed / 3;
	
	// sound warmup
	audio_play_sound_on(s_emit, a_sword_laser_warmup, false, 1);
}

// create the laser object
if start_special {
	start_special = false;
	special = 0;
	
	var layer_id = layer_get_id("layer_instance_popups");
	var laser = instance_create_layer(x + 50 * image_xscale, y, layer_id, o_player_laser);
	laser.image_xscale = image_xscale;
	
	// sound LASOR
	audio_play_sound_on(s_emit, a_laser_blast, false, 1);
	
	// check enemy collision
	for (var i = 0; i < array_length_1d(enemy_list); i++) {
		
		// for every instance in the room of the current enemy...
		if instance_exists(enemy_list[i]) {
			for (var j = 0; j < instance_number(enemy_list[i]); j++) {
		
				// if the enemy is out of range discontinue
				var enemy = instance_find(enemy_list[i], j);
				
				if enemy == undefined || enemy == pointer_null || enemy == noone ||
					sign(enemy.x - x) != sign(image_xscale)
					continue;
				
				// if the enemy is in the line of sight of the laser
				if distance_to_point(enemy.x, y) < 600 &&
					( image_xscale < 0 && enemy.x < x || image_xscale > 0 && enemy.x > x ) &&
					( enemy.bbox_bottom < laser.bbox_bottom && enemy.bbox_bottom > laser.bbox_top ) ||
					( enemy.bbox_top > laser.bbox_top && enemy.bbox_top < laser.bbox_bottom) ||
					( enemy.bbox_bottom > laser.bbox_bottom && enemy.bbox_top < laser.bbox_top)
				{
					// apply damage to enemies
					apply_damage_other(special_stats, enemy, false, false);
					
					// heal for 50% of damage
					var heal_damage = special_stats[1];
					heal_damage = heal_damage[0] / 2;
					vitality += heal_damage;
					// show the healing popup!!!!
					var layer_id = layer_get_id("layer_instance_popups");
					var damage_popup = instance_create_layer(x, hitbox_head_top, layer_id, o_damage_popup);
					damage_popup.damage = heal_damage;
					damage_popup.positive = true;
				}
			}
		}
	}
}

// end special mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1 {
	current_state = states.idle;
}