/// @description set vars
// Inherit the parent event
event_inherited();

enemy = true;
enemy_list = [];

weight = 1;
value = 1;

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region



#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

sound_take_damage = a_enemy_hit;	// DEATH sound

#endregion
//////////////////////////////////
// physics values
//////////////////////////////////
#region

jump_speed_y = 0;
max_velocity_x = 0;

#endregion
///////////////////////////////////////////////
// set custom stats for big reptilian
///////////////////////////////////////////////
#region

draw_my_healthbars = false;

close_range = 5;
sight_range = 200;

// VITALITY
vitality_max = 9999;		// max health
vitality = vitality_max;		// current health
vitality_regen = 999;			// health regen rate per frame

// STAMINA
stamina_max = 250;
stamina = stamina_max;
stamina_regen = .6;

// POISE
poise_max = 9999;
poise = poise_max;
poise_regen = 999;

// SPECIAL
special_max = 10;
special = 0;
special_regen = .1;

#endregion
///////////////////////////////////////////////
// AI scripts
///////////////////////////////////////////////
#region

AI = AI_type.friendly_follow;

#endregion