/// @description draw damage popup next to entity

draw_set_alpha(alpha);
draw_set_font(f_debug);

var separation = 15;
var distance = 100;

if array_length_1d(draw_array) > 0 {

	// draw all damage numbers or stats in array
	for (var i = 0; i < array_length_1d(draw_array); i++) {
		
		draw_set_color(c_yellow);
		if i == 0 draw_set_color(c_red);
		if i == 1 draw_set_color(c_orange);
		
		draw_text(x - distance, y - distance + i * separation, string(draw_array[i]));
	}
}

draw_set_color(c_white);
draw_set_alpha(1);