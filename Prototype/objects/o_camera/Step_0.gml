/// @description smooth movement follow player

// smooth camera glide to follow (default player) pos
x += (x_to - x) / glide_rate;
y += (y_to - y) / glide_rate;

if (follow != noone) {
	// set camera to follow player
	x_to = follow.x;
	y_to = follow.y;
}

// update matrix for camera
var vm = matrix_build_lookat(
	x, y, magic_number,	// camera 3D pos in space
	x, y, 0,	// camera distance from canvas
	0, 1, 0);	// set the camera to point towards the canvas
	
camera_set_view_mat(camera, vm);

// set sound listener to be at camera position
audio_listener_position(x, y, 0);