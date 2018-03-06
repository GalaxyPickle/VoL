/// @description 

if global.sunyata {
	depth = -100;
	with lightsource {
		pl_light_set_radius(global.game_width / 2);
		pl_active = false;
	}
	outline_start(1, c_aqua, sprite_index, 4);
	draw_self();
	outline_end();
}
else {
	depth = layer_get_depth(layer_get_id("layer_instance_player"));
	with lightsource {
		_pl_baseRadius = 300;
		pl_active = true;
	}
	outline_start(1, outline_color, sprite_index, 4);
	draw_self();
	outline_end();
}