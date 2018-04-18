/// @description r-click stats

// if right mouse clicked show item info
if mouse_check_button_pressed(mb_right) {
	if instance_exists(o_mega_mom) {
		alarm[0] = room_speed * 5;
		show_info = true;
	}
}
		
if show_info {
	var instance = instance_nearest(mouse_x, mouse_y, o_mega_mom);
	with instance {
		var info_list = [
			"object: " + string(object_index),
			"x: " + string(x) + " / " + "y: " + string(y),
			"xscale: " + string(image_xscale) + " / " + "yscale: " + string(image_yscale),
			""
			];
			
		draw_set_font(f_debug);
		for (var i = 0; i < array_length_1d(info_list); i++) {
			draw_text_outline_color(mouse_x, mouse_y + i * 10, info_list[i], 1, c_black, 4, c_yellow, 1);
		}
	}
}