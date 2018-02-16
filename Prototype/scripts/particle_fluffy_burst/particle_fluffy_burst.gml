/// @desc create custom particle blast

/// @param x
/// @param y
/// @param particle_shape
/// @param size
/// @param color1
/// @param color2
/// @param lifespan_in_roomspeed
/// @param direction_in_degrees
/// @param speed
/// @param quantity

var xx = argument[0];
var yy = argument[1];
var p_shape = argument[2];
var p_size = argument[3];
var p_color1 = argument[4];
var p_color2 = argument[5];
var p_lifespan = argument[6];
var p_direction = argument[7];
var p_speed = argument[8];
var p_quantity = argument[9];

// make a particle type to use with the system
first_particle = part_type_create();

// set the shape of the particle
part_type_shape(first_particle, p_shape);
// set the scale of the particle
part_type_scale(first_particle, p_size, p_size);
// set the size over time
part_type_size(first_particle, 0.05, 0.1, -0.005, 0);
// set the color over time
part_type_color2(first_particle, p_color1, p_color2);
// set the alpha over time
part_type_alpha1(first_particle, 1);
// set the speed over time
part_type_speed(first_particle, p_speed / 2, p_speed * 2, 0, 0);
// set the direction in degrees
part_type_direction(first_particle, p_direction - 30, p_direction + 30, 0, 0);
// set the gravity and direction in degrees
part_type_gravity(first_particle, 0.05, -90);
// orientation???
part_type_orientation(first_particle, 0, 359, 10, 0, true);
// particle life in game frames
part_type_life(first_particle, p_lifespan - p_lifespan / 10, p_lifespan + p_lifespan / 10);
// blend the particles
part_type_blend(first_particle, true);

// create an emitter
first_emitter = part_emitter_create(global.ps);
// set the emitter region
part_emitter_region(global.ps, first_emitter,
	xx - 5, xx + 5, yy - 5, yy + 5,
	ps_shape_ellipse, ps_distr_gaussian);

// make a burst from the emitter
part_emitter_burst(global.ps, first_emitter, first_particle, 
	p_quantity + random_range(-p_lifespan / 10, p_lifespan / 10));
	
