/// @description

audio_stop_sound(sound);
audio_emitter_free(s_emit);

part_emitter_clear(ps_sys, emitter1);
part_type_clear(first_particle);
part_emitter_clear(ps_sys, emitter2);
part_type_clear(first_particle);

part_emitter_destroy(ps_sys, emitter1);
part_type_destroy(first_particle);
part_emitter_destroy(ps_sys, emitter2);
part_type_destroy(first_particle);

with lightsource1 {
	instance_destroy();
}
with lightsource2 {
	instance_destroy();
}