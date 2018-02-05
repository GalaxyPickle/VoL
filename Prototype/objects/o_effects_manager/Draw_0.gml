/// @description make all particles draw to ss surface

with (o_particle_blast) {
	draw_set_alpha(1);

	//part_particles_create(stream, 100, 100, p_type, 30)

	surface_set_target(global.ss)
	draw_clear_alpha(0,0)

	part_system_drawit(stream)

	surface_reset_target()

	draw_surface(global.ss, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	
}