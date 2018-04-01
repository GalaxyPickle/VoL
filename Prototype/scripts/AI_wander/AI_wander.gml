/// @description aimlessly wander...

move = true;
key_jump = false;

if x_direction == 0
	x_direction = 1;

if roll_chance(.0001)
	x_direction = -x_direction;
	
if on_ground && roll_chance(.0001)
	key_jump = true;
else if !on_ground && roll_chance(.90)
	key_jump = true;
	
if !can_jump
	key_jump = false;