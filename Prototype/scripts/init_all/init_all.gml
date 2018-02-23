/// @description initalize all global variables and macros

///////////////////////////////////////////
// universal vars
/////////////////////////////////////////

#macro DEV_NAME "pre-alpha"
#macro VERSION "0.1.4"

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

// tile size
#macro TILE_SIZE 32

// physics stuff
global.GRAVITY = 0.4;
global.FRICTION = 0.5;
global.ACCELERATION = 0.5;

// debug mode stuff
global.debug = true;
global.text = false;
global.hitboxes = false;
global.godmode = false;

// make all random calls different each game run
randomize();

global.pause = false;
global.gameover = false;
global.mute = false;

score = 0;

// all the unlockable abilities
// discharge is firing a lazer beam from your sword when your special bar is maxxed
global.ability_discharge = false;
// ascension is being able to double jump
global.ability_ascension = false;
// whirlwind is a combo system that increases your attack speed based on successful hits
global.ability_whirlwind = false;
// cracked is TBD
global.ability_cracked = false;

// special stats
global.combo = 0;
global.combo_default_max = 5;
global.combo_ability_max = 50;

global.double_jump = false;
global.special = 0;

// player object
global.player = noone;
global.chatbox_up = false;

// settings
global.high_graphics = true;
global.NPC_list = ds_list_create();

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