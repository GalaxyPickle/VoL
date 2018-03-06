/// @description particle blast

// make a particle type to use with the system
first_particle = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, pt_shape_square);
// set the scale of the particle
part_type_scale(first_particle, 1, 1);
// set the size over time
part_type_size(first_particle, 0.05, 0.1, -0.005, 0);
// set the color over time
part_type_color1(first_particle, c_red);
// set the alpha over time
part_type_alpha1(first_particle, 1);
// set the speed over time
part_type_speed(first_particle, .5, 2, 0, 0);
// set the direction in degrees
part_type_direction(first_particle, 60, 120, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0.05, -90);
// orientation???
part_type_orientation(first_particle, 0, 359, 10, 0, true);
// particle life in game frames
part_type_life(first_particle, 30, 50);
// blend the particles
part_type_blend(first_particle, true);

// create an emitter
first_emitter = part_emitter_create(global.ps);
// set the emitter region
part_emitter_region(global.ps, first_emitter,
	x - 5, x + 5, y - 5, y + 5,
	ps_shape_ellipse, ps_distr_gaussian);

// make a burst from the emitter
part_emitter_burst(global.ps, first_emitter, first_particle, 15 + random(10));

instance_destroy();