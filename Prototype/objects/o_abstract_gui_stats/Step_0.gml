/// @description debug, stats, other visuals

event_inherited();

var current_state_string = "";
switch (current_state) {
	case states.idle: current_state_string = "idle";
		break;
	case states.patrol: current_state_string = "patrol";
		break;
	case states.follow: current_state_string = "follow";
		break;
	case states.flee: current_state_string = "flee";
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
	["enemy distance: ", distance_to_object(nearest_enemy)],
	["enemy in range: ", enemy_in_range ? "true" : "false"],
	];