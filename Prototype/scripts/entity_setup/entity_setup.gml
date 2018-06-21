/// @description reset auto vars after set lower level

/////////////////////////////
// interactable stuff
/////////////////////////////

vitality = vitality_max;
poise = poise_max;
special = 0;

// list of stats for easy updating each step
// these arrays are set to the values of the above variables because
//	the above vars are easier to read/use than the arrays below
vitality_ = [
	"Vitality",
	c_red,
	vitality,		// current health
	vitality_max,	// absolute total health
	vitality_regen,	// health regen rate (per frame)
	];
stamina_ = [
	"Stamina",
	c_green,
	stamina,		// current stamina
	stamina_max,	// absolute total stamina
	stamina_regen,	// stamina regen rate (per frame)
	];
poise_ = [
	"Poise",
	c_orange,
	poise,			// current poise
	poise_max,		// absolute total poise
	poise_regen,	// poise regen rate (per frame)
	];
special_ = [
	"Special",
	c_silver,
	special,		// current special ability charge
	special_max,	// special needed to activate one instance
	special_regen,	// special regen rate?
	];

stat_array = [vitality_, stamina_, poise_, special_];

///////////////////////////////////
// NPC
///////////////////////////////////
if !NPC
	exit;
	
// set proper AI scripts or stats for AI type
// BOSS
if AI == AI_type.enemy_boss
	script_AI_goal = script_boss
	
// ENEMY
else if AI == AI_type.enemy_aggressive || AI == AI_type.enemy_cautious
	script_AI_goal = script_enemy;
	
// FRIENDLY
else if AI == AI_type.friendly_follow || AI == AI_type.friendly_meander || AI == AI_type.friendly_hide
	script_AI_goal = script_friendly;






