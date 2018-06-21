/// @desc prewrite messages for enities and glyphs

global.message_default = 
[
	"Hello World!",
	"Goodbye World!"
];

/////////////////////////////////
// read intro story file
/////////////////////////////////
var file = file_text_open_read(working_directory + "intro_short.txt");
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

////////////////////////////////////////
// TIP MUSHY DIALOGUE
////////////////////////////////////////
var tfile = file_text_open_read(working_directory + "mush.txt");
var scr = [], i = 0;

while (!file_text_eof(tfile)) {
	scr[i++] = file_text_readln(tfile);
}
file_text_close(tfile);

global.message_mush = 0;

var j = 0, k = 0, sub = [];

// upload all mush messages into one mega array
for (var i = 0; i < array_length_1d(scr); i++) {
	if scr[i] == "\n" {
		global.message_mush[k++] = sub;
		j = 0;
		sub = 0;
	}
	else
		sub[j++] = scr[i];
}
// last section
global.message_mush[k] = sub;

////////////////////////////////////////
// TITAN DIALOGUE
////////////////////////////////////////
var nfile = file_text_open_read(working_directory + "titan.txt");
var scr = [], i = 0;

while (!file_text_eof(nfile)) {
	scr[i++] = file_text_readln(nfile);
}
file_text_close(nfile);

global.message_titan = 0;

var j = 0, k = 0, sub = [];

// upload all mush messages into one mega array
for (var i = 0; i < array_length_1d(scr); i++) {
	if scr[i] == "\n" {
		global.message_titan[k++] = sub;
		j = 0;
		sub = 0;
	}
	else
		sub[j++] = scr[i];
}
// last section
global.message_titan[k] = sub;