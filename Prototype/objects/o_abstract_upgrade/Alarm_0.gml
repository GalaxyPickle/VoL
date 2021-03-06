/// @description setup

lightsource = instance_create_layer(x + sprite_width / 2, 
	y + sprite_height / 2, "layer_instance_lights", o_lightsource);
with lightsource {
	pl_light_init(100, other.light_color, .6);
}

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
	x - sprite_width, x + sprite_width,
	y - sprite_height, y + sprite_height,
	ps_shape_diamond, ps_distr_invgaussian);

// make a STREAM from the emitter
part_emitter_stream(global.ps, first_emitter, first_particle, -5);