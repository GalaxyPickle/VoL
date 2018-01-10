/// @description called every player step, mother function to call all player step functions

//////////////////////////////////////////////////////////////////////////////
// 1. get direction
//////////////////////////////////////////////////////////////////////////////

// direction
x_direction = keyboard_check(key_right) - keyboard_check(key_left);

var vel_x = 0, vel_y = 1;

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