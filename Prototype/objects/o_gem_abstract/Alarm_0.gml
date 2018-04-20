/// @description activate particles

lightsource = instance_create_layer(x, y, "layer_instance_lights", o_lightsource);
with lightsource pl_light_init(other.radius, other.color, .7);

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, 30, 300, 1);

//sound = audio_play_sound_on(s_emit, a_torch_burn, true, 1);

//////////////////////////////////////////////////
// make a particle type to use with the system

first_particle = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, pt_shape_square);
// set the scale of the particle
part_type_scale(first_particle, .3, .3);
// set the start size
part_type_size(first_particle, .7, .4, -0.005, .1);
// set the color over time
part_type_color2(first_particle, c_start, c_end);
// set the alpha over time
part_type_alpha3(first_particle, 1, 1, 0);
// set the speed over time
part_type_speed(first_particle, .3, .7, 0, .2);
// set the direction in degrees
part_type_direction(first_particle, 90, 90, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0.01, -90);
// orientation???
part_type_orientation(first_particle, 0, 0, 0, 0, true);
// particle life in game frames
part_type_life(first_particle, 40, 80);
// blend the particles
part_type_blend(first_particle, false);

// create an emitter
ps_sys = global.ps_between;
	
first_emitter = part_emitter_create(ps_sys);
var dist = 10;
// set the emitter region
part_emitter_region(ps_sys, first_emitter,
	x - dist, x + sprite_width + dist, 
	y - dist, y + sprite_height + dist,
	ps_shape_diamond, ps_distr_invgaussian);

// make a stream from the emitter
part_emitter_stream(ps_sys, first_emitter, first_particle, 5);
