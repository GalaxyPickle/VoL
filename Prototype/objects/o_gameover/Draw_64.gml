/// @description draw gameover

if !draw_gameover
	exit;
	
draw_set_alpha(.75);
draw_rectangle_color(0, 0, surface_get_width(application_surface),
	surface_get_height(application_surface), 
	c_black, c_black, c_red, c_red, false);
	
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

draw_set_font(f_menu);
draw_text_outline_color(global.window_width / 2, global.window_height / 2,
	"GAME OVER", 1, c_red, 16, c_black, 1);
	
draw_set_font(f_menu_med);
//draw_text(400, 500, "Score: " + string(score));
draw_text_outline_color(global.window_width / 2, 
	global.window_height - global.window_height / 4,
	"PRESS START", 1, c_red, 16, c_black, alpha);
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);