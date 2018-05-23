/// @desc draw shiet

var draw_font = f_chat;
draw_set_font(draw_font);
	
if damage >= damage_size_flash {
	if flash
		flash_color = c_white;
	else flash_color = base_color;
}
else flash_color = base_color;

draw_text_transformed_color(
	x, --y, (positive ? "+" : "-") + string(damage), 
	size, size, rotation,
	flash_color, flash_color, flash_color, flash_color, alpha);	