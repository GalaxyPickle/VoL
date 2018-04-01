/// @desc clean it all up boiiiiiiii

///////////////////////////////////////////////
// PARTICLES
///////////////////////////////////////////////

// kill all particles emitters and the particle system
if part_system_exists(global.ps) {
	part_emitter_destroy_all(global.ps);
	part_system_destroy(global.ps);
}
if part_system_exists(global.ps_behind) {
	part_emitter_destroy_all(global.ps_behind);
	part_system_destroy(global.ps_behind);
}
if part_system_exists(global.ps_ghost) {
	part_emitter_destroy_all(global.ps_ghost);
	part_system_destroy(global.ps_ghost);
}

/////////////////////////////////////////////
// DS TYPES
/////////////////////////////////////////////

// kill the NPC list
if ds_exists(global.NPC_list, ds_type_list)
	ds_list_destroy(global.NPC_list);
// kill light list
if ds_exists(global.light_list, ds_type_list)
	ds_list_destroy(global.light_list);

///////////////////////////////////////////
// SURFACES
///////////////////////////////////////////

// kill player surface
if surface_exists(global.player_surface)
	surface_free(global.player_surface);
// kill ghost surface
if surface_exists(global.ghost_surface)
	surface_free(global.ghost_surface);