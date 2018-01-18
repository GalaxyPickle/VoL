/// @description draw debug hitbox info

draw_set_alpha(0.5);

/////////////////////////////////////
// draw bbox
/////////////////////////////////////
	
draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	
/////////////////////////////////////
// draw hitbox for body and head
/////////////////////////////////////
	
draw_set_color(c_yellow);
draw_rectangle(hitbox_left, hitbox_top, hitbox_right, hitbox_bottom, false);
	
draw_set_color(c_blue);
draw_rectangle(hitbox_head_left, hitbox_head_top, hitbox_head_right, hitbox_head_bottom, false);
	
	
/////////////////////////////////////
// draw center
/////////////////////////////////////
	
draw_set_color(c_lime);
var size = 1;
draw_rectangle( 
	bbox_left + abs(bbox_left - bbox_right) / 2 - size,
	bbox_top + abs(bbox_top - bbox_bottom) / 2 - size, 
	bbox_left + abs(bbox_left - bbox_right) / 2 + size, 
	bbox_top + abs(bbox_top - bbox_bottom) / 2 + size, false);
		
/////////////////////////////////////
// draw combat collision triangles
/////////////////////////////////////
	
if current_state == states.attack {	
		
	// get array of triangle points from preset data
	var a = current_point_array[ floor(image_index) ];	
	if array_length_1d(a) > 0 {
			
		var basic = a[0];
		var b = a[1];
			
		// draw basic attack triangle in blue
		draw_set_color(c_blue);
			
		var d = image_xscale;
		draw_triangle(x + d * basic[0], y + basic[1], x + d * basic[2], 
			y + basic[3], x + d * basic[4], y + basic[5], false);
			
		// if there's a sweetspot array then draw it in aqua
		if array_length_1d(b) > 0 {
				
			draw_set_color(c_aqua);
			for (var i = 0; i < array_length_1d(b); i++) {
					
				var sweet = b[i];
				draw_triangle(x + d * sweet[0], y + sweet[1], x + d * sweet[2], 
					y + sweet[3], x + d * sweet[4], y + sweet[5], false);
			}	
		}
	}
}