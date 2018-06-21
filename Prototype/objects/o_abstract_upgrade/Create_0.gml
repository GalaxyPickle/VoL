/// @description init vars

c_start = c_white;
c_end = c_white;
text = "testing";
type = 0; // hp

light_color = c_white;

// CHECK IF ACTIVATED YOOOOOO
if check_if_activated() {
	alarm[1] = 2;
}
alarm[0] = 1;

///////////////////////////////////////////////////////////
////////////////// sounds ///////////////

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, 10, 100, 1);

sound = audio_play_sound_on(s_emit, a_tinkle, true, 1);