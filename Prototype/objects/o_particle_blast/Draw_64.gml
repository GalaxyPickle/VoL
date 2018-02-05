/*

part_particles_create(stream, 400, 400, p_type, 2)

surface_set_target(ss)
draw_clear_alpha(0,0)

part_system_drawit(stream)

surface_reset_target()

draw_surface_stretched(ss,0,0,640,480)