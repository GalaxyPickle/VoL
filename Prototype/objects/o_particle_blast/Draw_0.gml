draw_set_alpha(1);

//part_particles_create(stream, 100, 100, p_type, 30)

surface_set_target(ss)
draw_clear_alpha(0,0)

part_system_drawit(stream)

surface_reset_target()

draw_surface(ss, x, y);