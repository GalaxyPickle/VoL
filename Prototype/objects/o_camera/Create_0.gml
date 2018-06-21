/// @description setup

////////////////////////////
// setup
////////////////////////////
camera = camera_create();
// view setup
window_set_size(global.window_width, global.window_height);
surface_resize(application_surface, global.window_width, global.window_height);
display_set_gui_size(global.window_width, global.window_height);
display_reset(0, false);

// set camera view matrices
magic_number = -10;
// less = faster
glide_rate_base = 16;
glide_rate = glide_rate_base;
glide_rate_y = 8;

follow_xscale = 1;
can_pan = true;
alarm[0] = 1;

shake_rate = 5;
shaking = false;

var vm = matrix_build_lookat(
	x, y, magic_number,	// camera 3D pos in space
	x, y, 0,	// camera distance from canvas
	0, 1, 0);	// set the camera to point towards the canvas
var pm = matrix_build_projection_ortho(global.game_width, global.game_height, 1, 9999);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

// set camera into inborn variable
view_camera[0] = camera;

// make camera follow player, otherwise no one
follow = noone;
x_to = x;
y_to = y;

global.view_x = x - global.game_width / 2;
global.view_y = y - global.game_height / 2;

if instance_exists(o_player) {
	x = o_player.x;
	y = o_player.y;
}