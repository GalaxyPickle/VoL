/// @description light controller object script

/// @param light_object

var light_object = argument0;

with (light_object) {

	if( !surface_exists(other.surf) ){
		other.surf = surface_create(other.camera_width, other.camera_height);
	}

	// set target surface
	surface_set_target(other.surf);
	draw_clear_alpha(0,0);

	/*
	// draw a light for light engine!!!
	var startx = floor((x - radius) / TILE_SIZE);
	var endx = floor((x + radius) / TILE_SIZE);
	var starty = floor((y - radius) / TILE_SIZE);
	var endy = floor((y + radius) / TILE_SIZE);

	//draw_set_color(c_yellow);
	//draw_rectangle(startx * TILE_SIZE, starty * TILE_SIZE, endx * TILE_SIZE, endy * TILE_SIZE, true);
	
	vertex_begin(light_vbuffer, light_vertex_format);
	for (var yy = starty; yy <= endy; yy++) {
		for (var xx = startx; xx <= endx; xx++) {
			
			var tile = tilemap_get(tilemap, xx, yy);
			if (tile != 0) {
				// get corners of the tile in question
				var px1 = xx * TILE_SIZE;     // top left
				var py1 = yy * TILE_SIZE;
				var px2 = px1 + TILE_SIZE;    // bottom right
				var py2 = py1 + TILE_SIZE;

				// project a shadow???!!!
				if( !sign_test( px1,py1, px2,py1, x,y) )
					project_shadow(light_vbuffer,  px1,py1, px2,py1, x,y );
					
				if( !sign_test( px2,py1, px2,py2, x,y) )
					project_shadow(light_vbuffer,  px2,py1, px2,py2, x,y );
					
				if( !sign_test( px2,py2, px1,py2, x,y) )
					project_shadow(light_vbuffer,  px2,py2, px1,py2, x,y );
					
				if( !sign_test( px1,py2, px1,py1, x,y) )
					project_shadow(light_vbuffer,  px1,py2, px1,py1, x,y );
			}
		}
	}
	vertex_end(light_vbuffer);    
	vertex_submit(light_vbuffer, pr_trianglelist, -1);
	*/

	// draw surface 
	surface_reset_target();
	shader_set(sh_light_radius);
	shader_set_uniform_f( LightPosRadius, x, y, radius, 0.0 );
	draw_surface( other.surf, other.camera_x, other.camera_y );
	shader_reset();
}