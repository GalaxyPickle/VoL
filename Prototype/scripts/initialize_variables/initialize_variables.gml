///@description initalize all global variables and macros

///////////////////////////////////////////
// universal vars
/////////////////////////////////////////

// game resolution
#macro WINDOW_WIDTH 1280
#macro WINDOW_HEIGHT 720

#macro ZOOM 2

#macro GAME_WIDTH WINDOW_WIDTH / ZOOM
#macro GAME_HEIGHT WINDOW_HEIGHT / ZOOM

// tile size
#macro TILE_SIZE 32

// physics stuff
#macro GRAVITY .5

// debug mode stuff
global.debug = true;
global.text = true;
global.hitboxes = true;

// initialize camera stuff
init_camera_and_view();

// initialize player values
init_player();

// init enemy default values
init_enemy();