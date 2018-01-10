///@description initialize player constants / globals

///////////////////////////////
// player constants / globals
//////////////////////////////

#macro PLAYER_JUMP_SPEED_Y		14
#macro PLAYER_MAX_VELOCITY_X	8
#macro PLAYER_MAX_VELOCITY_Y	TILE_SIZE
#macro PLAYER_ACCELERATION		.5
#macro PLAYER_FRICTION			.5

// movement controls
#macro KEY_LEFT		vk_left
#macro KEY_RIGHT	vk_right
#macro KEY_UP		vk_up
#macro KEY_DOWN		vk_down
#macro KEY_JUMP		vk_up

// combat controls
#macro KEY_ATTACK	ord("F")
#macro KEY_DODGE	ord("D")
#macro KEY_SPECIAL	ord("S")