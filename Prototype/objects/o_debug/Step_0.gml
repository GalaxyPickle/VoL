/// @description debug overlay buttons

// debug toggle buttons
if keyboard_check_pressed(key_debug) {
	global.debug = !global.debug;
}
if keyboard_check_pressed(key_room_restart) {
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
		layer_set_visible("layer_tile_ghost_collision", true);
		layer_set_visible("layer_tile_ghost_platform", true);
	}
	else {
		layer_set_visible("layer_tile_collision", false);
		layer_set_visible("layer_tile_platform", false);
		layer_set_visible("layer_tile_ghost_collision", false);
		layer_set_visible("layer_tile_ghost_platform", false);
	}
}

if global.godmode {
	global.ability_discharge = true;
	global.ability_ascension = true;
	global.ability_whirlwind = true;
	global.ability_cracked = true;
}

var lights = 0;
var active_lights = 0;

// for every instance in the room of the current enemy...
if instance_exists(o_lightsource) {
	for (var j = 0; j < instance_number(o_lightsource); j++) {
		
		// if the enemy is in range, add it to my nearest_enemy array
		var light = instance_find(o_lightsource, j);
		if light.pl_active
			active_lights++;
			
		lights++;
	}
}

// update debug values
debug_message = 
[
	"FPS: " + string(fps),
	"Lights: " + string(lights) + " / Active: " + string(active_lights),
	"Room: " + string(room) + " / " + room_get_name(room),
	//"DT: " + string(alarm[0]),
	//"Time: " + string(current_time),
	//"Delta Time: " + string(delta_time),
	"",
	"GODMODE: " + (global.godmode ? "active" : "inactive"),
	"COMBO: " + string(global.combo),
	"",
	"Camera view y: " + string(global.view_y),
	"Camera view x: " + string(global.view_x),
	"",
	"Gamepad: " + (gamepad_is_connected(0) ? "connected" : "disconnected"),
	"",
	"Glyph Intro: " + string(global.glyph_intro),
	"Glyph Sundering: " + string(global.glyph_sundering),
	"",
];

// mouse click teleport player
if instance_exists(o_player) {
	if mouse_check_button_pressed(mb_left) {
		o_player.x = mouse_x;
		o_player.y = mouse_y;
	}
}