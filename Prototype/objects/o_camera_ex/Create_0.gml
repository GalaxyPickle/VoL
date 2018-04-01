/// @description  IMPORTANT: Initialize exCamera FIRST, setup Camera next

// initialize the camera here
// check the Step & Global Left Mouse Button event for the Camera Effects

// use a variable to turn camera object following the player object on and off
_follow_object = true;

// initialize exCamera first (must be called before any ex_camera_* functions are used!)
ex_camera_initialize();

// turn on debug messages (note: this can impact performance! turn it off if you don't need it!)
ex_camera_set_debug_mode(false);


// create a camera

// test: normal (limit bounds)
ex_camera_create("main", 0, 1000, 1000, global.window_width, global.game_height, 0, 0, 0, 100, 
	self, true, 0, 0, room_width, room_height);

// test: normal (no limit bounds)
//ex_camera_create("main", 0, 0, 0, 1280, 720, 0, 0, 0, 100, obj_ex_camera_demo_camera, false);

// test: normal (limit bounds and zoom)
//ex_camera_create("main", 0, 0, 0, 1280, 720, 0, 0, 0, 80, obj_ex_camera_demo_camera, true);

// test: normal (no limit bounds and zoom)
//ex_camera_create("main", 0, 0, 0, 1280, 720, 0, 0, 0, 70, obj_ex_camera_demo_camera, false);

// test: normal (limit bounds and not focused on any object)
//ex_camera_create("main", 0, 0, 0, 1280, 720, 0, 0, 0, 100, noone, true);

// test: normal (no limit bounds and not focused on any object)
//ex_camera_create("main", 0, 0, 0, 1280, 720, 0, 0, 0, 100, noone, false);



