/// @description setup vars and controls and stuff

event_inherited();

enemy = false;

////////////////////////////////////
// sprite setting
////////////////////////////////////

sprite_hitbox = s_hitbox_player_upright;
sprite_hitbox_head = s_hitbox_player_head;
head_hitbox_offset = 28;

// movement sprites
sprite_rest = s_player_rest;
sprite_run = s_player_run;
sprite_jump = s_player_jump;

// other event sprites
sprite_pain = s_enemy_default;
sprite_dodge = s_enemy_default;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_player_attack_ground_1;
sprite_attack_ground_2 = s_player_attack_ground_2;

sprite_attack_air_1 = s_enemy_default;

// death/fail sprites
sprite_death = s_enemy_default;

////////////////////////////////////
// attack point arrays and stats
////////////////////////////////////

// frames = 6; criticals = 2-3
var hitbox_frame2_basic = [ -37, -5, 21, 21, 53, -32 ];
var hitbox_frame2_sweet = [ 
	[ -37, 5, -8, 28, 24, 34 ],
	[ -8, 28, 24, 34, 56, 12 ],
	[ 24, 34, 56, 12, 64, -32 ],
	[ 56, 12, 64, -32, 48, -32 ]
	];
var hitbox_frame3_basic = [ 8, -56, 16, -16, 55, -21 ];
var hitbox_frame3_sweet = [
	[ 48, -16, 70, -16, 50, -60 ],
	[ 70, -16, 50, -60, 8, -69 ],
	];
	

attack_ground_1_point_array = [
	[],
	[ hitbox_frame2_basic, hitbox_frame2_sweet ],
	[ hitbox_frame3_basic, hitbox_frame3_sweet ],
	[],
	[],
	[],
	];
	
// frames = 7
attack_ground_2_point_array = [];

//////////////////////////////////
// attack properties
//////////////////////////////////

// these are the velocities and damages of the respective attack
attack_ground_1_stats = [
	[10, -10],	// velocity of attack to opponent if poise broken (default facing right)
	50,			// default health damage of the attack
	25,			// default stamina cost of the attack
	60,			// default poise damage of the attack
	2,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[10, -10],
	70,
	35,
	100,
	3,
	];
	
attack_air_1_stats = [
	[10, -10],
	30,
	10,
	10,
	5,
	];

////////////////////////////////////
// input constants
////////////////////////////////////

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

jump_speed_y = PLAYER_JUMP_SPEED_Y;
max_velocity_x = PLAYER_MAX_VELOCITY_X;
max_velocity_y = PLAYER_MAX_VELOCITY_Y;
horizontal_acceleration = PLAYER_ACCELERATION;
horizontal_friction = PLAYER_FRICTION;

////////////////////////////////////
// game stats
////////////////////////////////////

nearest_enemy = noone;
jump_stamina_cost = 10;

health_ = [
	"Health",
	c_red,
	500,	// current health  
	500,	// absolute total health
	.01,		// health regen rate (per frame)
	];
stamina_ = [
	"Stamina",
	c_green,
	100,		// current stamina
	100,		// absolute total stamina
	.5,			// stamina regen rate (per frame)
	];
poise_ = [
	"Poise",
	c_orange,
	100,		// current poise
	100,		// absolute total poise
	.7,			// poise regen rate (per frame)
	];
special_ = [
	"Special",
	c_silver,
	0,		// current special ability charge
	100,	// special needed to activate one instance
	0,		// special regen rate?
	1,		// special increase upon successful completion of attack or whatever else
	];

////////////////////////////////////
// input buffer
////////////////////////////////////

input_queue = ds_queue_create();

alarm[0] = -1;