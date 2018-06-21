/// @description player roll dodge step script

var vel_x = 0;
var spr = sprite_dodge;

if ghost_mode {
	// if you are cooling down......
	if instance_exists(o_dash_cooldown) && starting {
		current_state = states.idle;
		exit;
	}
	spr = s_player_shadow_dash;
}

invincible = true;
image_speed = 1;
sprite_index = spr;

if starting {
	image_index = 0;
	
	// normal dodge
	if !ghost_mode {
		if on_ground
			velocity[vel_x] = dodge_launch * image_xscale;
	
		// play sound
		audio_play_sound_on(s_emit, sound_dodge, false, 1);
	}
	else {// play sound
		audio_play_sound_on(s_emit, a_shadow_dash, false, 1);
		instance_create(x, y, o_dash_cooldown);
	}
}

if ghost_mode
	velocity[vel_x] = 20 * image_xscale;

// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1 {
	
	// player can be hit again!
	invincible = false;
	
	// reset state to idle for next input or no input
	current_state = states.idle;
}