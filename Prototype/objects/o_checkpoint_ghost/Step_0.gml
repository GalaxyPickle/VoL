/// @description lightsource size

if !activated && place_meeting(x, y, global.player) {
	activated = true;
}

if global.sunyata {
	//visible = true;
	// start particles
	// draw it only in ghost mode
	surface_set_target(global.ghost_surface);
	
	//part_system_drawit(global.ps_ghost);
	draw_sprite(sprite_index, 0, (x - global.view_x), (y - global.view_y));
	
	surface_reset_target();
}
else {
	//part_system_automatic_draw(global.ps_ghost, false);
	visible = false;
}