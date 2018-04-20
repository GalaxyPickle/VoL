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

// reget terrai

// normal terrain
var layer_id = layer_get_id("layer_tile_collision");
collision_tile_map_id = layer_tilemap_get_id(layer_id);

layer_id = layer_get_id("layer_tile_platform");
platform_tile_map_id = layer_tilemap_get_id(layer_id);

// ghost terrain
layer_id = layer_get_id("layer_tile_ghost_collision");
collision_ghost_tile_map_id = layer_tilemap_get_id(layer_id);

layer_id = layer_get_id("layer_tile_ghost_platform");
platform_ghost_tile_map_id = layer_tilemap_get_id(layer_id);

// danger terrain
layer_id = layer_get_id("layer_tile_danger");
danger_tile_map_id = layer_tilemap_get_id(layer_id);

// SOUND TERRAIN
layer_id = layer_get_id("layer_tile_sound");
sound_tile_map_id = layer_tilemap_get_id(layer_id);

layer_id = layer_get_id("layer_instance_player");
depth = layer_get_depth(layer_id);