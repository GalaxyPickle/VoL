/// @description draw shaders and self

event_inherited();

if !global.high_graphics {
	draw_self();
	exit;
}
else {
	outline_start(outline_thickness, outline_color, sprite_index, 4);
	draw_self();
	outline_end();
}