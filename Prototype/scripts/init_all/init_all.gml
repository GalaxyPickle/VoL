/// @description initalize all global variables and macros

///////////////////////////////////////////
// universal vars
/////////////////////////////////////////

#macro DEV_NAME "pre-alpha"
#macro VERSION "0.1.7"

// game resolution
global.window_width = 1280; //laptop size 1440;
global.window_height = 720; //laptop size 850;

global.zoom = 2;
global.game_speed = 60;		// fps

global.game_width = global.window_width / global.zoom;
global.game_height = global.window_height / global.zoom;

global.view_x = 0;
global.view_y = 0;

window_center();

global.debug = false;

// tile size
#macro TILE_SIZE 32

// physics stuff
global.GRAVITY = 0.35;
global.FRICTION = 0.5;
global.ACCELERATION = 0.5;

// init all global vars and settings
init_globals();

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

// init the messages for glyphs and character dialogue
init_messages();