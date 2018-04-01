/// @description run away???

move = true;

// X
// run away!!!
if AI_goal_object.x < x
	x_direction = 1;
else if AI_goal_object.x > x
	x_direction = -1;
	
if on_wall_bottom_left || on_wall_bottom_right {
	key_jump = true;
}
else key_jump = false;

if on_wall_left || on_wall_right
	key_jump = false;

if on_wall_left
	x_direction = 1;
else if on_wall_right
	x_direction = -1;