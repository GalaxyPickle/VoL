/// @description clear ps sstem

part_emitter_destroy_all(global.ps);
part_particles_clear(global.ps);
part_system_clear(global.ps);

part_emitter_destroy_all(global.ps_between);
part_particles_clear(global.ps_between);
part_system_clear(global.ps_between);