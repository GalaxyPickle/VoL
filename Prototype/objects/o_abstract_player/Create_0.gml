/// @description setup vars and controls and stuff

event_inherited();

NPC = false;

// set a light source on the player
light_source = instance_create_layer(x, y, "layer_instance_lights", o_light_source);
light_source.owner = self;
light_source.tilemap = collision_tile_map_id;
light_source.radius = 400;

enemy_list = [o_reptilian_large];

draw_my_healthbars = false;
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
sprite_recover = s_player_air;

sprite_air = s_player_air;
sprite_walljump = s_player_air_mirror;
sprite_jump = s_player_roll;

// other event sprites
sprite_pain = s_player_pain;
sprite_dodge = s_player_roll;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_player_attack_ground_1;
sprite_attack_ground_2 = s_player_attack_ground_2;

sprite_attack_air_1 = s_player_attack_air_1;
sprite_attack_air_2 = s_player_attack_air_2;

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

sound_attack_air_1 = a_sword_slice_1;
sound_attack_charge_air_1 = a_player_footstep;

sound_attack_air_2 = a_sword_slice_2;
sound_attack_charge_air_2 = a_player_footstep;

#endregion
////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////
#region

// ground 1
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

// ground 2
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

// air 1
// frames = 5; critical = 1-2
var a1_frame1_basic = [ -16, 4, 6, -10, 48, -8 ];
var a1_frame1_sweet = [
	[ 40, -4, 48, -10, 72, -8 ]
	];
	
var a1_frame2_basic = [ 40, -8, 8, 4, -56, -12 ];
var a1_frame2_sweet = [
	[ 48, 4, 10, 10, -54, 4 ],
	[ 10, 10, -54, 4, -64, -10 ],
	[ -54, 4, -64, -10, -56, -12 ]
	];

attack_air_1_point_array = [
	[ a1_frame1_basic, a1_frame1_sweet ],
	[ a1_frame2_basic, a1_frame2_sweet ],
	[],
	[],
	[],
	];
	
// air 2
// frames = 6; critical = 3
var a2_frame3_basic = [ 26, 20, 48, 48, 64, 32 ];
var a2_frame3_sweet = [
	[ 32, 42, 36, 56, 64, 58 ],
	[ 36, 56, 64, 58, 75, 45 ],
	[ 64, 58, 75, 45, 64, 24 ]
	];

attack_air_2_point_array = [
	[],
	[],
	[ a2_frame3_basic, a2_frame3_sweet ],
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
	0,			// default stamina cost of the attack
	10,			// default poise damage of the attack
	2,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[10, -10],
	[70, 100],
	0,
	20,
	3,
	];
	
attack_air_1_stats = [
	[5, 2],
	[30, 60],
	0,
	15,
	5,
	];
attack_air_2_stats = [
	[5, 5],
	[50, 70],
	0,
	30,
	7,
	];

#endregion
////////////////////////////////////
// input constants
////////////////////////////////////
#region

key_right = global.key_right;
key_left = global.key_left;
key_up = global.key_up;
key_down = global.key_down;
key_jump = global.key_jump;

key_attack = global.key_attack;
key_dodge = global.key_dodge;
key_special = global.key_special;

////////////////////////////////////
// physics & collisions constants
////////////////////////////////////

jump_speed_y = 12.5;
max_velocity_x = 8;

#endregion
////////////////////////////////////
// game stats
////////////////////////////////////
#region

dodge_launch = TILE_SIZE - 16;
dodge_stamina_cost = 0;

// VITALITY
vitality_max = 500;			// max health
vitality = vitality_max;	// current health
vitality_regen = .05;		// health regen rate per frame

// STAMINA
stamina_max = 100;
stamina = stamina_max;
stamina_regen = .5;

// POISE
poise_max = 40;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = 100;
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
script_death = player_step_death;

#endregion