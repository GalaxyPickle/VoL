/// @description setup for BLASTING

///////////////////////////////
// setup SYSTEM and PARTs
///////////////////////////////

// create the particle system
part_system_blast = part_system_create();

// create a particle piece
blast_particle = part_type_create();

// set size and shape and variety
part_type_shape(blast_particle, pt_shape_square);
part_type_scale(blast_particle,1,1);
part_type_size(blast_particle, 0.10, 0.15, -0.001, 0);

// set fade color over time
part_type_color2(blast_particle, c_red, c_yellow);

// set alpha fade over time
part_type_alpha2(blast_particle, 1, 0.75);

// set starting speed
part_type_speed(blast_particle, 0.1, 0.5, 0, 0);

// set direction on start
part_type_direction(blast_particle, 0, 359, 0, 0);

// set gravity
part_type_gravity(blast_particle, 0.02, -90);

// set rotation over time
part_type_orientation(blast_particle, 0, 359, random_range(-10, 10), 0, true);

// set lifetime of particles
part_type_life(blast_particle, 100, 150);

// set blending into other particles
part_type_blend(blast_particle, true);

//////////////////////////////
// setup EMITTER for bursting
/////////////////////////////////

part_emitter_blast = part_emitter_create(part_system_blast);

// set the emitter kind
part_emitter_region(part_system_blast, part_emitter_blast, 
	x - 5, x + 5, y - 5, y + 5,
	ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(part_system_blast, part_emitter_blast, blast_particle, 1);

part_system_automatic_draw(part_system_blast, false);
part_system_depth(part_system_blast, -1000);
/*
part_emitter_burst(part_system_blast, part_emitter_blast, blast_particle, 20 + random(20));
