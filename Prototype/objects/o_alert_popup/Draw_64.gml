/// @description draw rectangle and text

var col = c_black;
draw_set_alpha(.75);
draw_rectangle_color(0, global.window_height / 2 - height, 
	global.window_width, global.window_height / 2 + height,
	col, col, col, col, false);
	
if shutdown
	exit;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_chat);
draw_text_outline_color(global.window_width / 2, global.window_height / 2, 
	text, 1, c_black, 8, c_gray, 1);
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);