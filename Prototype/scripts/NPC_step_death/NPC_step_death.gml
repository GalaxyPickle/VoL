/// @description step state for death

if starting {
	image_index = 0;
	velocity = [0, 0];
}

if image_index >= image_number - 1 {
	instance_destroy();
	layer_sprite_create("layer_instance_corpse", x, bbox_bottom, sprite_corpse);
}