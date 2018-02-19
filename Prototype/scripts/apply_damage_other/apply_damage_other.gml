/// @function apply_damage_other(attack_stats, o_other, sweetshotspot, headshot)
/// @description pass array of stats to apply damage to opponent on successful hit

/// @param attack_stats
/// @param o_entity_receiving
///	@param sweetspot
/// @param headshot

var attack_stats = argument[0];
var o_other = argument[1];
var sweetspot = argument[2];
var headshot = argument[3];

if o_other.invincible || o_other.dead || 
	(o_other == instance_nearest(x, y, o_player) && global.godmode)
	exit;

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

// if sweetshotspot, choose sweetshotspot dmg / poise
var damage = attack_stats[1];
var vitality_damage = 0;
var poise_damage = 0;
// mah special increase!!
var self_special_increase = 0;

if sweetspot {
	vitality_damage = damage[1];
	poise_damage = attack_stats[3] * 2;
	self_special_increase = attack_stats[4] * 2;
}
else {
	vitality_damage = damage[0];
	poise_damage = attack_stats[3];
	self_special_increase = attack_stats[4];
}

// and if headshot, double damage chosen
if headshot {
	vitality_damage *= 2;
	poise_damage *= 2;
	self_special_increase *= 2;
}
	
// now apply the damage to enemy
o_other.vitality -= vitality_damage;
o_other.poise -= poise_damage;

// and apply special increase to self
special += self_special_increase;

// lastly, set enemy to invincible so they don't get hit every frame for a million damage
o_other.just_hit = true;

// if the enemy's poise is broken, launch them with the attack vector
//	and make them go into 'pain' state
if o_other.poise <= 0 || headshot {
	o_other.velocity = [ image_xscale * velocity_break[0], velocity_break[1] ];
	o_other.current_state = states.pain;
	o_other.starting = true;
}
else {	// just launch them a little after being hit
	o_other.velocity = [ image_xscale * velocity_break[0] / 2, 0 ]; 
	
}

if !NPC {
	score += vitality_damage * (headshot ? 2 : 1);	
}

// get the tilemap id
var layer_id = layer_get_id("layer_instance_popups");
var particle_layer = layer_get_id("layer_instance_particles");

/*
/////////////////////////////////////////////////////////////
// show the particle explosion!!!!
if headshot
	var part_top = o_other.hitbox_head_top;
else var part_top = o_other.y;

var particle_blast = instance_create_layer(o_other.x, 
	part_top, particle_layer, o_particle_blast);
*/

/////////////////////////////////////////////////////////////
if vitality_damage > 0 {
	// show the damage popup!!!!
	var damage_popup = instance_create_layer(o_other.x, o_other.hitbox_head_top, layer_id, o_damage_popup);
	damage_popup.damage = vitality_damage;
	damage_popup.positive = false;
	damage_popup.headshot = headshot;
	damage_popup.sweetspot = sweetspot;
}

if self_special_increase > 0 {
	// show the special popup!
	var special_popup = instance_create_layer(x, hitbox_head_top, layer_id, o_damage_popup);
	special_popup.damage = self_special_increase;
	special_popup.base_color = c_silver;
	special_popup.positive = true;
}






