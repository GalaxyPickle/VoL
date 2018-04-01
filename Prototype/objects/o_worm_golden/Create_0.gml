/// @description replace sprites

// Inherit the parent event
event_inherited();

// movement sprites
sprite_rest = s_worm_rest_gold;
sprite_run = s_worm_crawl_gold;
sprite_air = s_worm_crawl_gold;

// other event sprites
sprite_pain = s_worm_crawl_gold;
sprite_dodge = s_worm_crawl_gold;
sprite_special = s_worm_crawl_gold;

vitality_max = 500;
vitality = vitality_max;

poise_max = 9999;
poise = poise_max;