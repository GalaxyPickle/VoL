/// @description set up options

global.pause = false;

// seconds for dislaying fail screen
gameover_display_time = room_speed * 30;
gameover_start = false;
flash_text = false;

// array of options
menu[0] = "Resume";
menu[1] = "Quit";

current_option = menu[0];

// tween stuff
anim = 0;
anim_n = 0;
tween_amount = 7;

// draw position for menu
draw_x_start = 100;
draw_y_start = 300;
spacing = 50;