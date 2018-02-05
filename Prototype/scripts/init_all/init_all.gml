/// @description initalize all global variables and macros

///////////////////////////////////////////
// universal vars
/////////////////////////////////////////

#macro DEV_NAME "pre-alpha"
#macro VERSION "1.1"

// game resolution
#macro WINDOW_WIDTH 1280 //display_get_width()
#macro WINDOW_HEIGHT 720 //display_get_height()

#macro ZOOM 2
#macro ROOM_SPEED 60

#macro GAME_WIDTH WINDOW_WIDTH / ZOOM
#macro GAME_HEIGHT WINDOW_HEIGHT / ZOOM

window_center();

// tile size
#macro TILE_SIZE 32

// physics stuff
#macro GRAVITY .5
#macro ACCELERATION .5
#macro FRICTION .5

// debug mode stuff
global.debug = false;
global.text = false;
global.hitboxes = false;
global.godmode = false;

// player game stuff
randomize();

global.pause = false;
global.gameover = false;
global.mute = false;
score = 0;

// initialize camera stuff
init_camera_and_view();

// set sprite speed based on room speed
init_sprites();

// initialize audio stuff
init_audio();

// initialize player input values
init_player_input();