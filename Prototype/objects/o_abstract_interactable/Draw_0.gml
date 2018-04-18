/// @description draw interactable arrow

if interactable && distance_to_object(global.player) < close_range {
	draw_sprite(interaction_arrow, 0, 
		x - sprite_get_xoffset(sprite_index) + sprite_width / 2, 
		(2 * move_arrow ? 1 : -1) + y - sprite_get_yoffset(sprite_index) - 10);	
}