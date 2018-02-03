/// @description draw damage popup

draw_set_alpha(alpha);
draw_set_font(f_debug);
if flash
	draw_set_color(c_red);
else draw_set_color(c_orange);

draw_text_transformed(origin.x + xx, origin.y + yy,
	string(damage),
	size,
	size,
	rotation
	)

draw_set_color(c_white);
draw_set_alpha(1);