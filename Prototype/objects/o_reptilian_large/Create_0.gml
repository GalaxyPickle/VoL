/// @description set custom sprites and stuff

// Inherit the parent event
event_inherited();

////////////////////////////////////
// sprite setting
////////////////////////////////////

sprite_hitbox = s_hitbox_reptilian_upright;
sprite_hitbox_head = s_hitbox_reptilian_head;
head_hitbox_offset = 40;

// movement sprites
sprite_rest = s_reptilian_rest;
sprite_run = s_reptilian_run;
sprite_jump = s_reptilian_jump;

// other event sprites
sprite_pain = s_reptilian_pain;
sprite_dodge = s_enemy_default;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_enemy_default;
sprite_attack_ground_2 = s_enemy_default;

sprite_attack_air_1 = s_enemy_default;

// death/fail sprites
sprite_death = s_enemy_default;

///////////////////////////////////////////////
// set custom stats for big reptilian
///////////////////////////////////////////////

jump_stamina_cost = 20;

// VITALITY
vitality_max = 2000;			// max health
vitality = vitality_max;		// current health
vitality_regen = .1;			// health regen rate per frame

// STAMINA
stamina_max = 500;
stamina = stamina_max;
stamina_regen = .4;

// POISE
poise_max = 100;
poise = poise_max;
poise_regen = .01;

// SPECIAL
special_max = 200;
special = 0;
special_regen = .1;