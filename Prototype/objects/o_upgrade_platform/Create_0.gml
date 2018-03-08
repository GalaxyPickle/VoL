/// @description Insert description here
// You can write your code in this editor

////////////////////////////////////////////////
// lightsource
////////////////////////////////////////////////
lightsource = instance_create_layer(x + sprite_get_width(sprite_index) / 2, 
	y + sprite_get_height(sprite_index) / 2, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(300, c_red, .5);
}