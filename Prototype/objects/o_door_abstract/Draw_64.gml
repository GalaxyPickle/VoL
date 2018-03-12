/// @description show interact thing

if distance_to_object(global.player) < 1 && !global.chatbox_up && !open && !opening {
	var t_margin = 4;
	
	// draw next button sprites no matter what
	draw_sprite(s_textbox_keys, 0,
		global.window_width / 2, 
		global.window_height - t_margin * 8);
	draw_set_font(f_chat);
	var tc = c_white;
	draw_text_color(global.window_width / 2,	
		global.window_height - t_margin * 8, interact_text, tc, tc, tc, tc, 1);
}