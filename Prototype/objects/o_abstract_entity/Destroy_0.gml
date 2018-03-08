/// @description replace with death sprite

var corpse = layer_sprite_create("layer_asset_corpse", x, bbox_bottom, sprite_corpse);
layer_sprite_xscale(corpse, image_xscale);

// particleS?
/*
effect_create_below(ef_firework, x, y, 2, c_red);