/// @description called every player step, mother function to call all player step functions

//////////////////////////
// hitbox vars
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

//////////////////////////////////////////////////////////////////////////////
// 1. get direction
//////////////////////////////////////////////////////////////////////////////

// direction
if !enemy
	x_direction = keyboard_check(key_right) - keyboard_check(key_left);
else
	x_direction = key_right - key_left;

////////////////////////////////////////////////////////////////////////////
// 2. secondly, deal with any residual movement
///////////////////////////////////////////////////////////////////////////

on_ground = tile_collide_at_points(collision_tile_map_id, 
	[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]);

// apply friction
if x_direction == 0 &&
	(current_state == states.idle || current_state == states.patrol ||
	current_state == states.follow || current_state == states.flee) {
	velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
}
else if (current_state == states.attack) {
	velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
}

// apply gravity
velocity[vel_y] += GRAVITY;

// move and contact tiles!
move_and_contact_tiles(collision_tile_map_id, TILE_SIZE, velocity);

/////////////////////////////////////////////////////////////////////////////
// 3. deal with game stat stuff
/////////////////////////////////////////////////////////////////////////////

stat_array = [health_, stamina_, poise_, special_];

for (var i = 0; i < array_length_1d(stat_array); i++) {
	
	var current = stat_array[@ i];
	if current[@ 2] < current[@ 3]	// if current (ex) health is less than max health
		current[@ 2] += current[@ 4];	// regen
}

/////////////////////////////////////////////////////////////////////////////
// 4. lastly, set sprite direction
/////////////////////////////////////////////////////////////////////////////

if current_state == states.idle || current_state == states.patrol ||
	current_state == states.follow || current_state == states.flee {
	if x_direction == -1
		image_xscale = -1;
	if x_direction == 1
		image_xscale = 1;
}