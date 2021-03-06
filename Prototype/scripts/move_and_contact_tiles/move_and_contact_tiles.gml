///move_and_contact_tiles

///@credit HeartBeast (https://www.youtube.com/watch?v=YObbsg2Hbcw)

///@param tile_map_id
///@param tile_size
///@param velocity_array

var tile_map_id = argument0;
var tile_size = argument1;
var velocity = argument2;

// For the velocity array
var vector2_x = 0;
var vector2_y = 1;

// Move horizontally
x += velocity[vector2_x];

// L/R COLLISION
// grab height of sprite and mark into units of TILE_SIZE - 1 (31) or less
// EX: height is 100. \31 = 3 (integer division).
var bbox_unit_count_height = abs(bbox_top - bbox_bottom-1) / (tile_size-1);
// check for collisions at every point along height 25 px from the last.

// Right collisions
if velocity[vector2_x] > 0 {
	
	// now make array of all collision points to be tested
	var bbox_right_points = [];
	for (var i = 0; i < bbox_unit_count_height; i++) {
		bbox_right_points[i] = [bbox_right-1, bbox_top+1 + i * tile_size-1];
	}
	bbox_right_points[array_length_1d(bbox_right_points)] = [bbox_right-1, bbox_bottom-1];
	
	var tile_right = tile_collide_at_points(tile_map_id, bbox_right_points);
	if tile_right {
		x = bbox_right & ~(tile_size-1);
		x -= bbox_right-x;
		velocity[@ vector2_x] = 0;
	}
} // Left collisions
else {
	
	// make array for left side and evaluate likewise
	var bbox_left_points = [];
	for (var i = 0; i < bbox_unit_count_height; i++) {
		bbox_left_points[i] = [bbox_left, bbox_top+1 + i * tile_size-1];
	}
	bbox_left_points[array_length_1d(bbox_left_points)] = [bbox_left, bbox_bottom-1];
	
	var tile_left = tile_collide_at_points(tile_map_id, bbox_left_points);
	if tile_left {
		x = bbox_left & ~(tile_size-1);
		x += tile_size+x-bbox_left;
		velocity[@ vector2_x] = 0;
	}
}

// Move vertically
y += velocity[vector2_y];

// vertical bbox unit count for width
var bbox_unit_count_width = abs(bbox_left - bbox_right-1) / (tile_size-1);

// Vertical collisions
// Falling
if velocity[vector2_y] > 0 {
	
	var bbox_down_points = [];
	for (var i = 0; i < bbox_unit_count_width; i++) {
		bbox_down_points[i] = [bbox_left+1 + i * tile_size-1, bbox_bottom-1];
	}
	bbox_down_points[array_length_1d(bbox_down_points)] = [bbox_right-1, bbox_bottom-1];
	
	var tile_bottom = tile_collide_at_points(tile_map_id, bbox_down_points);
	if tile_bottom {
		y = bbox_bottom & ~(tile_size-1);
		y -= bbox_bottom-y;
		velocity[@ vector2_y] = 0;
	}
} // Jumping
else {
	
	var bbox_up_points = [];
	for (var i = 0; i < bbox_unit_count_width; i++) {
		bbox_up_points[i] = [bbox_left+1 + i * tile_size-1, bbox_top];
	}
	bbox_up_points[array_length_1d(bbox_up_points)] = [bbox_right-1, bbox_top];
	
	var tile_top = tile_collide_at_points(tile_map_id, bbox_up_points);
	if tile_top {
		y = bbox_top & ~(tile_size-1);
		y += tile_size+y-bbox_top;
		velocity[@ vector2_y] = 0;
	}
}
