/// @description set custom sprites and stuff

// Inherit the parent event
event_inherited();

prone = true;
enemy_list = [o_player, o_reptilian_large];

can_jump = true;
can_attack_ground = false;
can_attack_air = true;

////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

sprite_hitbox = s_beetle_hitbox;
sprite_hitbox_head = s_beetle_hitbox_head;
head_hitbox_offset = 25;

// movement sprites
sprite_rest = s_beetle_rest;
sprite_run = s_beetle_run;
sprite_air = s_beetle_air;

// other event sprites
sprite_pain = s_beetle_pain;
sprite_dodge = s_beetle_air;
sprite_special = s_beetle_air;

// attack sprites
sprite_attack_ground_1 = s_reptilian_attack_ground_1;
sprite_attack_ground_2 = s_reptilian_attack_ground_2;

sprite_attack_air_1 = s_beetle_attack_air_1;

// death/fail sprites
sprite_death = s_enemy_default;
sprite_corpse = s_beetle_corpse;

#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

// movement
sound_idle = a_empty;							// not moving
sound_run = a_beetle_run;				// moving L/R
sound_jump = a_beetle_jump;					// one-shot when leaving ground
sound_land = a_reptilian_land;					// one-shot when hitting ground

footstep_time = room_speed / 3;

// recovery and stuff
sound_pain = [a_beetle_pain];
sound_recovery = a_empty;						// healing sound?
sound_dodge = a_player_footstep;							// dodge sound
sound_death = a_beetle_death;					// DEATH sound

// attack sounds
sound_attack_ground_1 = a_claw_slice_1;			// woosh of weapon sound
sound_attack_ground_2 = a_claw_slice_2;

sound_attack_air_1 = a_beetle_attack_air;

#endregion
////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////
#region

// frames = x; criticals = x
var g1_frame6_basic = [  ];
var g1_frame6_sweet = [ 
	[  ],
	[  ],
	[  ]
	];

attack_ground_1_point_array = [
	];
	
// frames = 5; critical = 2
var a1_frame2_basic = [ 32, 16, 50, 0, 66, 22 ];
var a1_frame2_sweet = [
	[ 36, 24, 62, 26, 74, 24 ],
	[ 62, 26, 74, 24, 70, 16 ],
	[ 74, 24, 70, 16, 58, 0 ]
	];

attack_air_1_point_array = [
	[],
	[ a1_frame2_basic, a1_frame2_sweet ],
	[],
	[],
	[]
	];

#endregion
//////////////////////////////////
// physics values
//////////////////////////////////
#region

jump_speed_y = 10;
max_velocity_x = 5;
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
	[3, -3],
	[20, 40],
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

close_range = 100; // pixels away for "enemy in range" to trigger
sight_range = 700;

// VITALITY
vitality_max = 300;			// max health
vitality = vitality_max;		// current health
vitality_regen = .1;			// health regen rate per frame

// STAMINA
stamina_max = 250;
stamina = stamina_max;
stamina_regen = .6;

// POISE
poise_max = 15;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = 200;
special = 0;
special_regen = .1;

#endregion
///////////////////////////////////////////////
// AI scripts
///////////////////////////////////////////////
#region

AI = AI_type.enemy_aggressive;

#endregion