/// @description set debug array text

key_debug = vk_f1;
key_room_restart = vk_f2;
key_hitbox = ord("H");
key_text = ord("T");

helper_text[0] = "F1 - show debug info";
helper_text[1] = "F2 - restart the gameroom";
helper_text[2] = "H - toggle hitboxes"
helper_text[3] = "T - toggle text"
helper_text[4] = "Player controls: Arrows to move & jump";


debug_message[0] = "FPS: " + string(fps);