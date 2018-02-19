/// @description set colors

// Inherit the parent event
event_inherited();

interactable = true;
one_shot = true;

c_start = c_orange;
c_end = c_orange;

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, 25, 100, 1);

s_pulse = audio_play_sound_on(s_emit, a_glyph_pulse, true, 1);
shutdown = false;