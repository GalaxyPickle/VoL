/// @description mother function to call every step for entity

//////////////////////////
// 0. hitbox vars
//////////////////////////

var vel_x = 0, vel_y = 1;

hitbox_left = x + velocity[vel_x] - sprite_get_xoffset(sprite_hitbox);
hitbox_right = x + velocity[vel_x] + sprite_get_width(sprite_hitbox) - sprite_get_xoffset(sprite_hitbox);
hitbox_top = y + velocity[vel_y] - sprite_get_yoffset(sprite_hitbox);
hitbox_bottom = y + velocity[vel_y] + sprite_get_height(sprite_hitbox) - sprite_get_yoffset(sprite_hitbox);

hitbox_head_left = x + velocity[vel_x] - sprite_get_xoffset(sprite_hitbox_head);
hitbox_head_right = x + velocity[vel_x] + sprite_get_width(sprite_hitbox_head) - sprite_get_xoffset(sprite_hitbox_head);
hitbox_head_top = y + velocity[vel_y] - head_hitbox_offset - sprite_get_yoffset(sprite_hitbox_head);
hitbox_head_bottom = y + velocity[vel_y] - head_hitbox_offset + sprite_get_height(sprite_hitbox_head) - sprite_get_yoffset(sprite_hitbox_head);

////////////////////////////////////////////////////////////////////////////
// 1. secondly, deal with any residual movement
////////////////////////////////////////////////////////////////////////////

// starting state
starting = false;

on_ground = tile_collide_at_points(collision_tile_map_id, 
	[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]);

// apply friction
if on_ground {
	if x_direction == 0 && current_state == states.idle {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
	}
	else if current_state == states.attack {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
	}
	else if current_state == states.pain {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
	}
}

// apply gravity
velocity[vel_y] += GRAVITY;

// move and contact tiles!
move_and_contact_tiles(collision_tile_map_id, TILE_SIZE, velocity);

/////////////////////////////////////////////////////////////////////////////
// 3. deal with game stat stuff
/////////////////////////////////////////////////////////////////////////////

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

/////////////////////////////////////////////////////////////////////////////
// 4. lastly, set sprite direction
/////////////////////////////////////////////////////////////////////////////

if current_state == states.idle {
	if x_direction == -1
		image_xscale = -1;
	if x_direction == 1
		image_xscale = 1;
}