/// @description initalize all global variables and macros

///////////////////////////////////////////
// universal vars
/////////////////////////////////////////

#macro DEV_NAME "pre-alpha"
#macro VERSION "1.2"

// game resolution
global.window_width = 1280;
global.window_height = 720;

global.zoom = 2;
global.game_speed = 60;

global.game_width = global.window_width / global.zoom;
global.game_height = global.window_height / global.zoom;

window_center();

// tile size
#macro TILE_SIZE 32

// physics stuff
global.GRAVITY = 0.5;
global.FRICTION = 0.5;
global.ACCELERATION = .5;

// debug mode stuff
global.debug = false;
global.text = false;
global.hitboxes = false;
global.godmode = false;

// make all random calls different each game run
randomize();

global.pause = false;
global.gameover = false;
global.mute = false;
score = 0;

// initialize surfaces for drawing
init_surfaces();

// set sprite speed based on room speed
init_sprites();

// initialize audio stuff
init_audio();

// initialize player input values
init_player_input();

// init premade particle systems
init_particle_system();

// init the light system??