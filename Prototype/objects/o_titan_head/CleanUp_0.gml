/// @description f

part_type_clear(first_particle);
part_emitter_clear(ps_sys, emitter1);
part_emitter_clear(ps_sys, emitter2);

part_type_destroy(first_particle);
part_emitter_destroy(ps_sys, emitter1);
part_emitter_destroy(ps_sys, emitter2);