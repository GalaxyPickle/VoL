/// @description step state for SPECIAL

image_speed = 1;

if starting {
	image_index = 0;
	velocity = [0, 0];
	
	audio_play_sound_on(s_emit, sound_death, 1, 1);
}

if image_index >= image_number - 1 {
	instance_destroy();
	layer_sprite_create("layer_instance_corpse", x, y, sprite_corpse);
}