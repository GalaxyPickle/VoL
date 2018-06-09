/// @description draw images

if finished
	exit;
	
// draw bg image!!!
draw_sprite_ext(s_intro_art, 0, xx, 0, 1, 1, 0, c_white, alpha2);

draw_sprite(s_intro_text_backdrop, 0, 0, global.window_height);

// draw skip text
draw_set_font(f_chat);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_outline_color(global.window_width / 2, global.window_height - 25, 
	"Press Start to skip...", 1, c_black, 4, c_gray, 1);
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// draw story text
var msg = current_message == -1 ? 0 : current_message;
if current_message == array_length_1d(message) {
	msg = current_message - 1;	
}
draw_text_ext_color(100, global.window_height - 125, message[msg], 
	40, global.window_width - 200, c_white, c_white, c_white, c_white, alpha);