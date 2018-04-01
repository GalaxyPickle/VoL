/// @description checks if a triangle is in a rectangle!!

/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3

/// @param sx1
/// @param sy1
/// @param sx2
/// @param sy2

var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];
var x3 = argument[4];
var y3 = argument[5];

var sx1 = argument[6];
var sy1 = argument[7];
var sx2 = argument[8];
var sy2 = argument[9];

// checks all the points of the triangle to see if any of them are in the rectangle
// todo if collisions aren't reliable is to also check midpoint of each line of the triangle
if point_in_rectangle(x1, y1, sx1, sy1, sx2, sy2) ||
	point_in_rectangle(x2, y2, sx1, sy1, sx2, sy2) ||
	point_in_rectangle(x3, y3, sx1, sy1, sx2, sy2) ||
	rectangle_in_triangle(sx1, sy1, sx2, sy2, x1, y1, x2, y2, x3, y3)
	
	return true;
else
	return false;