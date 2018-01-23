/// @description draw debug and healthbars

if global.hitboxes {
	debug_draw_hitboxes();
}
if global.text {
	debug_draw_stats();
}

if draw_my_healthbars
	draw_stat_bars();

/////////////////////////////////////
// reset drawing color
/////////////////////////////////////
	
draw_set_color(c_white);
draw_set_alpha(1);