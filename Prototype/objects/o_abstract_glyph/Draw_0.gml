/// @description draw outline if near

// Inherit the parent event
event_inherited();

if distance_to_object(global.player) < close_range {
	outline_start(outline_thickness, outline_col, sprite_index, 4);
	draw_self();
	outline_end();
}
else {
	draw_self();	
}