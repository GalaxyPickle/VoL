/// @description start light

var xx = sprite_width / 4 * image_xscale;
var yy = sprite_height / 2;
if wide {
	xx = sprite_width / 2 * image_xscale;
}

lightsource = instance_create_layer(x + xx, y + yy, "layer_instance_lights", o_lightsource);
with lightsource pl_light_init(other.radius, other.color, .6);

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x + xx, y + yy, 0);
audio_emitter_falloff(s_emit, 10, 50, 1);

sound = audio_play_sound_on(s_emit, a_torch_burn, true, 1);

//////////////////////////////////////////////////
// make a particle type to use with the system

first_particle = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, pt_shape_square);
// set the scale of the particle
part_type_scale(first_particle, .2, .2);
// set the start size
part_type_size(first_particle, .7, .4, -0.01, .3);
// set the color over time
part_type_color2(first_particle, c_first, c_second);
// set the alpha over time
part_type_alpha3(first_particle, 1, 1, 0);
// set the speed over time
part_type_speed(first_particle, .5, 1, 0, .3);
// set the direction in degrees
part_type_direction(first_particle, 90, 90, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0.01, -90);
// orientation???
part_type_orientation(first_particle, 0, 0, 0, 0, true);
// particle life in game frames
part_type_life(first_particle, 30, 60);
// blend the particles
part_type_blend(first_particle, true);

// create an emitter
ps_sys = global.ps_between;
if layer == layer_get_id("layer_instance_top")
	ps_sys = global.ps_top;
	
first_emitter = part_emitter_create(ps_sys);
// set the emitter region
part_emitter_region(ps_sys, first_emitter,
	wide ? x + sprite_width / 4 * image_xscale : x + 2 * image_xscale, 
	wide ? x + sprite_width * 3 / 4 * image_xscale : x + (sprite_width / 2 - 2) * image_xscale,
	y + sprite_height / 2 - 2, y + sprite_height / 2 + 2,
	ps_shape_ellipse, ps_distr_linear);

// make a burst from the emitter
part_emitter_stream(ps_sys, first_emitter, first_particle, 1);
