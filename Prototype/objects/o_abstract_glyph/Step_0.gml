/// @description draw particles

// Inherit the parent event
event_inherited();

// setup particle system on create
#region
if one_shot {
	
	
	one_shot = false;
}
#endregion

// kill particle emitter once interaction complete
if dialogue_read && !shutdown {
	part_emitter_clear(global.ps, first_emitter);
	audio_play_sound_on(s_emit, a_glyph_shutdown, false, 1);
	audio_sound_gain(s_pulse, 0, room_speed / 10)
	shutdown = true;
}

if dialogue_read
	image_index = 2;