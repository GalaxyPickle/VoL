/// @desc clean it all up boiiiiiiii

// kill all particles emitters and the particle system
part_emitter_destroy_all(global.ps);
part_system_destroy(global.ps);

// kill the NPC list
ds_list_destroy(global.NPC_list);

// kill the glyph collection ds map
/*
ds_map_destroy(global.glyph_collection);