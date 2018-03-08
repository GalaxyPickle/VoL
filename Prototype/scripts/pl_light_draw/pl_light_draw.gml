/// @description  pl_light_draw()
/// @function  pl_light_draw

if !pl_active
	exit;

// Draw light
draw_surface(_pl_lightSurface, x - _pl_baseRadius - global.view_x, y - _pl_baseRadius - global.view_y);