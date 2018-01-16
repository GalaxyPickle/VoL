/// @description show controls and stuff

// show all debug messages
draw_set_color(c_orange);
draw_set_font(f_debug);

var spacing = 15;
for (var i = 0; i < array_length_1d(helper_text); i++) {
	draw_text(10, i * spacing + spacing * 2, helper_text[i]);
}

draw_set_color(c_yellow);

if global.debug {
	for (var i = 0; i < array_length_1d(debug_message); i++) {
		draw_text(10, i * spacing + array_length_1d(helper_text) * spacing + spacing * 2, 
			debug_message[i]);
	}	
}

draw_set_color(c_white);