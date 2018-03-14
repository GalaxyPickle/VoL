/// @description set up options

if object_exists(o_player)
	instance_destroy(o_player);

title = "Veins of Light";
subtitle = DEV_NAME + " v" + VERSION;
start_room = r_first_room;

// array of options
menu[0] = "Start";
menu[1] = "Options";
menu[2] = "Quit";

current_option = menu[0];

// tween stuff
anim = 0;
anim_n = 0;
tween_amount = 7;

// draw position for menu
draw_x_start = 100;
draw_y_start = 300;
spacing = 50;