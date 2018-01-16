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
	["on ground: ", on_ground ? "true" : "false"],
	["on wall L: ", on_wall_left ? "true" : "false"],
	["on wall R: ", on_wall_right ? "true" : "false"],
	];