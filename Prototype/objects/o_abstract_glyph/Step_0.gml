/// @description draw particles

// Inherit the parent event
event_inherited();

// kill particle emitter once interaction complete
if dialogue_read && !shutdown {
	
	part_emitter_clear(global.ps, first_emitter);
	audio_play_sound_on(s_emit, a_glyph_shutdown, false, 1);
	audio_sound_gain(s_pulse, 0, room_speed / 10);
	shutdown = true;
	
	// add it to the active list 
	if ds_list_find_index(global.active_list, id) == -1
		ds_list_add(global.active_list, id);
}

if dialogue_read
	image_index = 2;
	
// collection
if !global.glyph_intro[type] && interacting
	global.glyph_intro[type] = true;