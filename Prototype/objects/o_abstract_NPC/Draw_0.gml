/// @description draw red outline for sunyata

// Inherit the parent event
event_inherited();

// draw the player
if global.sunyata {
	if enemy var col = c_red;
	else var col = c_blue;
	
	surface_set_target(global.player_surface);
	
	outline_start(1, col, sprite_index, 4);
	draw_sprite_ext(sprite_index, image_index, (x - global.view_x) * 2, (y - global.view_y) * 2, 
		image_xscale * 2, image_yscale * 2, 0, c_white, .5);
	outline_end();
	
	surface_reset_target();
}