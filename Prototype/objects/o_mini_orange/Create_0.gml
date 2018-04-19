/// @description set vars
// Inherit the parent event
event_inherited();

enemy_list = [o_player];

weight = 1;
value = 1;

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

sprite_hitbox = s_bbox_worm;
head_hitbox_offset = 0;

// movement sprites
sprite_rest = s_orange_mini_rest;
sprite_run = s_orange_mini_run;
sprite_air = s_orange_mini_air;

// other event sprites
sprite_pain = s_orange_mini_air;
sprite_dodge = s_orange_mini_air;
sprite_special = s_orange_mini_air;

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
sound_land = a_worm_land;

#endregion
//////////////////////////////////
// physics values
//////////////////////////////////
#region

jump_speed_y = 0;
max_velocity_x = 1;

#endregion
///////////////////////////////////////////////
// set custom stats for big reptilian
///////////////////////////////////////////////
#region

draw_my_healthbars = false;

close_range = 50;
sight_range = 300;

// VITALITY
vitality_max = 50;			// max health
vitality = vitality_max;		// current health
vitality_regen = .1;			// health regen rate per frame

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

AI = AI_type.friendly_hide;

#endregion