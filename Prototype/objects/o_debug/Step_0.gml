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

// listener position
l = audio_listener_get_data(0);
debug_message[1] = "Listener Position: " + string( l[? "x"] ) + " " + string( l[? "y"] );
ds_map_destroy(l);