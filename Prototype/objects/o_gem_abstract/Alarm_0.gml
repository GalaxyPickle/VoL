/// @description activate lights and sound

lightsource = instance_create_layer(x, y, "layer_instance_lights", o_lightsource);
with lightsource pl_light_init(other.radius, other.color, .7);

s_emit = audio_emitter_create();
// keep emitter pos at glyph
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, 30, 100, 1);

sound = audio_play_sound_on(s_emit, a_ambiance_crystal, true, 1);