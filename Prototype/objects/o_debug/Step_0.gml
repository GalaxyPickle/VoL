/// @description debug overlay buttons

if keyboard_check_pressed(key_debug) {
	global.debug = !global.debug;
}
if keyboard_check_pressed(key_room_restart) {
	room_restart();	
}
if keyboard_check_pressed(key_hitbox) {
	global.hitboxes = !global.hitboxes;
}
if keyboard_check_pressed(key_text) {
	global.text = !global.text;	
}

if global.debug {
	show_debug_overlay(true);
}
else {
	show_debug_overlay(false);	
}

// update debug values
debug_message[0] = "FPS: " + string(fps);

nearest_enemy = instance_nearest(p.x, p.y, enemy);
debug_message[1] = "enemy X: " + string(nearest_enemy.x) + " enemy Y: " + string(nearest_enemy.y);