/// @desc init all global vars and settings for game

////////////////////////////////////////////
// debug mode + settings
////////////////////////////////////////////

// debug info
global.text = false;
global.hitboxes = false;
global.godmode = false;

global.NPC_list = ds_list_create();
global.light_list = ds_list_create();
global.active_list = ds_list_create();

global.cutscene_list = ds_list_create();

global.room_list = ds_map_create();
ds_map_add(global.room_list, r_first_room, "Entrance");

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

// player object
global.player = false;
global.special = 0;
global.game_percent = 0;
score = 0;
health = 0;

global.chatbox_up = false;

// boss progression - abilities used for this
global.boss_killed_reptilian = false;

global.boss_killed_red = false;
global.boss_killed_blue = false;
global.boss_killed_yellow = false;

global.boss_killed_demon_lord = false;

// story progression?
global.chat_titan = false;
global.chat_reptilian = false;
global.chat_demon_lord = false;

// glyph stuff
global.glyphs = 
[
	[false, false, false, false],
	[false, false, false, false],
	[false, false, false, false],
	[false, false, false, false]
];

// gems
global.gems = [false, false, false];

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
global.ability_sunyata = true;

// special stats

// whirlwind
global.combo = 0;
global.combo_default_max = 5;
global.combo_ability_max = 5;

// ascension
global.double_jump = false;

// discharge
global.laser = 0;
global.laser_max = 0;

// cracked???