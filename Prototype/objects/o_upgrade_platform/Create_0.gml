/// @description lightsource

////////////////////////////////////////////////
// lightsource
////////////////////////////////////////////////
lightsource = instance_create_layer(x + sprite_width / 2, 
	y + sprite_height / 2, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(300, c_aqua, .5);
}