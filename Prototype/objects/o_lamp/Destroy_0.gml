/// @description

audio_stop_sound(sound);
audio_emitter_free(s_emit);

part_emitter_clear(global.ps_behind, first_emitter);
part_type_clear(first_particle);

part_emitter_destroy(global.ps_behind, first_emitter);
part_type_destroy(first_particle);

with lightsource {
	instance_destroy();
}