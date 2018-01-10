/// @description setup vars and controls and stuff

event_inherited();

////////////////////////////////////
// sprite setting
////////////////////////////////////

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
// input buffer
////////////////////////////////////

input_queue = ds_queue_create();

alarm[0] = -1;