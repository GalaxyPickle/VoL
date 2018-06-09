/// @description draw images

if finished
	exit;

// draw bg
var c = c_black;
draw_rectangle_color(0, 0, global.window_width, global.window_height,
	c, c, c, c, false);

// draw story text
draw_set_font(f_chat);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var msg = current_message == -1 ? 0 : current_message;
if current_message == array_length_1d(message) {
	msg = current_message - 1;	
}
draw_text_ext_color(global.window_width / 2, 
	global.window_height / 2, message[msg], 
	40, global.window_width - 200, 
	c_white, c_white, c_white, c_white, alpha);
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);