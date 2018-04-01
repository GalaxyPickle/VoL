/// @description called at end of every entity step

switch (current_state) {
	
	case states.idle:
		script_execute(script_movement);
		break;
	
	case states.attack:
		script_execute(script_attack);
		break;
	
	case states.dodge:
		script_execute(script_dodge);
		break;
		
	case states.pain:
		script_execute(script_pain);
		break;
	
	case states.recover:
		script_execute(script_recover);
		break;
		
	case states.special:
		script_execute(script_special);
		break;
		
	case states.death:
		script_execute(script_death);
		break;
}