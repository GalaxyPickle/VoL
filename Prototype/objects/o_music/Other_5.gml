/// @description kill particle fog

if foggy {
	part_emitter_destroy(global.ps, first_emitter);
	part_type_destroy(first_particle);
}
