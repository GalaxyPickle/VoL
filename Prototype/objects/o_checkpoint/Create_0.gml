/// @description lights and particles

radius = 250;
activated = false;

lightsource = instance_create_layer(x + sprite_get_width(sprite_index) / 2, 
	y + sprite_get_height(sprite_index) / 4, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(radius, c_yellow, .6);
}

///////////////////
// don't turn on if read already
///////////////////
if ds_list_find_index(global.active_list, id) != -1 {
	
	// particles
	alarm[0] = 1;
	activated = true;
	
	with (o_gui) {
		checkpoints++;
	}
	
	with lightsource _pl_color = c_lime;
}