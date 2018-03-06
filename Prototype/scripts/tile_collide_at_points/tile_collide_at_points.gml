///tile_collide_at_points

///@credit HeartBeast (https://www.youtube.com/watch?v=YObbsg2Hbcw)

///@param tile_map_id
///@param collision_point_arrays (x, y positions to check for collision)

var tile_map_id = argument[0];
var point_arrays = argument[1];

// Found variable
var found = false;

// for the point arrays
var vector2_x = 0;
var vector2_y = 1;

// Loop through the points and check for a tile
for (var i = 0; i < array_length_1d(point_arrays); i++) {
	var point = point_arrays[i];
	found = found || tilemap_get_at_pixel(tile_map_id, point[vector2_x], point[vector2_y]);
}

// return found
return found; 
