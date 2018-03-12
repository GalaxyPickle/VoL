/// @description check for keys activated

// start opening when player presses open
if distance_to_object(o_player < 1) && !opening && !open && ready && 
	( keyboard_check_pressed(global.key_interact) ||
	gamepad_button_check_pressed(0, global.gp_key_interact) )
	
	opening = true;

if opening && !open {
	image_speed = 1;
	
	if image_index == image_number - 1
		open = true;
}

// if open, keep open with the sprite
if open {
	image_index = image_number - 1
}