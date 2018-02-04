/// @description draw debug and healthbars

if global.hitboxes {
	debug_draw_hitboxes();
}
if global.text {
	debug_draw_stats();
}

if draw_my_healthbars
	draw_stat_bars();