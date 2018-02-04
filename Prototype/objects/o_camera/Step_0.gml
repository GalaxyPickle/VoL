/// @description smooth movement follow player

// smooth camera glide to follow (default player) pos
if follow == noone
	follow = instance_exists(o_player) ? o_player : noone;
else {
	// camera shake when player is hit
	if follow.current_state == states.pain
		shaking = true;	
	else shaking = false;
}

if !shaking {
	x += (x_to - x) / glide_rate;
	y += (y_to - y) / glide_rate;

	if (follow != noone) {
		// set camera to follow player
		x_to = follow.x;
		y_to = follow.y;
	}
}
else {
   x = follow.x + irandom_range(-shake_rate, shake_rate);
   y = follow.y + irandom_range(-shake_rate, shake_rate);
}

// update matrix for camera
var vm = matrix_build_lookat(
	x, y, magic_number,	// camera 3D pos in space
	x, y, 0,	// camera distance from canvas
	0, 1, 0);	// set the camera to point towards the canvas
	
camera_set_view_mat(camera, vm);

// set sound listener to be at camera position
audio_listener_position(x, y, 0);

// apply parallax effect for all bg layers
parallax_all_bg();