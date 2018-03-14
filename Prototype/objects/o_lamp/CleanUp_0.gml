/// @description 

audio_emitter_free(s_emit);

part_emitter_destroy(global.ps, first_emitter);
part_type_destroy(first_particle);

with lightsource {
	instance_destroy();
}