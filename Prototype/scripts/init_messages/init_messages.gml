/// @desc prewrite messages for enities and glyphs

global.message_default = 
[
	"Hello World!",
	"Goodbye World!"
];

// read intro story file
var file = file_text_open_read(working_directory + "intro.txt");
var scr = [], i = 0;

while (!file_text_eof(file)) {
	scr[i++] = file_text_readln(file);
}
file_text_close(file);

global.message_intro = scr;

////////////////////////////////////////
// LORE GLYPH MESSAGES
////////////////////////////////////////
var gfile = file_text_open_read(working_directory + "glyph.txt");
var scr = [], i = 0;

while (!file_text_eof(gfile)) {
	scr[i++] = file_text_readln(gfile);
}
file_text_close(gfile);

global.message_glyph = 0;

var j = 0, k = 0, sub = [];

// upload all glyphs into one mega array
for (var i = 0; i < array_length_1d(scr); i++) {
	if scr[i] == "\n" {
		global.message_glyph[k++] = sub;
		j = 0;
		sub = 0;
	}
	else
		sub[j++] = scr[i];
}
// last section
global.message_glyph[k] = sub;