/// @description draw player health and stamina

var height = 10;		// height of stat bars
var spacing_y = 16;		// how far apart to draw stat bars
var y_start_spacing = 20;
var x_start_spacing = 60;

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
draw_gui_healthbar(dist, x_start_spacing, y_start_spacing, s_gui_hp_symbol_bg,
	s_gui_hp_symbol, player.vitality_max, player.vitality, 100, 0, 2);

dist += 40;

// draw SUNYATA
if global.ability_sunyata {
	draw_gui_healthbar(dist, x_start_spacing, y_start_spacing, s_gui_sunyata_symbol_bg,
		s_gui_sunyata_symbol, player.special_max, player.special, 100, 0, 6);
}

dist += 40;

// draw COMBOOO
//if global.ability_whirlwind {
//	draw_gui_healthbar(dist, x_start_spacing, y_start_spacing, s_gui_whirlwind_bg,
//		s_gui_whirlwind, global.combo_default_max, global.combo, 1, 0, 0);
//}

////////////////////////////////////////////
// draw the checkpoint status
////////////////////////////////////////////


//draw_sprite_ext(s_gui_mushroom_blue, 0, global.window_width - mush_w, 0, 2, 2, 0, c_white, 1);
//draw_text_outline_color( global.window_width - mush_w, mush_w,
//	string(mushrooms) + "/" + string(mushrooms_max), 2, c_white, 4, c_black, 1);

draw_set_halign(fa_center);

// mushrooms
var mush_w = 64;

// draw COMBO when in shadow mode
if player.ghost_mode {
	var prev_combo = cur_combo;
	cur_combo = global.combo;

	if prev_combo != cur_combo
		rot = !rot;

	var size = .5 + cur_combo * .05;
	var rotation = 0 + rot * cur_combo;

	draw_set_font(f_menu_med);
	draw_text_transformed_color(
		global.window_width - mush_w * 4, mush_w, "COMBO x" + string(cur_combo), 
		size, size, rotation,
		c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, 1);	
}

if checkpoints_max > 0 {

	// draw blank sentinel labels
	for (var i = 0; i < checkpoints_max; i++) {
		draw_sprite_ext(s_gui_checkpoint_eye_bg, 0, 
			global.window_width - mush_w, mush_w / 2 + mush_w * 3/4 * i, 
			2, 2, 0, c_white, 1);
	}
	// draw filled in sentinel labels
	for (var i = 0; i < checkpoints; i++) {
		draw_sprite_ext(s_gui_checkpoint_eye, 0, 
			global.window_width - mush_w, mush_w / 2 + mush_w * 3/4 * i, 
			2, 2, 0, c_white, 1);
	}
}

draw_set_alpha(1);