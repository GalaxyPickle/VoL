/// @description track camera pos

if instance_exists(o_camera) {
	camera_x = o_camera.x - global.window_width / 2;
	camera_y = o_camera.y - global.window_height / 2;
}
else {
	camera_x = 0;
	camera_y = 0;
}

camera_width = global.window_width;
camera_height = global.window_height;