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

////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////

// frames = 7; criticals = 3-4
var g1_frame3_basic = [ -16, 0, 40, 28, 96, -20 ];
var g1_frame3_sweet = [ 
	[ -8, 40, 48, 42, 96, 16 ],
	[ 48, 42, 96, 16, 112, -24 ],
	[ 96, 16, 112, -24, 96, -24 ]
	];
var g1_frame4_basic = [ 32, 8, 102, -20, 72, -50 ];
var g1_frame4_sweet = [
	[ 112, 0, 112, -32, 80, -64 ],
	[ 112, -32, 80, -64, 72, -50 ],
	];

attack_ground_1_point_array = [
	[],
	[],
	[ g1_frame3_basic, g1_frame3_sweet ],
	[ g1_frame4_basic, g1_frame4_sweet ],
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

//////////////////////////////////
// attack properties
//////////////////////////////////

// these are the velocities and damages of the respective attack
attack_ground_1_stats = [
	[10, -5],	// velocity of attack to opponent if poise broken (default facing right)
	[50, 80],	// default health damage of the attack (basic, sweet)
	25,			// default stamina cost of the attack
	10,			// default poise damage of the attack
	2,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[10, -10],
	[70, 100],
	25,
	20,
	3,
	];
	
attack_air_1_stats = [
	[10, -10],
	[30, 60],
	10,
	15,
	5,
	];

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
poise_max = 65;
poise = poise_max;
poise_regen = .01;

// SPECIAL
special_max = 200;
special = 0;
special_regen = .1;