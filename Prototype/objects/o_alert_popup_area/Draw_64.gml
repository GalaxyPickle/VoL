/// @description draw rectangle and text

if height >= 2 {
	var col = c_black;
	draw_set_alpha(.8);
	draw_rectangle_color(0, global.window_height / 2 - height, 
		global.window_width, global.window_height / 2 + height,
		col, col, col, col, false);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(f_menu_med);
draw_text_outline_color(global.window_width / 2, global.window_height / 2, 
	text, 1, c_black, 8, c_white, alpha);
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);