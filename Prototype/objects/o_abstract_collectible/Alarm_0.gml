/// @description destroy psuedo 

var crunch_sound = [a_crunchy_eat_1, a_crunchy_eat_2, a_crunchy_eat_3];
audio_play_sound( crunch_sound[irandom(array_length_1d(crunch_sound))], 1, false );
audio_play_sound(a_guitar_nice, 1, false);

part_emitter_burst(global.ps, first_emitter, first_particle, 30);

instance_destroy();