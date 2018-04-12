/// @description explode!

particle_fluffy_burst(x, y, pt_shape_explosion, 5, c_dkgray, c_black, 180, 90, 1.5, 60);
audio_play_sound(a_lock_break, 1, false);
instance_destroy();