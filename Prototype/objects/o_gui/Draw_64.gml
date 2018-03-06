/// @description draw player health and stamina

var height = 10;			// height of stat bars
var spacing_y = 30;		// how far apart to draw stat bars
var y_start_spacing = 20;
var x_start_spacing = 130;

// healthbar vars
var x1 = x_start_spacing;
var y1 = y_start_spacing;
var x2 = x_start_spacing;
var y2 = y1 + height;

var amount = 0;			// current amount of the bar
var backcol = c_dkgray;	// back color of the healthbar
var mincol = c_white;	// min color health
var maxcol = c_white;	// max color health

var direction_ = 0;		// anchored in left direction (0)
var showback = true;	// show bg?
var showborder = false;	// show black 1px border?

///////////////////////////////
// loop through 4 stats and draw them
///////////////////////////////

if flash_health
	draw_set_alpha(alpha);
else
	draw_set_alpha(lerp(draw_get_alpha(), 1, flash_time));

/*
for (var i = 0; i < array_length_1d(player.stat_array); i++) {
	
	if i == 1
		continue;
	
	var current_array = player.stat_array[i];

	y1 = y_start_spacing + (spacing_y + height) * i
	x2 = x1 + current_array[3];
	y2 = y1 + height;

	amount = (current_array[2] / current_array[3]) * 100;
	
	mincol = current_array[1];
	maxcol = mincol;

	draw_healthbar(x1, y1, x2, y2, amount, backcol, mincol, maxcol, direction_, showback, showborder);
}
*/

// draw health
var ypos = 10;
var yspac = 40;
draw_set_font(f_menu);
var vitc = c_red;
draw_text_outline_color( 40, ypos, string(floor(player.vitality)),
	2, c_white, 4, vitc, 1);

// draw combo below health
draw_text_outline_color( 40, ypos + yspac, "x" + string(global.combo), 2, c_white, 4, c_lime, 1);

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





