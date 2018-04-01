/// @description setup vars and controls and stuff

event_inherited();

global.player = self;

NPC = false;
gamepad_input = false;

enemy_list = [o_reptilian_large, o_worm, o_beetle, o_dummy];

sprite_special_effect = s_player_laser_front;
special_damage = 500;

draw_my_healthbars = false;
move = true;

changed = false;

// lightsource
lightsource = instance_create_layer(x, y, "layer_instance_lights", o_lightsource);
light_radius = 300;
with lightsource {
	pl_light_init(other.light_radius, c_white, .7);
	pl_active = false;
	player = true;
}

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
sprite_recover = s_player_recover;

sprite_air = s_player_air;
sprite_walljump = s_player_air_mirror;
sprite_jump = s_player_roll;

// other event sprites
sprite_pain = s_player_pain;
sprite_dodge = s_player_roll;
sprite_special = s_player_attack_special;

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
sound_run = a_reptilian_footstep;				// moving L/R
sound_jump = a_player_jump;					// one-shot when leaving ground
sound_land = a_player_land;					// one-shot when hitting ground

// recovery and stuff
sound_take_damage = a_player_hit;				// an "OOF!" or hurt sound when hit
sound_poise_break = a_player_pain;				// a REALLY hurt sound when collapsing back
sound_recovery = a_player_footstep;				// healing sound?
sound_dodge = a_player_roll;					// dodge sound
sound_death = a_player_footstep;					// DEATH sound

// attack sounds
sound_special_warmup = a_sword_laser_warmup;
sound_special = a_laser_blast;

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
// frames = 7; critical = 3
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
	[],
	[]
	];

#endregion
//////////////////////////////////
// attack properties
//////////////////////////////////
#region

// these are the velocities and damages of the respective attack
special_stats = [
	[TILE_SIZE - 2, -10],
	[500, 700],
	0,
	1000,
	0
	];

attack_ground_1_stats = [
	[10, -5],	// velocity of attack to opponent if poise broken (default facing right)
	[20, 30],	// default health damage of the attack (basic, sweet)
	0,			// default stamina cost of the attack
	10,			// default poise damage of the attack
	1,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[15, -7],
	[25, 35],
	0,
	20,
	3,
	];
	
attack_air_1_stats = [
	[5, 2],
	[10, 20],
	0,
	15,
	5,
	];
attack_air_2_stats = [
	[5, 5],
	[15, 25],
	0,
	30,
	7,
	];

#endregion
////////////////////////////////////
// input constants
////////////////////////////////////
#region

// keyboard
key_enter = global.key_enter;
key_escape = global.key_escape;

key_right = global.key_right;
key_left = global.key_left;
key_up = global.key_up;
key_down = global.key_down;

key_jump = global.key_jump;
key_attack = global.key_attack;
key_dodge = global.key_dodge;
key_special = global.key_special;

// gamepad
gp_enter = global.gp_key_enter;
gp_escape = global.gp_key_escape;

gp_horizontal = global.gp_key_horizontal;
gp_vertical = global.gp_key_vertical;

gp_jump = global.gp_key_jump;
gp_attack = global.gp_key_attack;
gp_dodge = global.gp_key_dodge;
gp_special = global.gp_key_special;

////////////////////////////////////
// physics & collisions constants
////////////////////////////////////

jump_speed_y = 9;
max_velocity_x = 6;

#endregion
////////////////////////////////////
// game stats
////////////////////////////////////
#region

dodge_launch = TILE_SIZE - 16;
sight_range = global.game_width / 3;
stun_time = room_speed / 2;

// VITALITY
vitality_max = 500;			// max health
vitality = vitality_max;	// current health
vitality_regen = .001;		// health regen rate per frame

// STAMINA
stamina_max = 100;
stamina = stamina_max;
stamina_regen = .5;

// POISE
poise_max = 40;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = 500;
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