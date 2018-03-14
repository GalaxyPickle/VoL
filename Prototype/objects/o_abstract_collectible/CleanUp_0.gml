/// @description

part_emitter_destroy(global.ps, first_emitter);
part_type_destroy(first_particle);

audio_emitter_free(s_emit);

with lightsource {
	instance_destroy();
}