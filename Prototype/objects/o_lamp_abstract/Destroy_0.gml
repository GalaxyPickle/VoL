/// @description

audio_stop_sound(sound);
audio_emitter_free(s_emit);

part_emitter_clear(ps_sys, first_emitter);
part_type_clear(first_particle);

part_emitter_destroy(ps_sys, first_emitter);
part_type_destroy(first_particle);

with lightsource {
	instance_destroy();
}