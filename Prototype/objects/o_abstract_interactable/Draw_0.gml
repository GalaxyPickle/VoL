/// @desc draw outline

if interact_conditions {
	
	// outline in white
	outline_start(1, c_white, sprite_index, 8);
	draw_self();
	outline_end();

	draw_sprite(s_arrow_default, 0, 
		x + sprite_width / 2, 
		(2 * move_arrow ? 1 : -1) + y - 10);
}
else draw_self();