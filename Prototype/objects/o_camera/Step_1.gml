/// @description force view check

// make sure we have the first view active
if !view_enabled {
	view_visible[0] = true;
	view_enabled = true;
}

if view_wport[0] != WINDOW_WIDTH || view_hport[0] != WINDOW_HEIGHT {
	view_wport[0] = WINDOW_WIDTH;
	view_hport[0] = WINDOW_HEIGHT;
}

// make sure the roomspeed is the proper amount
if room_speed != ROOM_SPEED
	room_speed = ROOM_SPEED

if window_get_width() != WINDOW_WIDTH ||
	window_get_height() != WINDOW_HEIGHT
{
	window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
	surface_resize(application_surface, WINDOW_WIDTH, WINDOW_HEIGHT);
	display_set_gui_size(WINDOW_WIDTH, WINDOW_HEIGHT);
	display_reset(0, false);
}