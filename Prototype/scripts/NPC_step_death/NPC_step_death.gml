/// @description step state for death

if starting {
	image_index = 0;
	audio_play_sound(sound_death, 1, false);
}

sprite_index = sprite_death;

if image_index >= image_number - 1 {
	sprite_index = sprite_corpse;
	
	if on_ground || sprite_corpse == s_empty {
		// remove from enemy list
		var index = ds_list_find_index(global.NPC_list, id);
		ds_list_replace(global.NPC_list, index, noone);
		
		instance_destroy();
	}
}