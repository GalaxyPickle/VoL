/// @description see if my current attack hits enemy passed in

/// @param o_enemy
var enemy = argument[0];

var sweetspot = false;
var headshot = false;
var found = false;

if array_length_1d(current_point_array) < 1
	exit;

// get array of triangle points from preset data
var a = current_point_array[ floor(image_index) ];

if array_length_1d(a) < 1
	exit;
	
var basic = a[0];
var b = a[1];
			
// direction
var d = image_xscale;
		
// 1. check for collision with basic attack vs hitbox of enemy
if triangle_in_rectangle(
	x + d * basic[0], y + basic[1],
	x + d * basic[2], y + basic[3],
	x + d * basic[4], y + basic[5],
	enemy.hitbox_left, 
	enemy.hitbox_top,
	enemy.hitbox_right, 
	enemy.hitbox_bottom)	
{
	sweetspot = false;
	headshot = false;
	found = true;
}
		
// 2. check for collision with sweet spot vs hitbox of enemy
else if array_length_1d(b) > 0 {
				
	// iterate through all sweet-spot triangles in array and check for collision
	for (var i = 0; i < array_length_1d(b); i++) {
		var sweet = b[i];
				
		if triangle_in_rectangle(
			x + d * sweet[0], y + sweet[1],
			x + d * sweet[2], y + sweet[3],
			x + d * sweet[4], y + sweet[5],
			enemy.hitbox_left, 
			enemy.hitbox_top,
			enemy.hitbox_right, 
			enemy.hitbox_bottom)
		{
			sweetspot = true;
			headshot = false;
			found = true;
		}
	}	
}
if !found {
		
	// 3. check for collisions with basic attack vs headbox of enemy
	if triangle_in_rectangle(
		x + d * basic[0], y + basic[1],
		x + d * basic[2], y + basic[3],
		x + d * basic[4], y + basic[5],
		enemy.hitbox_head_left, 
		enemy.hitbox_head_top,
		enemy.hitbox_head_right, 
		enemy.hitbox_head_bottom)
	{
		sweetspot = false;
		headshot = true;
		found = true;
	}
	// 4. check for collisions with sweet spot vs headbox of enemy
	else if array_length_1d(b) > 0 {
				
		// iterate through all sweet-spot triangles in array and check for collision
		for (var i = 0; i < array_length_1d(b); i++) {
			var sweet = b[i];
				
			if triangle_in_rectangle(
				x + d * sweet[0], y + sweet[1],
				x + d * sweet[2], y + sweet[3],
				x + d * sweet[4], y + sweet[5],
				enemy.hitbox_head_left, 
				enemy.hitbox_head_top,
				enemy.hitbox_head_right, 
				enemy.hitbox_head_bottom)
			{
				sweetspot = true;
				headshot = true;
				found = true;
			}
		}	
	}
}

return [found, sweetspot, headshot];