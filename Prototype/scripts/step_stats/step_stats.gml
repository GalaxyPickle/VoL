/// @description regen stats, cap them, etc

/////////////////////////////////////////////////////////////////////////////
// deal with game stat stuff
/////////////////////////////////////////////////////////////////////////////

starting = false;

// player pause input after walljump etc.
if pause_input_start {
	pause_input = true;
	alarm[1] = pause_input_length;
	pause_input_start = false;
}

// footstep sound timer
play_sound_footstep = false;
if alarm[2] == -1 {
	play_sound_footstep = true;
	alarm[2] = footstep_time;
}

// vitality
if vitality < 0
	dead = true;
// stamina
if stamina < 0
	stamina = 0;
// poise
if poise < 0
	poise = 0;
// special
if special < 0
	special = 0;

if !invincible {
	// vitality
	if vitality < vitality_max
		vitality += vitality_regen;
	// stamina
	if stamina < stamina_max
		stamina += stamina_regen;
	// poise
	if poise < poise_max
		poise += poise_regen;
	// special
	if special < special_max
		special += special_regen;
}

// set array for gui debug info
vitality_[2] = vitality;
stamina_[2] = stamina;
poise_[2] = poise;
special_[2] = special;

stat_array = [vitality_, poise_, special_];

/////////////////////////////////////////////////////////////////////////////
// lastly, set sprite direction
/////////////////////////////////////////////////////////////////////////////

if current_state == states.idle {
	if !pause_input {
		if x_direction == -1
			image_xscale = -1;
		if x_direction == 1
			image_xscale = 1;
	}
}