/// @description debug overlay buttons

if keyboard_check_pressed(key_start_debug) {
	global.test = true;
}

if keyboard_check_pressed(key_goto_boss) && global.test {
	audio_stop_all();
	room_goto(r_boss_room);
	global.player.x = 1000;
	global.player.y = 400;
	exit;
}

// debug toggle buttons
if keyboard_check_pressed(key_debug) {
	global.debug = !global.debug;
}
if keyboard_check_pressed(key_room_restart) && global.test {
	audio_stop_all();
	room_restart();
}
if keyboard_check_pressed(key_godmode) && global.test {
	global.godmode = !global.godmode;
}

// debug hitbox and stats
if keyboard_check_pressed(key_hitbox) && global.test {
	global.hitboxes = !global.hitboxes;
}
if keyboard_check_pressed(key_text) && global.test {
	global.text = !global.text;
}

// show debug overlay
if global.debug {
	show_debug_overlay(true);
}
else {
	show_debug_overlay(false);
}

// hitboxes show only if "H" toggled
if show_tiles == false {
	
	var hidden_tiles = 
	[
		"layer_tile_collision",
		"layer_tile_platform",
		"layer_tile_sound",
		"layer_tile_ghost_collision",
		"layer_tile_ghost_platform",
		"layer_tile_normal_collision",
		"layer_tile_normal_platform",
		"layer_tile_danger_ghost"
	];
	
	if global.hitboxes {
		for (var i = 0; i < array_length_1d(hidden_tiles); i++) {
			layer_set_visible(hidden_tiles[i], true);	
		}
	}
	else {
		for (var i = 0; i < array_length_1d(hidden_tiles); i++) {
			layer_set_visible(hidden_tiles[i], false);	
		}
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
	"",
	"GODMODE: " + (global.godmode ? "active" : "inactive"),
	"COMBO: " + string(global.combo),
	"",
	"Camera view y: " + string(global.view_y),
	"Camera view x: " + string(global.view_x),
	"",
	"Gamepad: " + (gamepad_is_connected(0) ? "connected" : "disconnected"),
	"",
];

// mouse click teleport player
if instance_exists(o_player) && global.test {
	if mouse_check_button_pressed(mb_left) {
		o_player.x = mouse_x;
		o_player.y = mouse_y;
	}
}