/// @desc reset progression and health and stuff

global.death_vitality = global.player_start_vitality;
global.death_vitality_current = global.death_vitality;
	
global.death_sunyata = global.player_start_special;
global.death_sunyata_current = global.death_sunyata;
	
global.active_list = ds_list_create();
global.death_room = r_first_room;

global.died = false;
	
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