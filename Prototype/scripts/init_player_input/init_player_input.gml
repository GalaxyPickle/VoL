///@description initialize player constants / globals

///////////////////////////////
// keyboard input
//////////////////////////////

// input controls
global.key_escape = vk_escape;
global.key_enter = vk_enter;

// movement controls
global.key_left = vk_left;
global.key_right = vk_right;
global.key_up = vk_up;
global.key_down = vk_down;

global.key_jump = vk_space;

// combat controls
global.key_attack = ord("F");
global.key_dodge = ord("D");
global.key_special = ord("S");
global.key_interact = ord("A");

///////////////////////////////
// gamepad input
//////////////////////////////

// navigation
global.gp_key_escape = gp_select;
global.gp_key_enter = gp_start;

// movement
global.gp_key_horizontal = gp_axislh;
global.gp_key_vertical = gp_axislv;

global.gp_key_jump = gp_face1;			// A

// combat
global.gp_key_attack = gp_face3;		// X
global.gp_key_dodge = gp_shoulderr;		// R Bumper
global.gp_key_special = gp_face4;		// Y
global.gp_key_interact = gp_face2;		// B














