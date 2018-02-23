/// @description step state for death

if starting {
	image_index = 0;
	audio_play_sound(sound_death, 1, false);
}

sprite_index = sprite_death;

if image_index >= image_number - 1 {
	sprite_index = sprite_corpse;
	
	if on_ground
		instance_destroy();
	else if sprite_corpse == s_empty
		instance_destroy();
}