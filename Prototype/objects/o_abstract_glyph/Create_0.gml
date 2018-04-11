/// @description set colors

// Inherit the parent event
event_inherited();

interact_text = "Decipher";

////////////////////////////////////////////////
// lightsource
////////////////////////////////////////////////
lightsource = instance_create_layer(x - 5 + sprite_get_width(sprite_index) / 2, 
	y - 5 + sprite_get_height(sprite_index) / 2, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(100, c_orange, .5);
}

// other stuff
interactable = true;
type = global.glyph_intro[@ 0];

c_start = c_orange;
c_end = c_orange;

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, 25, 100, 1);

s_pulse = audio_play_sound_on(s_emit, a_glyph_pulse, true, 1);
shutdown = false;

// shader outline
outline_init();
outline_col = c_white;
outline_thickness = 1;

//////////////////////////////////////////////////
// make a particle type to use with the system
//////////////////////////////////////////////////
first_particle = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, pt_shape_square);
// set the scale of the particle
part_type_scale(first_particle, .2, .2);
// set the start size
part_type_size(first_particle, .1, .2, 0, 0);
// set the color over time
part_type_color2(first_particle, c_start, c_end);
// set the alpha over time
part_type_alpha3(first_particle, 1, 1, 0);
// set the speed over time
part_type_speed(first_particle, .5, 1, 0, 0);
// set the direction in degrees
part_type_direction(first_particle, 90, 90, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0.01, -90);
// orientation???
part_type_orientation(first_particle, 0, 0, 0, 0, true);
// particle life in game frames
part_type_life(first_particle, 60, 120);
// blend the particles
part_type_blend(first_particle, true);

// create an emitter
first_emitter = part_emitter_create(global.ps);
// set the emitter region
part_emitter_region(global.ps, first_emitter,
	x - 4 - 10, x + sprite_get_width(sprite_index) - 4 + 10,
	y - 4 - 10, y + sprite_get_height(sprite_index) - 4 + 10,
	ps_shape_rectangle, ps_distr_invgaussian);

// make a burst from the emitter
part_emitter_stream(global.ps, first_emitter, first_particle, -5);

///////////////////
// don't turn on if read already
///////////////////
if ds_list_find_index(global.active_list, id) != -1 {
	
	part_emitter_clear(global.ps, first_emitter);
	audio_stop_sound(s_pulse);
	shutdown = true;
	dialogue_read = true;
}