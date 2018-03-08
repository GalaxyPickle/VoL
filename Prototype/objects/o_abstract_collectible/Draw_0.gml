/// @description show particle fancies

if !global.high_graphics {
	draw_self();
	exit;
}

outline_start(outline_thickness, outline_col, sprite_index, 4);
draw_self();
outline_end();