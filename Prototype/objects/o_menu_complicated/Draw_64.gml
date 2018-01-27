/// @description draw menu when game is paused
/*

if !global.pause
	exit;

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 32, x_buffer = 16;
var start_y = gheight / 2 - (ds_height - 1) / 2 * y_buffer, start_x = GAME_WIDTH / 2;
	
// draw pause menu "back"
var c = c_black;
draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, c, c, c, c, false);


// draw elements on left side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty;

for (var yy = 0; yy < ds_height; yy++) {
	lty = start_y + yy * y_buffer;
	draw_text(ltx, lty, ds_grid[# 0, yy]);
}

// draw dividing line
draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);


// draw elements on right side