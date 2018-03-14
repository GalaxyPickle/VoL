/// @description lightsource size

if !activated
	image_speed = 0;

if !activated && place_meeting(x, y, global.player) {
	activated = true;
	with lightsource _pl_color = c_lime;
	audio_play_sound(a_choir_1, 1, false);
	
	// particles!!!
	//////////////////////////////////////////////////
	// make a particle type to use with the system
	first_particle = part_type_create();

	var c_start = c_yellow;
	var c_end = c_green;

	// set the shape of the particle
	part_type_shape(first_particle, pt_shape_square);
	// set the scale of the particle
	part_type_scale(first_particle, .2, .2);
	// set the start size
	part_type_size(first_particle, .5, .3, -0.005, .2);
	// set the color over time
	part_type_color2(first_particle, c_start, c_end);
	// set the alpha over time
	part_type_alpha3(first_particle, 1, 1, 0);
	// set the speed over time
	part_type_speed(first_particle, .5, 1, 0, .2);
	// set the direction in degrees
	part_type_direction(first_particle, 90, 90, 0, 0);
	// set the gravity and direction in degrees
	part_type_gravity(first_particle, 0.005, -90);
	// orientation???
	part_type_orientation(first_particle, 0, 0, 0, 0, true);
	// particle life in game frames
	part_type_life(first_particle, 100, 200);
	// blend the particles
	part_type_blend(first_particle, true);

	var base_x = 64;
	var base_y = 32;
	var c = 4;

	// create an emitter
	first_emitter = part_emitter_create(global.ps);
	// set the emitter region
	part_emitter_region(global.ps, first_emitter,
		x + base_x - c, x + base_x + c,
		y + base_y - c, y + base_y + c,
		ps_shape_diamond, ps_distr_invgaussian);

	// make a burst from the emitter
	part_emitter_stream(global.ps, first_emitter, first_particle, -5);
}

if activated {
	if image_index < image_number - 1
		image_speed = 1;
	else image_index = image_number - 1;
}