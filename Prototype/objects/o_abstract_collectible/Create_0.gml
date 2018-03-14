/// @description init vars

c_start = c_white;
c_end = c_white;

within_range = false;
sight_range = 25;

outline_col = c_white;
outline_thickness = 1;
outline_init();

type = 0;

light_color = c_white;

lightsource = instance_create_layer(x + sprite_get_width(sprite_index) / 2, 
	y + sprite_get_height(sprite_index) / 2, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(100, other.light_color, .6);
}

////////////////// sounds ///////////////
s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, 10, 100, 1);

sound = audio_play_sound_on(s_emit, a_tinkle, true, 1);

// particles
// make a particle type to use with the system
first_particle = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, pt_shape_pixel);
// set the scale of the particle
part_type_scale(first_particle, 30, 30);
// set the start size
part_type_size(first_particle, .1, .2, 0, 0);
// set the color over time
part_type_color2(first_particle, c_start, c_end);
// set the alpha over time
part_type_alpha3(first_particle, 0, 1, 0);
// set the speed starting
part_type_speed(first_particle, 0, .01, 0, 0);
// set the direction in degrees
part_type_direction(first_particle, 90, 90, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0, -90);
// orientation???
part_type_orientation(first_particle, 0, 0, 0, 0, true);
// particle life in game frames
part_type_life(first_particle, 90, 180);
// blend the particles
part_type_blend(first_particle, false);

// create an emitter
first_emitter = part_emitter_create(global.ps);
// set the emitter region
part_emitter_region(global.ps, first_emitter,
	x - sprite_get_width(sprite_index) / 2, x + sprite_get_width(sprite_index) * 3 / 2,
	y - sprite_get_height(sprite_index) / 2, y + sprite_get_height(sprite_index) * 3 / 2,
	ps_shape_ellipse, ps_distr_invgaussian);

// make a stream from the emitter
part_emitter_stream(global.ps, first_emitter, first_particle, -5);