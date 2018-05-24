/// @description set up options

timer = 0;

if object_exists(o_player)
	instance_destroy(o_player);

title = "Veins of Light";
subtitle = DEV_NAME + " v" + VERSION + "\n*gamepad recommended*";

start_room = r_init_room;
if !global.died
	start_room = r_intro;

// array of options
menu[0] = "START";
if global.died
	menu[0] = "CONTINUE";
menu[1] = "QUIT";

current_option = menu[0];

// tween stuff
anim = 0;
anim_n = 0;
tween_amount = 7;
alpha = 1;

// draw position for menu
draw_x_start = global.window_width / 2;
draw_y_start = 400;
spacing = 75;