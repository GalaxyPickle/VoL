/// @description

if show_win {
	draw_set_font(f_menu_big);
	draw_text_outline_color(200, 300, "YOU WIN!!!", 2, c_black, 4, c_lime, 1);
	draw_set_font(f_menu);
	draw_text_outline_color(200, 500, "(the alpha) \nScore: " + string(score), 
		2, c_black, 4, c_lime, 1);
}