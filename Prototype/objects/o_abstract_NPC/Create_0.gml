/// @description set player as enemy 

// Inherit the parent event
event_inherited();

alarm[8] = room_speed;

ds_list_add(global.NPC_list, self);

enemy_list = [o_player];	// list of all enemies this entity has in the game

can_dodge = false;
can_jump = false;
can_special = false;
can_combo = false;
can_attack_ground = false;
can_attack_air = false;

enum AI_type {
	enemy_boss,	
	enemy_aggressive,
	enemy_cautious,
	friendly_follow,
	friendly_meander,
	friendly_hide,
	immovable
}

script_boss = AI_step_boss_goal_reptilian;
script_enemy = AI_step_enemy_goal;
script_friendly = AI_step_friend_goal;

script_AI_goal = script_enemy;

AI_goal_object = noone;

AI = AI_type.friendly_meander;

enum AI_states {
	wander,
	seek,
	fight,
	flee,
	spice,
	wait
}

AI_goal = AI_states.wander;