/// @description parent class for health, stamina, poise, and special

////////////////////////////////////
// sprite setting
////////////////////////////////////

// movement sprites
sprite_rest = s_enemy_default;
sprite_run = s_enemy_default;
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

////////////////////////////////////
// input constants
////////////////////////////////////

key_right = false;
key_left = false;
key_up = false;
key_down = false;
key_jump = false;

key_attack = false;
key_dodge = false;
key_special = false;

////////////////////////////////////
// physics & collisions constants
////////////////////////////////////

jump_speed_y = ENEMY_JUMP_SPEED_Y;
max_velocity_x = ENEMY_MAX_VELOCITY_X;
max_velocity_y = ENEMY_MAX_VELOCITY_Y;
horizontal_acceleration = ENEMY_ACCELERATION;
horizontal_friction = ENEMY_FRICTION;

on_ground = false;
x_direction = 0; // 1 = right, 0 = no input/last direction, -1 = left

velocity = [0,0];

// get the tilemap id
var layer_id = layer_get_id("collisionTiles");
collision_tile_map_id = layer_tilemap_get_id(layer_id);

////////////////////////////////////
// game stats
////////////////////////////////////

health_ = [
	"Health",
	c_red,
	500,	// current health  
	500,	// absolute total health
	.1,		// health regen rate (per frame)
	];
stamina_ = [
	"Stamina",
	c_green,
	100,		// current stamina
	100,		// absolute total stamina
	5,			// stamina regen rate (per frame)
	];
poise_ = [
	"Poise",
	c_orange,
	100,		// current poise
	100,		// absolute total poise
	1,			// poise regen rate (per frame)
	];
special_ = [
	"Special",
	c_silver,
	0,		// current special ability charge
	100,	// special needed to activate one instance
	1,		// special regen rate?
	];

stat_array = [health_, stamina_, poise_, special_];

////////////////////////////////////////
// state machine
////////////////////////////////////////

// set up the FSM states for enemies and the player(s)
enum states 
{
	idle,	// PLAYER + not doing anything, default setting usually turns immediately to patrol
	patrol,	// just walking around checking things out
	follow,	// found the player, now is following him
	flee,	// run the heck away because I am a fool
	attack,	// PLAYER + execute an attack towards the opponent
	dodge,	// PLAYER + dodge an expected attack
	pain,	// PLAYER + stunned, IE lost poise and knocked off balance
	recover,// PLAYER + use a healing ability or something
	special	// PLAYER + SPECIAL
}

current_state = states.idle;