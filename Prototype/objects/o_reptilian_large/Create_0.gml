/// @description set custom sprites and stuff
// You can write your code in this editor

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
sprite_jump = s_enemy_default;

// other event sprites
sprite_pain = s_enemy_default;
sprite_dodge = s_enemy_default;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_enemy_default;
sprite_attack_ground_2 = s_enemy_default;

sprite_attack_air_1 = s_enemy_default;

// death/fail sprites
sprite_death = s_enemy_default;