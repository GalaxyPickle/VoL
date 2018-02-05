/// @description step state for death

if starting {
	image_index = 0;
	velocity = [0, 0];
}

sprite_index = sprite_death;

if image_index >= image_number - 1 {
	instance_destroy();
}