/// @description setup vars and controls and stuff

event_inherited();

enemy = false;

move = true;

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

sprite_hitbox = s_hitbox_player_upright;
sprite_hitbox_head = s_hitbox_player_head;
head_hitbox_offset = 28;

// movement sprites
sprite_rest = s_player_rest;
sprite_run = s_player_run;

sprite_jump = s_player_jump;
sprite_walljump = s_player_walljump;

// other event sprites
sprite_pain = s_player_pain;
sprite_dodge = s_player_dodge;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_player_attack_ground_1;

sprite_attack_ground_2 = s_player_attack_ground_2;

sprite_attack_air_1 = s_enemy_default;

// death/fail sprites
sprite_death = s_enemy_default;

#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

// movement
sound_idle = a_player_footstep;						// not moving
sound_run = a_player_footstep;				// moving L/R
sound_jump = a_player_jump;					// one-shot when leaving ground
sound_land = a_player_land;					// one-shot when hitting ground

// recovery and stuff
sound_take_damage = a_player_hit;				// an "OOF!" or hurt sound when hit
sound_poise_break = a_player_pain;				// a REALLY hurt sound when collapsing back
sound_recovery = a_player_footstep;				// healing sound?
sound_dodge = a_player_footstep;					// dodge sound
sound_death = a_player_footstep;					// DEATH sound

// attack sounds
sound_attack_ground_1 = a_sword_slice_1;			// woosh of weapon sound
sound_attack_charge_ground_1 = a_player_footstep;	// the charged up woosh of weapon sound

sound_attack_ground_2 = a_sword_slice_2;
sound_attack_charge_ground_2 = a_player_footstep;

sound_attack_air_1 = a_player_footstep;
sound_attack_charge_air_1 = a_player_footstep;

#endregion
////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////
#region

// frames = 6; criticals = 2-3
var g1_frame2_basic = [ -37, -5, 21, 21, 53, -32 ];
var g1_frame2_sweet = [ 
	[ -37, 5, -8, 28, 24, 34 ],
	[ -8, 28, 24, 34, 56, 12 ],
	[ 24, 34, 56, 12, 64, -32 ],
	[ 56, 12, 64, -32, 48, -32 ]
	];
var g1_frame3_basic = [ 8, -56, 16, -16, 55, -21 ];
var g1_frame3_sweet = [
	[ 48, -16, 70, -16, 50, -60 ],
	[ 70, -16, 50, -60, 8, -69 ],
	];
	

attack_ground_1_point_array = [
	[],
	[ g1_frame2_basic, g1_frame2_sweet ],
	[ g1_frame3_basic, g1_frame3_sweet ],
	[],
	[],
	[]
	];
	
// frames = 7; critical = 3
var g2_frame3_basic = [ -16, 28, 53, -16, 8, -60 ];
var g2_frame3_sweet = [
	[ -8, 32, 32, 24, 64, 0 ],
	[ 32, 24, 64, 0, 64, -32 ],
	[ 64, 0, 64, -32, 38, -55 ],
	[ 64, -32, 38, -55, 8, -64 ]
	];

attack_ground_2_point_array = [
	[],
	[],
	[ g2_frame3_basic, g2_frame3_sweet],
	[],
	[],
	[],
	[]
	];

#endregion
//////////////////////////////////
// attack properties
//////////////////////////////////
#region

// these are the velocities and damages of the respective attack
attack_ground_1_stats = [
	[10, -5],	// velocity of attack to opponent if poise broken (default facing right)
	[50, 80],	// default health damage of the attack (basic, sweet)
	15,			// default stamina cost of the attack
	10,			// default poise damage of the attack
	2,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[10, -10],
	[70, 100],
	15,
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

#endregion
////////////////////////////////////
// input constants
////////////////////////////////////
#region

key_right = KEY_RIGHT;
key_left = KEY_LEFT;
key_up = KEY_UP;
key_down = KEY_DOWN;
key_jump = KEY_JUMP;

key_attack = KEY_ATTACK;
key_dodge = KEY_DODGE;
key_special = KEY_SPECIAL;

////////////////////////////////////
// physics & collisions constants
////////////////////////////////////

jump_speed_y = 14;
max_velocity_x = 8;

#endregion
////////////////////////////////////
// game stats
////////////////////////////////////
#region

dodge_launch = TILE_SIZE - 8;
dodge_stamina_cost = 15;

// VITALITY
vitality_max = 500;			// max health
vitality = vitality_max;	// current health
vitality_regen = .1;		// health regen rate per frame

// STAMINA
stamina_max = 100;
stamina = stamina_max;
stamina_regen = .5;

// POISE
poise_max = 40;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = 30;
special = 0;
special_regen = 0;

#endregion
////////////////////////////////////
// scripts
////////////////////////////////////
#region

script_movement = player_step_movement;
script_attack = player_step_attack;
script_dodge = player_step_dodge;
script_pain = player_step_pain;
script_recover = player_step_recover;
script_special = player_step_special;

#endregion