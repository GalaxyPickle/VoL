/// @description set up options

global.gameover = false;
global.pause = false;

title = "Veins of Light";
subtitle = DEV_NAME + " " + VERSION;

// array of options
menu[0] = "Start";
menu[1] = "Load";
menu[2] = "Settings";
menu[3] = "Quit";

current_option = menu[0];

// tween stuff
anim = 0;
anim_n = 0;
tween_amount = 7;

// draw position for menu
draw_x_start = 100;
draw_y_start = 300;
spacing = 50;