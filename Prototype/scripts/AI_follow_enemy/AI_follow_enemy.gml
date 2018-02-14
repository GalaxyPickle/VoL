/// @description just follows the player including jumps

var goal = AI_goal_object;
////////////////////////////////
// face player
////////////////////////////////
move = true

if distance_to_point(goal.x, y) < attack_range {
	move = false;	
}

// X
// face the goal object always 
if AI_goal_object.x < x
	x_direction = -1;
else if AI_goal_object.x > x
	x_direction = 1;

// Y

// JUMPing and following player
if goal.y + attack_range / 2 < y
	key_jump = true;
	
// stop holding down the jump key when you get above the player's level
if !on_ground && goal.y - attack_range > y
	key_jump = false;
					
// if I am stuck against a small wall and getting nowhere
if on_wall_bottom_left || on_wall_bottom_right {
	key_jump = true;	
}