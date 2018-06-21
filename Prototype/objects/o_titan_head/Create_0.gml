/// @description custom vars

// Inherit the parent event
event_inherited();

if !global.chat_titan {
	Q = instance_create(x, bbox_top, o_question_mark);	
}

message = global.message_titan[0];
if global.chat_titan
	message = global.message_titan[1];

message_sound = a_titan_hmm;
interact_text = "Examine";

sight_range = 1000;
close_range = 50;

within_range = false;
seen = false;

var x1 = x - 16, y1 = y - 18, x2 = x + 16;

lightsource1 = instance_create_layer(x1, y1, "layer_instance_lights", o_lightsource);
with lightsource1 pl_light_init(50, c_orange, .6);

lightsource2 = instance_create_layer(x2, y1, "layer_instance_lights", o_lightsource);
with lightsource2 pl_light_init(50, c_orange, .6);

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y - 18, 0);
audio_emitter_falloff(s_emit, 10, 100, 1);

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
part_type_color2(first_particle, c_orange, c_red);
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
ps_sys = global.ps_top;

emitter1 = part_emitter_create(ps_sys);
// set the emitter region
part_emitter_region(ps_sys, emitter1,
	x1 - 10, x1 + 10, y1 - 10, y1 + 10,
	ps_shape_ellipse, ps_distr_linear);

// make a STREAM from the emitter
part_emitter_stream(ps_sys, emitter1, first_particle, 1);

emitter2 = part_emitter_create(ps_sys);
// set the emitter region
part_emitter_region(ps_sys, emitter2,
	x2 - 10, x2 + 10, y1 - 10, y1 + 10,
	ps_shape_ellipse, ps_distr_linear);

// make a STREAM from the emitter
part_emitter_stream(ps_sys, emitter2, first_particle, 1);