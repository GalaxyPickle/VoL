/// @description particle controller object script

/// @param particle_object

var particle_object = argument0;

with (particle_object) {

	if( !surface_exists(other.surf) ){
		other.surf = surface_create(other.camera_width, other.camera_height);
	}

	// set target surface
	surface_set_target(other.surf);
	draw_clear_alpha(0,0);

	// draw surface 
	surface_reset_target();
	draw_self();
	draw_surface( other.surf, other.camera_x, other.camera_y );
}