/// @description code for player attacking executed every step

var vel_x = 0;

var ground_launch_velocity = image_xscale * TILE_SIZE - 1;
var sprite = 0;

// set current attack based on combo info
if starting {
	if alarm[10] > -1
		combo = true;
	else
		combo = false;
	
	if on_ground {
	
		// no combo = ground 1 attack
		if !combo {
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
	else {
		// AIR ATTACK!!!!!!!
		if !combo {
			current_point_array = attack_air_1_point_array;
			current_attack_stats = attack_air_1_stats;
			current_attack_sound = sound_attack_air_1;
	
			sprite = sprite_attack_air_1;
		}
		else {
			current_point_array = attack_air_2_point_array;
			current_attack_stats = attack_air_2_stats;
			current_attack_sound = sound_attack_air_2;
	
			sprite = sprite_attack_air_2;
		}
	}
}

// can still move if in air
if !on_ground && 
	( current_attack_stats != attack_ground_1_stats && 
	current_attack_stats != attack_ground_2_stats ) {
	var x_input = x_direction * horizontal_acceleration;
	var vec2_x = 0;
	// horizontal movement
	velocity[vec2_x] = clamp( velocity[vec2_x] + x_input, -max_velocity_x, max_velocity_x);	
}
	
// exit immediately if landing or into air from ground
if ( on_ground && 
		(current_attack_stats == attack_air_1_stats || current_attack_stats == attack_air_2_stats) ) /*||
	( !on_ground && 
		(current_attack_stats == attack_ground_1_stats || current_attack_stats == attack_ground_2_stats) )*/
{
	combo = false;
	current_state = states.idle;
	
	if on_ground
		sprite_index = sprite_rest;
	else
		sprite_index = sprite_air;
	
	exit;
}

	
// if starting, take out stamina and start animation
if starting {
	stamina -= current_attack_stats[2];
	
	if on_ground
		velocity[vel_x] = ground_launch_velocity;
	
	// set proper sprite AFTER exiting to ensure no weird animations
	sprite_index = sprite;
	image_index = 0;
	
	// play sound
	audio_play_sound_on(s_emit, current_attack_sound, false, 1);
}

// set sprite speed depending on combo amount
image_speed = 1 + global.combo * 0.03;

// increase damage based on combo amount
var combo_mult = .02;
var stats = current_attack_stats[1];
stats =
[ 
	round(stats[0] + stats[0] * global.combo * combo_mult),	// 2% increase per combo amount 
	round(stats[1] + stats[1] * global.combo * combo_mult) 
];
current_attack_stats[1] = stats;

// check for enemy in range
for (var i = 0; i < array_length_1d(nearest_enemy); i++) {
	
	var enemy = nearest_enemy[i];
	
	if enemy == undefined || enemy == pointer_null || enemy == noone || enemy.dead
		continue;
	
	// returns [found?, sweetspot?, headshot?]
	var hit_array = check_attack_collision(enemy);
	
	if array_length_1d(hit_array) > 1 {
		var found = hit_array[0];
		var sweetspot = hit_array[1];
		var headshot = hit_array[2];
		
		alarm[3] = room_speed * 3;
	
		// apply any damage to near enemies
		if found && !enemy.invincible {
			apply_damage_other(current_attack_stats, enemy, sweetspot, headshot);
			
			if (!global.ability_whirlwind && global.combo == global.combo_default_max) ||
				global.ability_whirlwind && global.combo == global.combo_ability_max
				continue;
			
			// check for combo and some crazy stuff
			global.combo++;
		}
	}
}

// cancel out stamina regen
stamina -= stamina_regen;
	
// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1 {
	
	if !combo
		alarm[10] = room_speed / 4;
	
	// reset state to idle for next input or no input
	current_state = states.idle;
}