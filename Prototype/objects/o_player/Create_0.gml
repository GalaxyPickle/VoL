/// @description gameover var

// Inherit the parent event
event_inherited();

start_gameover = false;

// VITALITY
vitality_max = global.player_start_vitality;	// max health
vitality = vitality_max;						// current health
vitality_regen = .001;				// health regen rate per frame

// POISE
poise_max = 40;
poise = poise_max;
poise_regen = .08;

// SPECIAL
special_max = global.player_start_special;
special = 0;
special_regen = 0;

if global.died {
	vitality_max = global.death_vitality;
	special_max = global.death_sunyata;
}