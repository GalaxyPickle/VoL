/// @desc init all global vars and settings for game

////////////////////////////////////////////
// debug mode + settings
////////////////////////////////////////////

// delta time thingy
instance_create(x, y, obj_SteadyDeltaTime);

// debug info
global.text = false;
global.hitboxes = false;
global.godmode = false;

global.NPC_list = ds_list_create();
global.light_list = ds_list_create();

// make all random calls different each game run
randomize();

// settings
global.high_graphics = true;
global.pause = false;
global.gameover = false;
global.mute = false;

if gamepad_is_supported()
	global.gamepad = true;
else global.gamepad = false;

global.view_x = 0;
global.view_y = 0;

////////////////////////////////////////////////////////
// misc progression and collectibles
////////////////////////////////////////////////////////

score = 0;
health = 0;
// player object
global.player = false;
global.px = 0;
global.py = 0;
global.special = 0;

global.chatbox_up = false;

// collectible mushrooms
global.mushrooms = [0, 0, 0, 0];

// boss progression - abilities used for this
global.gates = [];

// story progression?
global.glyph_intro = [false, false, false, false];
global.glyph_sundering = [false, false, false, false];

/////////////////////////////////////////////////
// GLOBAL STATS for abilities
/////////////////////////////////////////////////

global.sunyata = false;


//////////// OLD ///////////

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

// whirlwind
global.combo = 0;
global.combo_default_max = 5;
global.combo_ability_max = 50;

// ascension
global.double_jump = false;

// discharge
global.laser = 0;
global.laser_max = 0;

// cracked???