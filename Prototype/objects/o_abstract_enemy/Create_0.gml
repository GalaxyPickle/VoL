/// @description set custom stats for big reptilian

// Inherit the parent event
event_inherited();

jump_stamina_cost = 20;

// VITALITY
vitality_max = 2000;			// max health
vitality = vitality_max;	// current health
vitality_regen = .1;		// health regen rate per frame

// STAMINA
stamina_max = 500;
stamina = stamina_max;
stamina_regen = .4;

// POISE
poise_max = 200;
poise = poise_max;
poise_regen = .4;

// SPECIAL
special_max = 200;
special = 0;
special_regen = .1;