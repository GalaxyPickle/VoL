/// @description force view check

// make sure we have the first view active
if !view_enabled {
	view_visible[0] = true;
	view_enabled = true;
}

if view_wport[0] != global.window_width || view_hport[0] != global.window_height {
	view_wport[0] = global.window_width;
	view_hport[0] = global.window_height;
}

// make sure the roomspeed is the proper amount
if room_speed != global.game_speed
	room_speed = global.game_speed;

if window_get_width() != global.window_width ||
	window_get_height() != global.window_height
{
	window_set_size(global.window_width, global.window_height);
	surface_resize(application_surface, global.window_width, global.window_height);
	display_set_gui_size(global.window_width, global.window_height);
	display_reset(0, false);
}

application_surface_enable(false);

if surface_get_width(application_surface) != global.window_width ||
	surface_get_height(application_surface) != global.window_height 
{
	surface_resize(application_surface, global.window_width, global.window_height);	
}