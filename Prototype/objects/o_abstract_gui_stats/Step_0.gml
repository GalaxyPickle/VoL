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
draw_variables = [ 
	["x: ", x], 
	["y: ", y], 
	["state: ", current_state_string],
	["AI state: ", NPC ? AI_goal : "NaN"],
	["on ground: ", on_ground ? "true" : "false"],
	["on wall: ", on_wall ? "true" : "false"],
	["nearest enemies: ", nearest_enemy]
	];
	/*
	["on wall L: ", on_wall_left ? "true" : "false"],
	["on wall R: ", on_wall_right ? "true" : "false"],
	["foot tile L: ", on_wall_bottom_left ? "true" : "false"],
	["foot tile R: ", on_wall_bottom_right ? "true" : "false"],
	];