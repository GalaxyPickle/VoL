/// @description lights and particles

radius = 250;
activated = false;

lightsource = instance_create_layer(x + sprite_width / 2, 
	y + sprite_height / 4, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(radius, c_yellow, .6);
}

///////////////////
// don't turn on if read already
///////////////////
if check_if_activated() {
	
	// particles
	alarm[0] = 1;
	activated = true;
	
	with (o_gui) {
		checkpoints++;
	}
	
	with lightsource _pl_color = c_lime;
}