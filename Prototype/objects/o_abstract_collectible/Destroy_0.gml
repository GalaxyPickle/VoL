/// @description pause game amd play awesome upgrade sound!

audio_play_sound(a_hooray, 1, false);

particle_fluffy_burst(x + sprite_width / 2, y + sprite_height / 2, pt_shape_disk, 10, c_white, c_ltgray,
	60, 90, 2, 60);

//part_emitter_burst(global.ps, first_emitter, first_particle, 30);

audio_stop_sound(sound);