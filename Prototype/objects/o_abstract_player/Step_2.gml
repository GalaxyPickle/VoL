/// @description sunyata draw setup

// Inherit the parent event
event_inherited();

// special draw mode
if !global.sunyata && !changed {
	
	with lightsource {
		_pl_baseRadius = 300;
		pl_active = true;
	}
	changed = true;
}

if !global.sunyata
	exit;

///////////////////////////////////////
// sunyata mode
///////////////////////////////////////

if !changed {
	with lightsource {
		pl_active = false;
	}
	changed = true;
}

// setup surface
if !surface_exists(global.player_surface)
	global.player_surface = surface_create(global.window_width, global.window_height);
	
surface_set_target(global.player_surface);

// draw the player
outline_start(1, c_aqua, sprite_index, 4);
draw_sprite_ext(sprite_index, image_index, (x - global.view_x) * 2, (y - global.view_y) * 2, 
	image_xscale * 2, image_yscale * 2, 0, c_white, .5);
outline_end();

surface_reset_target();

