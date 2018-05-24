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

global.room_list_name = ds_map_create();
//ds_map_add(global.room_list_name, r_second_room, "Entrance");

global.room_list_pos = ds_map_create();
ds_map_add(global.room_list_pos, r_first_room, [250, 250]);
ds_map_add(global.room_list_pos, r_second_room, [368, 477]);

// make all random calls different each game run
randomize();

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

global.player_start_vitality = 200;
global.player_start_special = 0;

global.died = false;
global.death_vitality = 0;
global.death_sunyata = 0;
global.death_room = r_first_room;

global.chatbox_up = false;

// boss progression - abilities used for this
global.boss_killed_reptilian = false;

// story progression?
global.chat_titan = false;

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
global.combo_ability_max = 20;

// ascension
global.double_jump = false;

// discharge
global.laser = 0;
global.laser_max = 0;

// cracked???

/*
/////////////////////////////////////////////
/// EXTERNAL LOAD //////////////////
var fname = working_directory + "saves.txt";

if file_exists(fname) {
	var file = file_text_open_read(fname);
	var scr = [], i = 0;

	while (!file_text_eof(file)) {
		scr[i++] = file_text_read_real(file);
	}
}
else {
	var file = file_text_open_write(fname);
	
	// have not died yet
	file_text_write_real(file, 0);
	// write health
	file_text_write_real(file, global.player_start_vitality);
	// write sunyata
	file_text_write_real(file, global.player_start_special);
	// write starting room
	file_text_write_real(file, 5);
}
file_text_close(file);