/// @description draw healthbar, stamina bar, poise bar, special bar

// healthbar vars
var x1 = 0;
var y1 = 0;
var x2 = 0;
var y2 = 0;

var amount = 0			// current amount of the bar
var backcol = c_black;	// back color of the healthbar
var mincol = c_white;	// min color health
var maxcol = c_white;	// max color health

var direction_ = 0;		// anchored in left direction (0)
var showback = true;	// show bg?
var showborder = false;	// show black 1px border?

var height = 1;			// height of stat bars
var width = 100;		// the length of the health bar
var spacing = 5;		// how far apart to draw stat bars

///////////////////////////////
// loop through 4 stats and draw them
///////////////////////////////

for (var i = 0; i < array_length_1d(stat_array); i++) {
	
	var current_array = stat_array[i];

	x1 = x - width / 2;
	y1 = hitbox_head_top - array_length_1d(stat_array) * spacing + spacing * i;
	x2 = x + width / 2;
	y2 = y1 + height;

	amount = (current_array[2] / current_array[3]) * 100;
	
	mincol = current_array[1];
	maxcol = mincol;

	draw_healthbar(x1, y1, x2, y2, amount, backcol, mincol, maxcol, direction_, showback, showborder);

}