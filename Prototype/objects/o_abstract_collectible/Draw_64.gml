/// @description show interaction keys

// if player is in interactable range...
if within_range {
	var t_margin = 5;
	// draw interaaction keys
	draw_sprite(s_textbox_keys, 0,
		global.window_width / 2, 
		global.window_height - t_margin * 8);
	draw_set_font(f_chat);
	var tc = c_white;
	draw_text_color(global.window_width / 2, global.window_height - t_margin * 8,
		"Harvest", tc, tc, tc, tc, 1);
}