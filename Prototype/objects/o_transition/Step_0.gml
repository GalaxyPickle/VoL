/// @description ready to show

if image_index >= image_number - 1 {
	
	image_speed = 0;
	timer++;
	if timer > 40 {
		image_speed = -s_speed;
		timer = 0;
	}
}

if sign(image_speed) == -1 && round(image_index) == 0 {
	instance_destroy();
}