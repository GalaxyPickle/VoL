/// @description draw interactable arrow

if interactable && distance_to_object(global.player) < sight_range {
	draw_sprite(interaction_arrow, 0, 
		x - sprite_get_xoffset(sprite_index) + sprite_get_width(sprite_index) / 2, 
		(2 * move_arrow ? 1 : -1) + y - sprite_get_yoffset(sprite_index) - 10);	
}
draw_self();