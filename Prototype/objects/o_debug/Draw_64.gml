/// @description show controls and stuff

var spacing = 10;
if global.debug {
	draw_set_font(f_debug);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	
	// static debug text
	var tc = c_orange;
	for (var i = 0; i < array_length_1d(helper_text); i++) {
		draw_text_color(10, global.window_height - spacing * i - spacing, helper_text[i],
			tc, tc, tc, tc, 1);
	}
	
	// dynamic debug text
	var tc2 = c_yellow;
	for (var i = 0; i < array_length_1d(debug_message); i++) {
		draw_text_color(10, 
			global.window_height - array_length_1d(helper_text) * spacing - spacing * (i + 2), 
			debug_message[i], tc2, tc2, tc2, tc2, 1);
	}	
}