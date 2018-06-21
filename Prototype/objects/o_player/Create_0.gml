/// @description gameover var

// Inherit the parent event
event_inherited();

start_gameover = false;
check_door = true;

// VITALITY
vitality_max = global.death_vitality;	// max health
vitality = global.death_vitality_current;						// current health
vitality_regen = .001;				// health regen rate per frame

// POISE
poise_max = 40;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = global.death_sunyata;
special = global.death_sunyata_current;
special_regen = 0;