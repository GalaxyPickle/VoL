/// @description parent class for health, stamina, poise, and special

NPC = true;

////////////////////////////////////
// HITBOXES
////////////////////////////////////
#region

// hitbox NOT COLLISIONS WITH TERRAIN sprite
sprite_hitbox = s_enemy_default;
sprite_hitbox_head = s_enemy_default;

hitbox_left = x;
hitbox_right = x;
hitbox_top = y;
hitbox_bottom = y;

hitbox_head_left = x;
hitbox_head_right = x;
hitbox_head_top = y;
hitbox_head_bottom = y;

// how far up to set the head hitbox of each entity
head_hitbox_offset = 32;

#endregion
////////////////////////////////////
// sprite setting
////////////////////////////////////
#region

// movement sprites
sprite_rest = s_enemy_default;
sprite_run = s_enemy_default;
sprite_jump = s_enemy_default;
sprite_walljump = s_enemy_default;

// other event sprites
sprite_pain = s_enemy_default;
sprite_dodge = s_enemy_default;
sprite_special = s_enemy_default;

// attack sprites
sprite_attack_ground_1 = s_enemy_default;
sprite_attack_ground_2 = s_enemy_default;

sprite_attack_air_1 = s_enemy_default;
sprite_attack_air_2 = s_enemy_default;

// death/fail sprites
sprite_death = s_enemy_default;

#endregion
////////////////////////////////////
// sounds!
////////////////////////////////////
#region

s_emit = audio_emitter_create();			// create sound emitter for position-based sound
audio_emitter_position(s_emit, x, y, 0);	// set emitter position to entity starting point
audio_emitter_falloff(s_emit, 500, 2000, 1);// make sounds die completely at 1000px away, starting at 100px

// movement
sound_idle = a_player_footstep;					// not moving
sound_run = a_player_footstep;						// moving L/R
sound_jump = a_player_footstep;					// one-shot when leaving ground
sound_land = a_player_footstep;					// one-shot when hitting ground

sound_step = a_player_footstep;
play_sound_footstep = a_player_footstep;
footstep_time = room_speed / 4;

// recovery and stuff
sound_take_damage = a_player_footstep;				// an "OOF!" or hurt sound when hit
sound_poise_break = a_player_footstep;				// a REALLY hurt sound when collapsing back
sound_recovery = a_player_footstep;				// healing sound?
sound_dodge = a_player_footstep;					// dodge sound
sound_death = a_player_footstep;					// DEATH sound

// attack sounds
sound_attack_ground_1 = a_player_footstep;			// woosh of weapon sound
sound_attack_charge_ground_1 = a_player_footstep;	// the charged up woosh of weapon sound

sound_attack_ground_2 = a_player_footstep;
sound_attack_charge_ground_2 = a_player_footstep;

sound_attack_air_1 = a_player_footstep;
sound_attack_charge_air_1 = a_player_footstep;

sound_attack_air_2 = a_player_footstep;
sound_attack_charge_air_2 = a_player_footstep;

current_attack_sound = sound_attack_ground_1;

#endregion
////////////////////////////////////
// attack stats
////////////////////////////////////
#region

// these are arrays that hold triangle points that coordinate with the attacks
//	of each animation for a specific frame. Each enemy has them set upon
//	creation, uniquely.
attack_ground_1_point_array = [];
attack_ground_2_point_array = [];

attack_air_1_point_array = [];
attack_air_2_point_array = [];

// determine which point array to check collisions for and draw in debug mode
current_point_array = attack_ground_1_point_array;

// these are the velocities and buffs/debuffs of the respective attack
attack_ground_1_stats = [
	[10, -10],	// velocity of attack to opponent if poise broken (default facing right)
	[10, 20],	// default vitality dmg / sweet spot dmg (headshots are x2 current health dmg)
	10,			// default stamina cost of the attack
	10,			// default poise dmg of the attack
	10,			// default special amount increase from a successful attack
	];
attack_ground_2_stats = [
	[10, -10],
	[10, 20],
	10,
	10,
	10,
	];
	
attack_air_1_stats = [
	[5, 0],
	[10, 20],
	10,
	10,
	10,
	];
attack_air_2_stats = [
	[10, 10],
	[10, 20],
	10,
	10,
	10,
	];
	
// current attack stats
current_attack_stats = attack_ground_1_stats;

#endregion
////////////////////////////////////
// input constants
////////////////////////////////////
#region

key_right = false;
key_left = false;
key_up = false;
key_down = false;
key_jump = false;

key_attack = false;
key_dodge = false;
key_special = false;

#endregion
////////////////////////////////////
// physics & collisions constants
////////////////////////////////////
#region

max_velocity_y = TILE_SIZE - 1;
horizontal_acceleration = ACCELERATION;
horizontal_friction = FRICTION;

on_ground = false;
on_wall = false;

on_wall_left = false;
on_wall_right = false;

on_wall_bottom_left = false;
on_wall_bottom_right = false;

x_direction = 0; // 1 = right, 0 = no input/last direction, -1 = left

velocity = [0,0];

// get the tilemap id
var layer_id = layer_get_id("layer_tile_collision");
collision_tile_map_id = layer_tilemap_get_id(layer_id);

#endregion
////////////////////////////////////
// entity stats
////////////////////////////////////
#region

enemy_list = [o_reptilian_large];	// list of all enemies this entity has in the game
nearest_enemy = [];					// list of all enemies in "enemy_range"
									//	when an enemy is farther away it is removed from list
									//	+ vise versa

enemy_range = 100; // pixels away for "enemy in range" to trigger
sight_range = 1000;

pause_input_start = false;
pause_input = false;	// during moves or something you can pause movement

just_hit = false;
starting = false;
combo = false;

move = false;
invincible = false;
dead = false;

jump_speed_y = 10;
max_velocity_x = 5;

// stamina costs for non attack moves
jump_stamina_cost = 0;
dodge_stamina_cost = 30;

// launch x velocities for non attack moves
dodge_launch = TILE_SIZE / 2;

// VITALITY
vitality_max = 500;			// max health
vitality = vitality_max;	// current health
vitality_regen = .01;		// health regen rate per frame

// STAMINA
stamina_max = 100;
stamina = stamina_max;
stamina_regen = .1;

// POISE
poise_max = 100;
poise = poise_max;
poise_regen = .1;

// SPECIAL
special_max = 100;
special = 0;
special_regen = .1;

#endregion
////////////////////////////////
// GUI stat listing
////////////////////////////////
#region
// list of stats for easy updating each step
// these arrays are set to the values of the above variables because
//	the above vars are easier to read/use than the arrays below

vitality_ = [
	"Vitality",
	c_red,
	vitality,		// current health
	vitality_max,	// absolute total health
	vitality_regen,	// health regen rate (per frame)
	];
stamina_ = [
	"Stamina",
	c_green,
	stamina,		// current stamina
	stamina_max,	// absolute total stamina
	stamina_regen,	// stamina regen rate (per frame)
	];
poise_ = [
	"Poise",
	c_orange,
	poise,			// current poise
	poise_max,		// absolute total poise
	poise_regen,	// poise regen rate (per frame)
	];
special_ = [
	"Special",
	c_silver,
	special,		// current special ability charge
	special_max,	// special needed to activate one instance
	special_regen,	// special regen rate?
	];

stat_array = [vitality_, stamina_, poise_, special_];

#endregion
////////////////////////////////////////
// state machine + input queue
////////////////////////////////////////
#region

script_movement = NPC_step_movement;
script_attack = NPC_step_attack;
script_dodge = NPC_step_dodge;
script_pain = NPC_step_pain;
script_recover = NPC_step_recover;
script_special = NPC_step_special;

// set up the FSM states for enemies and the player(s)
enum states 
{
	idle,		// not doing anything, default setting for movement
	attack,		// execute an attack towards the opponent
	dodge,		// dodge an expected attack
	pain,		// stunned, IE lost poise and knocked off balance
	recover,	// use a healing ability or something
	special,	// SPECIAL
	death		// death animation then keep as sprite or end game if player
}

current_state = states.idle;

// holds next input choices for AI or player
// can be attack, dodge, or special
input_queue = ds_queue_create();

#endregion