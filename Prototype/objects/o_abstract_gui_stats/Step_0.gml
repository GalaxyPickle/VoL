/// @description debug, stats, other visuals

event_inherited();

var current_state_string = "";
switch (current_state) {
	case states.idle: current_state_string = "idle";
		break;
	case states.attack: current_state_string = "attack";
		break;
	case states.dodge: current_state_string = "dodge";
		break;
	case states.pain: current_state_string = "pain";
		break;
	case states.recover: current_state_string = "recover";
		break;
	case states.special: current_state_string = "special";
		break;
}
draw_variables = 
[ 
	["x: ", x], 
	["y: ", y],
	["vx: ", velocity[0]],
	["vy: ", velocity[1]],
	["ghost: ", ghost_mode],
	//["state: ", current_state_string],
	//["AI state: ", NPC ? AI_goal : "NaN"],
	//["on ground: ", on_ground ? "true" : "false"],
	//["on wall: ", on_wall ? "true" : "false"],
	//["walljump L: ", on_wall_jump_left ? "true" : "false"],
	//["nearest enemies: ", nearest_enemy],
];

var_time_var += 0.04;