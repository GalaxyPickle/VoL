/// @description destroy psuedo 

audio_play_sound(a_hooray, 1, false);

part_emitter_burst(global.ps, first_emitter, first_particle, 30);

instance_destroy();