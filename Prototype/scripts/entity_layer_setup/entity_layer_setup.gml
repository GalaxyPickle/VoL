/// @desc set up collisions with proper layers

///////////////////////
// collision
var layer_id = layer_get_id("layer_tile_collision");
collision_tile_map_id = layer_tilemap_get_id(layer_id);

// platform
layer_id = layer_get_id("layer_tile_platform");
platform_tile_map_id = layer_tilemap_get_id(layer_id);

///////////////////////
// ghost collision
layer_id = layer_get_id("layer_tile_ghost_collision");
collision_ghost_tile_map_id = layer_tilemap_get_id(layer_id);

// ghost platform
layer_id = layer_get_id("layer_tile_ghost_platform");
platform_ghost_tile_map_id = layer_tilemap_get_id(layer_id);

///////////////////////
// normal collision
layer_id = layer_get_id("layer_tile_normal_collision");
collision_normal_tile_map_id = layer_tilemap_get_id(layer_id);

// normal platform
layer_id = layer_get_id("layer_tile_normal_platform");
platform_normal_tile_map_id = layer_tilemap_get_id(layer_id);

///////////////////////
// danger terrain
layer_id = layer_get_id("layer_tile_danger");
danger_tile_map_id = layer_tilemap_get_id(layer_id);

// ghost danger
layer_id = layer_get_id("layer_tile_danger_ghost");
danger_ghost_tile_map_id = layer_tilemap_get_id(layer_id);

///////////////////////
// SOUND TERRAIN
layer_id = layer_get_id("layer_tile_sound");
sound_tile_map_id = layer_tilemap_get_id(layer_id);