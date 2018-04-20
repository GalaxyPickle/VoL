/// @desc prewrite messages for enities and glyphs

// collection of all read glyphs
/*
global.glyph_collection = ds_map_create();

ds_map_add_list(global.glyph_collection, "glyph_intro_A", false);
ds_map_add_list(global.glyph_collection, "glyph_intro_B", false);
ds_map_add_list(global.glyph_collection, "glyph_intro_C", false);
ds_map_add_list(global.glyph_collection, "glyph_intro_D", false);
*/

global.message_default = 
[
	"Hello World!",
	"Goodbye World!"
];

////////////////////////////////////////
// LORE GLYPH MESSAGES - Intro
////////////////////////////////////////
// read intro story file
var file = file_text_open_read(working_directory + "intro.txt");
var scr = [], i = 0;
while (!file_text_eof(file)) {
	scr[i++] = file_text_readln(file);
}
file_text_close(file);

global.message_intro = scr;

global.message_glyph_lore_intro_A = 
[
	"woah there"
];
global.message_glyph_lore_intro_B = 
[
	"sacked"
];
global.message_glyph_lore_intro_C = 
[
	"sacky"
];
global.message_glyph_lore_intro_D = 
[
	"sack"
];

////////////////////////////////////////
// LORE GLYPH MESSAGES - Sundering
////////////////////////////////////////
global.message_glyph_lore_sundering_A = 
[
	""
];
global.message_glyph_lore_sundering_B = 
[
	""
];
global.message_glyph_lore_sundering_C = 
[
	""
];
global.message_glyph_lore_sundering_D = 
[
	""
];