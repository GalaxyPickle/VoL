/// @description setup for pausing, y0

pause_sprite = s_pause_bg;

var spr_A = [s_glyph_A1, s_glyph_A2, s_glyph_A3, s_glyph_A4];
var spr_B = [s_glyph_B1, s_glyph_B2, s_glyph_B3, s_glyph_B4];
var spr_C = [s_glyph_C1, s_glyph_C2, s_glyph_C3, s_glyph_C4];
var spr_D = [s_glyph_D1, s_glyph_D2, s_glyph_D3, s_glyph_D4];
	
glyphs = [spr_A, spr_C, spr_B, spr_D];

player = noone;

/////// options /////////////

// array of options
menu[0] = "RESUME";
menu[1] = "SAVE & QUIT";

current_option = menu[0];

// tween stuff
anim = 0;
anim_n = 0;
tween_amount = 7;
alpha = 1;