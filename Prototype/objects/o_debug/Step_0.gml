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

// hitboxes
if show_tiles == false {
	if global.hitboxes {
		layer_set_visible("layer_tile_collision", true);
		layer_set_visible("layer_tile_platform", true);
	}
	else {
		layer_set_visible("layer_tile_collision", false);
		layer_set_visible("layer_tile_platform", false);
	}
}

if global.godmode {
	global.ability_discharge = true;
	global.ability_ascension = true;
	global.ability_whirlwind = true;
	global.ability_cracked = true;
}

// update debug values
debug_message = 
[
	"FPS: " + string(fps),
	"APP SURF: " + string( application_surface_is_enabled() ? "true" : "false"),
	"GODMODE: " + (global.godmode ? "active" : "inactive"),
	"COMBO: " + string(global.combo),
	"",
	"Camera view y: " + string(instance_exists(o_camera) ? o_camera.y - global.game_height : 666),
	"Camera view x: " + string(instance_exists(o_camera) ? o_camera.x - global.game_width : 666),
	"",
	"Gamepad: " + (gamepad_is_connected(0) ? "connected" : "disconnected"),
	"",
	"Mushrooms: " + string(global.mushrooms),
	"",
	"Gates: <not implemented yet>",
	"",
	"Glyph Intro: " + string(global.glyph_intro),
	"Glyph Sundering: " + string(global.glyph_sundering),
	"",
	"Discharge: " + string(global.ability_discharge),
	"Ascension: " + string(global.ability_ascension),
	"Whirlwind: " + string(global.ability_whirlwind),
	"Cracked: " + string(global.ability_cracked),
	"",
];


// mouse click teleport player
if instance_exists(o_player) {
	if mouse_check_button_pressed(mb_left) {
		o_player.x = mouse_x;
		o_player.y = mouse_y;
	}
}