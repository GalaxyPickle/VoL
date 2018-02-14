/// @description set debug array text

key_debug = vk_f1;
key_room_restart = vk_f2;
key_godmode = vk_f3;

key_hitbox = ord("H");
key_text = ord("T");

helper_text = 
[
	"F1 - Toggle Debug Info",
	"F2 - Restart Gameroom",
	"F3 - Godmode Toggle",
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
	"*only xbox 360 gamepad supported",
];


debug_message = 
[
	"FPS: " + string(fps),
	"GODMODE: " + (global.godmode ? "ACTIVE" : "INACTIVE"),
];