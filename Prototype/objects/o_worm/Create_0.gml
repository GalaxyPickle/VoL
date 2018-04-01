/// @description set vars
// Inherit the parent event
event_inherited();

enemy_list = [];

weight = 1;
value = 1;

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

sprite_hitbox = s_bbox_worm;
head_hitbox_offset = 0;

// movement sprites
sprite_rest = s_worm_rest;
sprite_run = s_worm_crawl;
sprite_air = s_worm_crawl;

// other event sprites
sprite_pain = s_worm_crawl;
sprite_dodge = s_worm_crawl;
sprite_special = s_worm_crawl;

// attack sprites

// death/fail sprites
sprite_death = s_empty;
sprite_corpse = s_empty;

#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

sound_death = a_worm_death;	// DEATH sound

#endregion
//////////////////////////////////
// physics values
//////////////////////////////////
#region

jump_speed_y = 3;
max_velocity_x = .1;

#endregion
///////////////////////////////////////////////
// set custom stats for big reptilian
///////////////////////////////////////////////
#region

draw_my_healthbars = false;

close_range = 5;
sight_range = 5;

// VITALITY
vitality_max = 10;			// max health
vitality = vitality_max;		// current health
vitality_regen = .1;			// health regen rate per frame

// STAMINA
stamina_max = 250;
stamina = stamina_max;
stamina_regen = .6;

// POISE
poise_max = 1;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = 10;
special = 0;
special_regen = .1;

#endregion
///////////////////////////////////////////////
// AI scripts
///////////////////////////////////////////////
#region

AI = AI_type.friendly_meander;

#endregion