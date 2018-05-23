/// @desc clean it all up boiiiiiiii

///////////////////////////////////////////////
// PARTICLES
///////////////////////////////////////////////

// kill all particles emitters and the particle system
if part_system_exists(global.ps) {
	part_emitter_destroy_all(global.ps);
	part_system_destroy(global.ps);
}
if part_system_exists(global.ps_between) {
	part_emitter_destroy_all(global.ps_between);
	part_system_destroy(global.ps_between);
}
if part_system_exists(global.ps_top) {
	part_emitter_destroy_all(global.ps_top);
	part_system_destroy(global.ps_top);
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
// kill active list
if ds_exists(global.active_list, ds_type_list)
	ds_list_destroy(global.active_list);
	
// room list
if ds_exists(global.room_list_name, ds_type_map)
	ds_map_destroy(global.room_list_name);
	
if ds_exists(global.room_list_pos, ds_type_map)
	ds_map_destroy(global.room_list_pos);

///////////////////////////////////////////
// SURFACES
///////////////////////////////////////////

// kill player surface
if surface_exists(global.player_surface)
	surface_free(global.player_surface);
// kill ghost surface
if surface_exists(global.ghost_surface)
	surface_free(global.ghost_surface);
	
