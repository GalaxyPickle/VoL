/// @description replace with death sprite

layer_sprite_create("layer_asset_corpse", x, bbox_bottom, sprite_corpse);
audio_play_sound(sound_death, 1, 0);

// particleS?
/*
effect_create_below(ef_firework, x, y, 2, c_red);