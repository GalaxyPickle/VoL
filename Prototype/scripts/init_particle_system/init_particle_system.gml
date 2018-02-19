/// @description init the particle systems and the system for holding / running them

global.ps = part_system_create();
part_system_depth(global.ps, 500);
/*
// make a particle type to use with the system
pt_short_fire = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, pt_shape_square);
// set the scale of the particle
part_type_scale(first_particle, 1, 1);
// set the size over time
part_type_size(first_particle, 0.05, 0.1, -0.005, 0);
// set the color over time
part_type_color1(first_particle, c_red);
// set the alpha over time
part_type_alpha2(first_particle, 1, 0.7);
// set the speed over time
part_type_speed(first_particle, .5, 2, 0, 0);
// set the direction in degrees
part_type_direction(first_particle, 60, 120, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0.05, -90);
// orientation???
part_type_orientation(first_particle, 0, 359, 10, 0, true);
// particle life
part_type_life(first_particle, 80, 120);
// blend the particles
part_type_blend(first_particle, true);