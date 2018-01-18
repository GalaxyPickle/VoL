/// @description show controls and stuff

var spacing = 10;

if global.debug {
	draw_set_font(f_debug);
	
	// static debug text
	draw_set_color(c_orange);
	for (var i = 0; i < array_length_1d(helper_text); i++) {
		draw_text(10, GAME_HEIGHT - spacing * i, helper_text[i]);
	}
	
	// dynamic debug text
	draw_set_color(c_yellow);
	for (var i = 0; i < array_length_1d(debug_message); i++) {
		draw_text(10, GAME_HEIGHT - array_length_1d(helper_text) * spacing - spacing * (i + 1), 
			debug_message[i]);
	}	
}

draw_set_color(c_white);