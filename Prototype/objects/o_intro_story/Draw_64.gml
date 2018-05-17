/// @description draw images

if finished
	exit;

// draw skip text
draw_set_font(f_chat);
draw_text_outline_color(global.window_width / 2, global.window_height / 2, "Press Start to skip...",
	1, c_black, 4, c_gray, 1);

// draw story text
var msg = current_message == -1 ? 0 : current_message;
if current_message == array_length_1d(message) {
	msg = current_message - 1;	
}
draw_text_ext_color(100, global.window_height - 100, message[msg], 
	40, global.window_width - 200, c_white, c_white, c_white, c_white, alpha);