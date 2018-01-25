/// @description force view check

// make sure we have the first view active
if !view_enabled {
	view_visible[0] = true;
	view_enabled = true;
}

// make sure the roomspeed is 60
if room_speed != ROOM_SPEED
	room_speed = ROOM_SPEED

if window_get_width() != WINDOW_WIDTH &&
	window_get_height() != WINDOW_HEIGHT &&
	!window_get_fullscreen()
{
	window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
	surface_resize(application_surface, WINDOW_WIDTH, WINDOW_HEIGHT);
	display_set_gui_size(WINDOW_WIDTH, WINDOW_HEIGHT);
	display_reset(0, false);
}