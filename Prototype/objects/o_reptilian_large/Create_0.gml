/// @description set custom sprites and stuff

// Inherit the parent event
event_inherited();

can_dodge = false;
can_jump = true;
can_special = true;
can_combo = true;
can_attack_ground = true;
can_attack_air = false;

enemy_list = [o_player, o_mushroom_parent];

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

sprite_hitbox = s_hitbox_reptilian_upright;
sprite_hitbox_head = s_hitbox_reptilian_head;
head_hitbox_offset = 35;

// movement sprites
sprite_rest = s_reptilian_rest;
sprite_run = s_reptilian_run;
sprite_air = s_reptilian_jump;

// other event sprites
sprite_pain = s_reptilian_pain;
sprite_dodge = s_reptilian_pain;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_reptilian_attack_ground_1;
sprite_attack_ground_2 = s_reptilian_attack_ground_2;

sprite_attack_air_1 = s_enemy_default;

// death/fail sprites
sprite_death = s_enemy_default;
sprite_corpse = s_reptilian_corpse;

#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

// movement
sound_idle = a_empty;							// not moving
sound_run = a_reptilian_footstep;				// moving L/R
sound_jump = a_empty;					// one-shot when leaving ground
sound_land = a_reptilian_land;					// one-shot when hitting ground

footstep_time = room_speed / 3;

// recovery and stuff
sound_pain = [a_reptilian_pain_1, a_reptilian_pain_2, a_reptilian_pain_3];		// a REALLY hurt sound when collapsing back
sound_recovery = a_empty;						// healing sound?
sound_dodge = a_empty;							// dodge sound
sound_death = a_reptilian_death;					// DEATH sound

// attack sounds
sound_attack_ground_1 = a_claw_slice_1;			// woosh of weapon sound

sound_attack_ground_2 = a_claw_slice_2;

sound_attack_air_1 = a_claw_slice_2;

#endregion
////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////
#region

// frames = 12; criticals = 8-9
var g1_frame8_basic = [ -16, 0, 40, 28, 96, -20 ];
var g1_frame8_sweet = [ 
	[ -8, 40, 48, 42, 96, 16 ],
	[ 48, 42, 96, 16, 112, -24 ],
	[ 96, 16, 112, -24, 96, -24 ]
	];
var g1_frame9_basic = [ 32, 8, 102, -20, 72, -50 ];
var g1_frame9_sweet = [
	[ 112, 0, 112, -32, 80, -64 ],
	[ 112, -32, 80, -64, 72, -50 ],
	];

attack_ground_1_point_array = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[ g1_frame8_basic, g1_frame8_sweet ],
	[ g1_frame9_basic, g1_frame9_sweet ],
	[],
	[],
	[]
	];
	
// frames = 7; critical = 3-4
var g2_frame3_basic = [ 20, -8, 44, -32, 80, -8 ];
var g2_frame3_sweet = [
	[ 20, -8, 77, 6, 94, -4 ],
	[ 77, 6, 94, -4, 92, -20 ],
	[ 94, -4, 92, -20, 44, -32 ]
	];
var g2_frame4_basic = [ 44, 6, 44, -24, 88, -6 ];
var g2_frame4_sweet = [
	[ 44, 6, 92, 6, 98, -4 ],
	[ 92, 6, 98, -4, 90, -16 ],
	[ 98, -4, 90, -16, 44, -24 ]
	];

attack_ground_2_point_array = [
	[],
	[],
	[ g2_frame3_basic, g2_frame3_sweet ],
	[ g2_frame4_basic, g2_frame4_sweet ],
	[],
	[],
	[]
	];

#endregion
//////////////////////////////////
// physics values
//////////////////////////////////
#region

jump_speed_y = 6;
max_velocity_x = 9;
dodge_launch = TILE_SIZE - 16;

#endregion
//////////////////////////////////
// attack properties
//////////////////////////////////
#region

// these are the velocities and damages of the respective attack
attack_ground_1_stats = [
	[10, -5],	// velocity of attack to opponent if poise broken (default facing right)
	[10, 20],	// default health damage of the attack (basic, sweet)
	0,			// default stamina cost of the attack
	20,			// default poise damage of the attack
	10,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[20, -3],
	[20, 30],
	0,
	20,
	15,
	];
	
attack_air_1_stats = [
	[10, -10],
	[20, 30],
	0,
	15,
	25,
	];

#endregion
///////////////////////////////////////////////
// set custom stats for big reptilian
///////////////////////////////////////////////
#region

draw_my_healthbars = true;

close_range = 110;
sight_range = 1000;
jump_stamina_cost = 0;

// VITALITY
vitality_max = 4000;			// max health
vitality = vitality_max;		// current health
vitality_regen = .1;			// health regen rate per frame

// STAMINA
stamina_max = 250;
stamina = stamina_max;
stamina_regen = .6;

// POISE
poise_max = 100;
poise = poise_max;
poise_regen = .1;

// SPECIAL
special_max = 500;
special = 0;
special_regen = .5;

#endregion
///////////////////////////////////////////////
// AI scripts
///////////////////////////////////////////////
#region

AI = AI_type.enemy_boss;

#endregion