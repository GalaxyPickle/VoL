/// @description draw bbox and debug info

if global.debug {
	
	draw_set_font(f_debug);

	// draw bbox
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	
	// draw center
	draw_set_color(c_lime);
	draw_set_alpha(1);
	var size = 1;
	draw_rectangle( 
		bbox_left + abs(bbox_left - bbox_right) / 2 - size,
		bbox_top + abs(bbox_top - bbox_bottom) / 2 - size, 
		bbox_left + abs(bbox_left - bbox_right) / 2 + size, 
		bbox_top + abs(bbox_top - bbox_bottom) / 2 + size, false);

	// draw stats
	draw_set_alpha(1);
	var spacing = 15;
	for (var i = 0; i < array_length_1d(stat_array); i++) {
		
		var array = stat_array[i]; 
		
		draw_set_color(array[1]);
		draw_text(bbox_left,
			bbox_top - array_length_1d(stat_array) * spacing - 20 + spacing * i, 
			array[0] + ": " + string(floor(array[2])) + " / " + string(floor(array[3])));
	}
	
	// draw some other stat info
	draw_set_color(c_white);
	for (var i = 0; i < array_length_1d(draw_variables); i++) {
		var array = draw_variables[i];
		draw_text(bbox_right + spacing, bbox_top + spacing * i, array[0] + string(array[1]));
	}

	// reset drawing color
	draw_set_color(c_white);
	draw_set_alpha(1);
}