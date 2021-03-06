/// @description code for NPC attacking executed every step

var vel_x = 0;

var ground_launch_velocity = image_xscale * TILE_SIZE - 1;
var sprite = sprite_index;

// set current attack based on combo info
if on_ground && can_attack_ground {
	
	// no combo = ground 1 attack
	if !combo || !can_combo {
		current_point_array = attack_ground_1_point_array;
		current_attack_stats = attack_ground_1_stats;
		current_attack_sound = sound_attack_ground_1;
		
		sprite = sprite_attack_ground_1;
	}
	else { // combo = ground 2 attack!
		current_point_array = attack_ground_2_point_array;
		current_attack_stats = attack_ground_2_stats;
		current_attack_sound = sound_attack_ground_2;
		
		sprite = sprite_attack_ground_2;
	}
}
else { // in air
	if can_attack_air {
		current_point_array = attack_air_1_point_array;
		current_attack_stats = attack_air_1_stats;
		current_attack_sound = sound_attack_air_1;
		
		sprite = sprite_attack_air_1;
	}
	else sprite = sprite_air;
}
	
// exit immediately if stamina is not enough
if (on_ground && !can_attack_ground) || (!on_ground && !can_attack_air) 
{
	combo = false;
	current_state = states.idle;
	
	sprite_index = sprite_rest;
	
	exit;
}

// set proper sprite AFTER exiting to ensure no weird animations
sprite_index = sprite;
	
// if starting, take out stamina and start animation
if starting {
	stamina -= current_attack_stats[2];
	
	if on_ground
		velocity[vel_x] = ground_launch_velocity;
		
	image_index = 0;
	
	// sound
	audio_play_sound_on(s_emit, current_attack_sound, false, 1);
}


// check for enemy in range
for (var i = 0; i < array_length_1d(nearest_enemy); i++) {
	
	var enemy = nearest_enemy[@ i];
	
	// returns [found?, sweetspot?, headshot?]
	var hit_array = check_attack_collision(enemy);
	
	if array_length_1d(hit_array) > 1 {
		var found = hit_array[0];
		var sweetspot = hit_array[1];
		var headshot = hit_array[2];
	
		// apply any damage to enemy with script
		if found && !enemy.invincible
			apply_damage_other(current_attack_stats, enemy, sweetspot, headshot);
	}
}

// cancel out stamina regen
stamina -= stamina_regen;
	
// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1 {
	
	// line up combo if next input is attack
	if ds_queue_head(input_queue) == states.attack &&
		current_attack_stats == attack_ground_1_stats
		combo = true;
	else
		combo = false;
	
	// reset state to idle for next input or no input
	current_state = states.idle;
}