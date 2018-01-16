/// @description regen stats, cap them, etc

/////////////////////////////////////////////////////////////////////////////
// deal with game stat stuff
/////////////////////////////////////////////////////////////////////////////

starting = false;

if just_hit {
	invincible = true;
	alarm[0] = room_speed / 3; // 1/3 second invinciblity
	just_hit = false;
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

stat_array = [vitality_, stamina_, poise_, special_];
