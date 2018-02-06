/// @description setup light engine

////////////////////////////////////
// shaders + light drawing
////////////////////////////////////

owner = noone;
radius = 200;
tilemap = layer_get_id("layer_tile_collision");

/// init shadow casting
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
light_vertex_format = vertex_format_end();

light_vbuffer = vertex_create_buffer();

surf = -1;

LightPosRadius = shader_get_uniform(sh_light_radius,"u_fLightPositionRadius");
