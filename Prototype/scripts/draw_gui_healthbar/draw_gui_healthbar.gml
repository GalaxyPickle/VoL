/// @desc draw gui healthbar with sprite part vals

/// @param dist
/// @param x_start_spacing
/// @param y_start_spacing
/// @param sprite_bg_gui
/// @param sprite_active_gui
/// @param max_stat
/// @param current_stat
/// @param unit
/// @param xoffset
/// @param yoffset

var dist = argument0;
var x_start_spacing = argument1;
var y_start_spacing = argument2;
var spr_bg = argument3;
var spr_active = argument4;
var max_stat = argument5;
var current_stat = argument6;
var unit = argument7;
var xoffset = argument8;
var yoffset = argument9;

// draw HEALTH
var spacing = 40;
var spr_w = sprite_get_width(spr_bg);

// bg
for (var i = 0; i < (max_stat) / unit; i++) {
	draw_sprite(spr_bg, 0, x_start_spacing + spacing * i, 
		y_start_spacing + dist);
}
// hp
for (var i = 0; i < (current_stat - (current_stat == max_stat ? 0 : unit) ) / unit; i++) {
	draw_sprite(spr_active, 0, x_start_spacing + spacing * i, 
		y_start_spacing + dist);
}
// remainder
if current_stat != max_stat && current_stat != 0 {
	draw_sprite_part(spr_active, 0, 0, 0, 
		current_stat mod unit == 0 ? 
			spr_w : current_stat mod unit / unit * spr_w, 
		sprite_get_height(spr_active), 
		x_start_spacing + spacing * floor( (current_stat) / unit ) - spr_w / 2 + xoffset, 
		y_start_spacing + dist - spr_w / 2 + yoffset);
}