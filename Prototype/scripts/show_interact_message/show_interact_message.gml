/// @desc shows the GUI popup of gthe interact message 

///@param display_string
///@param OPTIONAL_alpha

var str = argument[0];
var alpha = 1;
if argument_count == 2
	alpha = argument[1];

draw_set_alpha(alpha);
var t_margin = 5;
var spr = s_textbox_keys;

// draw interaaction keys
outline_start(1, c_black, spr, 4);
draw_sprite(spr, 0,
	global.window_width / 2, 
	global.window_height - t_margin * 8);
outline_end();
	
draw_set_font(f_chat);
var tc = c_white;
draw_text_outline_color(global.window_width / 2, global.window_height - t_margin * 8,
	str, 1, c_black, 4, c_white, alpha);