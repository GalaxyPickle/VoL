/// @description draw player health and stamina

var height = 15;			// height of stat bars
var spacing_y = 2;		// how far apart to draw stat bars
var y_start_spacing = 10;
var x_start_spacing = 10;

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

for (var i = 0; i < array_length_1d(player.stat_array); i++) {
	
	var current_array = player.stat_array[i];

	y1 = y_start_spacing + (spacing_y + height) * i
	x2 = x1 + current_array[3];
	y2 = y1 + height;

	amount = (current_array[2] / current_array[3]) * 100;
	
	mincol = current_array[1];
	maxcol = mincol;

	draw_healthbar(x1, y1, x2, y2, amount, backcol, mincol, maxcol, direction_, showback, showborder);
	draw_set_color(c_white);
	draw_set_font(f_debug);
	draw_text(x1 + 1, y1 + 1, string(floor(current_array[2])) + "/" + string(floor(current_array[3])));
}