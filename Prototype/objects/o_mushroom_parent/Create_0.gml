/// @description set custom sprites and stuff

// Inherit the parent event
event_inherited();

draw_my_healthbars = false;
AI = AI_type.friendly_meander;

interactable = false;
message = global.message_default;

enemy = false;

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

sprite_hitbox = s_mushroom_bbox;
sprite_hitbox_head = s_mushroom_bbox;
head_hitbox_offset = 0;

// movement sprites
sprite_rest = s_mushroom_parent_rest;
sprite_run = s_mushroom_parent_run;
sprite_air = s_mushroom_parent_rest;

// other event sprites
sprite_pain = s_mushroom_parent_rest;
sprite_dodge = s_mushroom_parent_rest;
sprite_special = s_mushroom_parent_rest;

// attack sprites
sprite_attack_ground_1 = s_mushroom_parent_rest;
sprite_attack_ground_2 = s_mushroom_parent_rest;

sprite_attack_air_1 = s_mushroom_parent_rest;

// death/fail sprites
sprite_death = s_mushroom_parent_rest;

#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

// movement
sound_idle = a_test;							// not moving
sound_run = a_reptilian_footstep;				// moving L/R
sound_jump = a_reptilian_footstep;					// one-shot when leaving ground
sound_land = a_reptilian_footstep;					// one-shot when hitting ground

footstep_time = room_speed / 4;

// recovery and stuff
sound_take_damage = a_reptilian_footstep;				// an "OOF!" or hurt sound when hit
sound_poise_break = a_reptilian_footstep;			// a REALLY hurt sound when collapsing back
sound_recovery = a_test;						// healing sound?
sound_dodge = a_test;							// dodge sound
sound_death = a_test;							// DEATH sound

// attack sounds
sound_attack_ground_1 = a_reptilian_footstep;			// woosh of weapon sound
sound_attack_charge_ground_1 = a_test;			// the charged up woosh of weapon sound

sound_attack_ground_2 = a_reptilian_footstep;
sound_attack_charge_ground_2 = a_test;

sound_attack_air_1 = a_reptilian_footstep;
sound_attack_charge_air_1 = a_test;

#endregion
////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////
#region


#endregion
//////////////////////////////////
// physics values
//////////////////////////////////
#region

jump_speed_y = 6;
max_velocity_x = 3;

#endregion
//////////////////////////////////
// attack properties
//////////////////////////////////
#region



#endregion
///////////////////////////////////////////////
// set custom stats for big MUSHROOM person
///////////////////////////////////////////////
#region

close_range = 20; // pixels away for "enemy in range" to trigger
sight_range = 200;
jump_stamina_cost = 5;

// VITALITY
vitality_max = 300;			// max health
vitality = vitality_max;		// current health
vitality_regen = .1;			// health regen rate per frame

// STAMINA
stamina_max = 50;
stamina = stamina_max;
stamina_regen = .6;

// POISE
poise_max = 10;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = 10;
special = 0;
special_regen = .1;

#endregion