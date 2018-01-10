/// @description setup

////////////////////////////
// setup

camera = camera_create();

// set camera view matrices
magic_number = -10;

var vm = matrix_build_lookat(
	x, y, magic_number,	// camera 3D pos in space
	x, y, 0,	// camera distance from canvas
	0, 1, 0);	// set the camera to point towards the canvas
var pm = matrix_build_projection_ortho(GAME_WIDTH, GAME_HEIGHT, 1, 9999);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

// set camera into inborn variable
view_camera[0] = camera;

// make camera follow player, otherwise no one
follow = instance_exists(o_player) ? o_player : noone;
x_to = x;
y_to = y;