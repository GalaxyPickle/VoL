/// @desc prewrite messages for enities and glyphs

global.message_default = 
[
	"Hello World!",
	"Goodbye World!"
];

// read intro story file
var file = file_text_open_read(working_directory + "intro.txt");
var scr = [], i = 0, j = 0, sub = [];

while (!file_text_eof(file)) {
	scr[i++] = file_text_readln(file);
}
file_text_close(file);

global.message_intro = scr;

////////////////////////////////////////
// LORE GLYPH MESSAGES - Intro
////////////////////////////////////////
file = file_text_open_read(working_directory + "glyph.txt");
var scr = [], i = 0, j = 0, sub = [];

// read the whole glyph file and put it into all the glyphs
while (!file_text_eof(file)) {
	var line = file_text_readln(file);
	
	if line == "" {
		scr[j++] = sub;
		i = 0;
	}
	else
		sub[i++] = line;
}

global.message_glyph_A1 = scr[0];
global.message_glyph_A2 = scr[1];
global.message_glyph_A3 = scr[2];
global.message_glyph_A4 = scr[3];

////////////////////////////////////////
// LORE GLYPH MESSAGES - Sundering
////////////////////////////////////////