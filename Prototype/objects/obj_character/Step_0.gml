/// @description MOVEMENT
if (point_distance(x,y,mouse_x,mouse_y) > 100)
{
	//Not necessary, just to show case the sprite in movement
	var pd = point_direction(x, y, mouse_x, mouse_y);
	var dd = angle_difference(direction, pd);
	direction -= min(abs(dd), 3) * sign(dd);

	x += lengthdir_x( 1, direction);
	y += lengthdir_y( 1, direction);
	
	image_angle = direction - 90;
}

if mouse_check_button_pressed(mb_right)
v_cor = make_color_rgb( random(255), random(255), random(255));