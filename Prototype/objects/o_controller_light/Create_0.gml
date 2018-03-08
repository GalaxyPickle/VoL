/// @description init light system

pl_init();
pl_option_set_ambience(c_black, .5);
pl_set_blurring(false);
pl_set_vivid(false);

pl_add(o_lightsource);

alarm[0] = 1;

sun = false;