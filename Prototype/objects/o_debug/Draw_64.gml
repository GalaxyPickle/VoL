/// @description show controls and stuff

var spacing = 10;
draw_set_alpha(1);

if global.debug {
	draw_set_font(f_debug);
	
	// static debug text
	draw_set_color(c_orange);
	for (var i = 0; i < array_length_1d(helper_text); i++) {
		draw_text(10, global.game_height - spacing * i - spacing, helper_text[i]);
	}
	
	// dynamic debug text
	draw_set_color(c_yellow);
	for (var i = 0; i < array_length_1d(debug_message); i++) {
		draw_text(10, global.game_height - array_length_1d(helper_text) * spacing - spacing * (i + 2), 
			debug_message[i]);
	}	
}

draw_set_color(c_white);