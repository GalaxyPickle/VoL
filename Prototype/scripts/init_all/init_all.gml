/// @description initalize all global variables and macros

///////////////////////////////////////////
// universal vars
/////////////////////////////////////////

#macro DEV_NAME "pre-alpha"
#macro VERSION "0.1.3"

// game resolution
global.window_width = 1440; //1280
global.window_height = 850; //720

global.zoom = 2;
global.game_speed = 60;

global.game_width = global.window_width / global.zoom;
global.game_height = global.window_height / global.zoom;

window_center();

// tile size
#macro TILE_SIZE 32

// physics stuff
global.GRAVITY = 0.4;
global.FRICTION = 0.5;
global.ACCELERATION = 0.5;

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
global.special = false;

// player object
global.player = noone;
global.chatbox_up = false;

// settings
global.shader_outline = false;
if gamepad_is_supported()
	global.gamepad = true;
else global.gamepad = false;

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