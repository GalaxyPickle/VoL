/// @description draw all stats in number form

/////////////////////////////////////
// draw stats: health, stamina, poise, special
/////////////////////////////////////
	
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