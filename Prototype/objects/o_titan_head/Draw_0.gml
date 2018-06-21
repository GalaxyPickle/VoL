/// @description draw self

// Inherit the parent event
event_inherited();

if within_range {
	outline_start(1, c_white, sprite_index, 8);
	draw_self();
	outline_end();
	
	if !global.chat_titan
		Q.visible = false;
}
else {
	draw_self();
	if !global.chat_titan
		Q.visible = true;
}