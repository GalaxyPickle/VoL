/// @description step state for death

if starting {
	image_index = 0;
	if !audio_is_playing(sound_death)
		audio_play_sound(sound_death, 1, false);
}

sprite_index = sprite_death;

if image_index >= image_number - 1 {
	sprite_index = sprite_corpse;
	
	if on_ground || sprite_corpse == s_empty {
		// remove from enemy list
		var index = ds_list_find_index(global.NPC_list, id);
		ds_list_replace(global.NPC_list, index, noone);
		
		corpse = true;
		instance_deactivate_object(self);
		
		var corpse = layer_sprite_create("layer_asset_corpse", x, bbox_bottom, sprite_corpse);
		layer_sprite_xscale(corpse, image_xscale);
		
		if object_index == o_reptilian_large
			global.boss_killed_reptilian = true;
	}
}