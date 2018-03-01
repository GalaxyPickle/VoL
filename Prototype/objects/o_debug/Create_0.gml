/// @description set debug array text

key_debug = vk_f1;
key_room_restart = vk_f2;
key_godmode = vk_f3;

key_hitbox = ord("H");
key_text = ord("T");

if layer_get_visible("layer_tile_collision")
	show_tiles = true;
else show_tiles = false;

helper_text = 
[
	"F1 - Toggle Debug Info",
	"F2 - Restart Gameroom",
	"F3 - Godmode Toggle",
	"",
	"Left Click - Teleport Player",
	"",
	"H - toggle hitboxes",
	"T - toggle text",
	"",
	"Movement: Arrow Keys - Gamepad Joystick",
	"Jump: Key Space - Button A",
	"Attack: Key F - RBumper",
	"Dodge: Key D - Button B",
	"Special: Key S - Button Y",
	"",
];


debug_message = 
[
	"FPS: " + string(fps),
	"GODMODE: " + (global.godmode ? "ACTIVE" : "INACTIVE"),
];