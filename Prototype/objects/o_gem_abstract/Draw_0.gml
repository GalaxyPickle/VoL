/// @description draw super beam

// Inherit the parent event
event_inherited();

if activated {
	var xx = x + sprite_width / 2;
	var yy = y + sprite_height / 2;
	
	draw_set_alpha(.7);
	draw_rectangle_color(xx - sprite_width / 8, yy, 
		xx + sprite_width / 8, yy - 3000, 
		c_end, c_end, c_start, c_start, false);
	draw_set_alpha(1);
}

draw_self();