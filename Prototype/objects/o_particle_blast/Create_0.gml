/// @description setup for BLASTING

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
part_type_direction(first_particle, 0, 359, 0, 0);

// set gravity
part_type_gravity(first_particle, 0.02, -90);

// set rotation over time
part_type_orientation(first_particle, 0, 359, random_range(-10, 10), 0, true);

// set lifetime of particles
part_type_life(first_particle, 100, 150);

// set blending into other particles
part_type_blend(first_particle,true);

part_emitter_region(MouseParticle,green_mouse_emitter,x,x,y,y,0,0);
 
if x != old_x || old_y != y
{
    part_emitter_burst(MouseParticle,green_mouse_emitter,green_mouse_particle,5);
}