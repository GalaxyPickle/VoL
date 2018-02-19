/// @description debug overlay buttons

// debug toggle buttons
if keyboard_check_pressed(key_debug) {
	global.debug = !global.debug;
}
if keyboard_check_pressed(key_room_restart) {
	score = 0;
	audio_stop_all();
	room_restart();
}
if keyboard_check_pressed(key_godmode) {
	global.godmode = !global.godmode;
}

// debug hitbox and stats
if keyboard_check_pressed(key_hitbox) {
	global.hitboxes = !global.hitboxes;
}
if keyboard_check_pressed(key_text) {
	global.text = !global.text;
}

// show debug overlay
if global.debug {
	show_debug_overlay(true);
}
else {
	show_debug_overlay(false);
}

// update debug values
debug_message = 
[
	"FPS: " + string(fps),
	"GODMODE: " + (global.godmode ? "active" : "inactive"),
	"Camera view y: " + string(o_camera.y - global.game_height),
	"Camera view x: " + string(o_camera.x - global.game_width),
	"",
	"Gamepad: " + (gamepad_is_connected(0) ? "connected" : "disconnected"),
];


// mouse click teleport player
if instance_exists(o_player) {
	if mouse_check_button_pressed(mb_left) {
		o_player.x = mouse_x;
		o_player.y = mouse_y;
	}
}