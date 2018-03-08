/// @description draw debug and healthbars

draw_set_font(f_debug);

if global.hitboxes {
	debug_draw_hitboxes();
	debug_draw_sights();
}
if global.text {
	debug_draw_stats();
}

if draw_my_healthbars
	draw_stat_bars();