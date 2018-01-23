/// @description init camera and game view

///////////////////////////////////////////////////
// CAMERA & SURFACE
///////////////////////////////////////////////

// smooth panning rate in pixels per frame (smaller is faster)
#macro CAMERA_GLIDE_RATE 5

if surface_exists(application_surface) {
	surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
	//application_surface_enable(false);
}
/*

// set window to center of screen of computer
var moniter_size_w = display_get_width();
var moniter_size_h = display_get_height();

window_set_position(
	moniter_size_w / 2 - WINDOW_WIDTH / 2,
	moniter_size_h / 2 - WINDOW_HEIGHT / 2
	);

///////////////////////////////////////////////
// VIEWPORT
/////////////////////////////////////////////

// first off, set the viewport to working
if !view_enabled {
	view_visible[0] = true;
	view_enabled = true;
}

// set view to uppper left corner of window
view_xport[0] = 0;
view_yport[0] = 0;

// then set view to proper size
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);