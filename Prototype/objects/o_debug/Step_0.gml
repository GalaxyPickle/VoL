/// @description debug overlay buttons

if keyboard_check_pressed(vk_f1) {
	global.debug = !global.debug;
}

if global.debug {
	show_debug_overlay(true);
}
else {
	show_debug_overlay(false);	
}

if keyboard_check_pressed(vk_f2) {
	room_restart();	
}

// update debug values
debug_message[0] = "FPS: " + string(fps);

nearest_enemy = instance_nearest(p.x, p.y, enemy);
debug_message[1] = "enemy: " + string(nearest_enemy.x) + ", " + string(nearest_enemy.y);