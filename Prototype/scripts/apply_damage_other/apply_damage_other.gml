/// @function apply_damage_other(attack_stats, o_other, sweetspot, headshot)
/// @description pass array of stats to apply damage to opponent on successful hit

/// @param attack_stats
/// @param o_entity_receiving
///	@param sweetspot
/// @param headshot

var attack_stats = argument[0];
var o_other = argument[1];
var sweet = argument[2];
var headshot = argument[3];

// get the attack stats from the array passed in as damage
/*
attack_ground_1_stats = [
	[10, -10],	// velocity of attack to opponent if poise broken (default facing right)
	[10, 20],	// health damage of the attack
	10,			// stamina cost of the attack
	10,			// poise damage of the attack
	1,			// special amount increase from a successful attack
	];
*/
var velocity_break = attack_stats[0];

// if sweetspot, choose sweetspot dmg
var damage = attack_stats[1];
var vitality_damage = 0;

if sweet
	vitality_damage = damage[1];
else
	vitality_damage = damage[0];

// and if headshot, double damage chosen
if headshot
	vitality_damage *= 2;
	
var poise_damage = attack_stats[3];

var self_special_increase = attack_stats[4];

// now apply the damage to enemy
o_other.vitality -= vitality_damage;
o_other.poise -= poise_damage;

// and apply special increase to self
special += self_special_increase;

// lastly, set enemy to invincible so they don't get hit every frame for a million damage
o_other.just_hit = true;

// if the enemy's poise is broken, launch them with the attack vector
//	and make them go into 'pain' state
if o_other.poise <= 0 {
	o_other.velocity = [ image_xscale * velocity_break[0], velocity_break[1] ];
	o_other.current_state = states.pain;
	o_other.starting = true;
}

// show the damage popup!!!!
// get the tilemap id
var layer_id = layer_get_id("popups");
var damage_popup = instance_create_layer(o_other.x, o_other.y, layer_id, o_damage_popup);
damage_popup.draw_array = [
	-vitality_damage, -poise_damage, 
	sweet ? "SWEETSPOT!" : "no sweetspot",
	headshot ? "HEADSHOT!" : "no headshot"
	];