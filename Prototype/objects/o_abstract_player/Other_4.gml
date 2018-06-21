/// @description redo ligts

// Inherit the parent event
event_inherited();

lightsource = instance_create_layer(x, y, "layer_instance_lights", o_lightsource);
light_radius = 300;
with lightsource {
	pl_light_init(other.light_radius, c_white, .7);
	pl_active = true;
	player = true;
}

entity_layer_setup();

layer_id = layer_get_id("layer_instance_player");
depth = layer_get_depth(layer_id);