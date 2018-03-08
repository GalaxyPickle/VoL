/// @description NPC dodge step

var vel_x = 0;

// exit immediately if stamina is not enough
if false {
	
	if !on_ground
		sprite_index = sprite_air;
	else sprite_index = sprite_rest;
	
	current_state = states.idle;
	invincible = false;
	
	exit;
}

invincible = true;
sprite_index = sprite_dodge;

if starting {
	image_index = 0;
	if on_ground
		velocity[vel_x] = dodge_launch * image_xscale;
		
	// play sound
	audio_play_sound_on(s_emit, sound_dodge, false, 1);
}

// end attack_mode if sprite current sub-frame == total sub-frames for sprite
if image_index >= image_number - 1 {
	
	// player can be hit again!
	invincible = false;
	
	// reset state to idle for next input or no input
	current_state = states.idle;
}