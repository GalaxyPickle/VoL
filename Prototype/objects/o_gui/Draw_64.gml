/// @description draw player health and stamina

var height = 10;		// height of stat bars
var spacing_y = 16;		// how far apart to draw stat bars
var y_start_spacing = 20;
var x_start_spacing = 130;

// healthbar vars
var x1 = x_start_spacing;
var y1 = y_start_spacing;
var x2 = x_start_spacing;
var y2 = y1 + height;

var amount = 0;			// current amount of the bar
var backcol = c_black;	// back color of the healthbar
var mincol = c_white;	// min color health
var maxcol = c_white;	// max color health

var direction_ = 0;		// anchored in left direction (0)
var showback = false;	// show bg?
var showborder = false;	// show black 1px border?

var col_arr = [$FF8C00, c_fuchsia, c_lime];

///////////////////////////////
// loop through 3 stats and draw them
///////////////////////////////



if flash_health
	draw_set_alpha(alpha);
else
	draw_set_alpha(lerp(draw_get_alpha(), 1, flash_time));

draw_set_font(f_gui_small);

#region
/*
for (var i = 0; i < array_length_1d(player.stat_array); i++) {
	
	var current_array = player.stat_array[i];

	y1 = y_start_spacing + (spacing_y + height) * i
	x2 = x1 + current_array[3];
	y2 = y1 + height;

	amount = (current_array[2] / current_array[3]) * 100;
	
	mincol = col_arr[i];
	maxcol = mincol;

	draw_healthbar(x1 + 3, y1 + 3, x2, y2 + 2, 
		amount, backcol, mincol, maxcol, direction_, showback, showborder);
	
	// draw the healthbar cage
	draw_sprite_ext(s_gui_hp_cage_beg, 0, x1, y1, 1, 1, 0, c_white, 1);
	//draw_sprite_ext(s_gui_hp_cage_mid, 0, x1 + spacing_y + 3, y1, x2 - x1 - spacing_y * 2, 1, 0, c_white, 1);
	//draw_sprite_ext(s_gui_hp_cage_beg, 0, x2 + 3, y1, -1, 1, 0, c_white, 1);
	
	// draw the text for numberss
	draw_text_outline_color( 80, height + 30 * i, current_array[2] <= 0 ? 0 : string(ceil(current_array[2])),
	2, c_white, 4, mincol, 1);
}
*/
#endregion

var dist = 2;
// draw HEALTH
draw_text_outline_color( x_start_spacing - 35, height + 5,
	player.vitality % 100 == 0  && player.vitality != 0 ? 99 : floor(player.vitality % 100),
	2, c_white, 4, col_arr[0], 1);

for (var i = 0; i < (player.vitality_max - 100) / 100; i++) {
	draw_sprite(s_gui_hp_part_bg, 0, x_start_spacing + sprite_get_width(s_gui_hp_part_bg) * i * 1, 
		y_start_spacing + dist);
}
for (var i = 0; i < (player.vitality - 100) / 100; i++) {
	draw_sprite(s_gui_hp_part, 0, x_start_spacing + sprite_get_width(s_gui_hp_part_bg) * i * 1, 
		y_start_spacing + dist);
}
dist += 40;

// draw SUNYATA
if global.ability_sunyata {
	draw_text_outline_color( x_start_spacing - 35, height + 45,
		player.special % 100 == 0 && player.special != 0 ? 99 : floor(player.special % 100),
		2, c_white, 4, col_arr[1], 1);

	for (var i = 0; i < (player.special_max - 100) / 100; i++) {
		draw_sprite(s_gui_hp_part_bg, 0, x_start_spacing + sprite_get_width(s_gui_hp_part_bg) * i * 1, 
			y_start_spacing + dist);
	}
	for (var i = 0; i < (player.special - 100) / 100; i++) {
		draw_sprite(s_gui_sun_part, 0, x_start_spacing + sprite_get_width(s_gui_hp_part_bg) * i * 1, 
			y_start_spacing + dist);
	}	
}

draw_set_alpha(1);
draw_sprite(s_gui_hp_symbol, 0, x_start_spacing - 60, 30);
if global.ability_sunyata
	draw_sprite(s_gui_sunyata_symbol, 0, x_start_spacing - 60, 70);

// draw the sunyata bars

////////////////////////////////////////////
// draw the mushroom and checkpoint status
////////////////////////////////////////////

// mushrooms
var mush_w = 64;

draw_sprite_ext(s_gui_mushroom_blue, 0, global.window_width - mush_w, 0, 2, 2, 0, c_white, 1);
draw_text_outline_color( global.window_width - mush_w, mush_w,
	string(mushrooms) + "/" + string(mushrooms_max), 2, c_white, 4, c_black, 1);

// sentinels
draw_sprite_ext(s_gui_checkpoint_eye, 0, global.window_width - mush_w * 2, 0, 2, 2, 0, c_white, 1);
draw_text_outline_color( global.window_width - mush_w * 2, mush_w,
	string(checkpoints) + "/" + string(checkpoints_max), 2, c_white, 4, c_black, 1);



// draw combo below health
//draw_text_outline_color( 40, ypos + yspac, "x" + string(global.combo), 2, c_white, 4, c_lime, 1);

// only draw special bar if you have the ability
/*
if !global.ability_discharge
	exit;
// draw special
var spec = c_silver;
draw_text_color( 40, ypos + yspac * 2, string(floor(player.special / player.special_max * 100)) + "%",
	spec, spec, spec, spec, 1);

if special_full {
	var alpha_t = 1;
	if flash_special
		alpha_t = 0;
	
	draw_text_color(40, 90, "SWORD CHARGED", c_red, c_silver, c_red, c_silver, alpha_t);
}






