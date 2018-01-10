/// @description set debug array text

key_debug = vk_f1;
key_room_restart = vk_f2;
key_hitbox = ord("H");
key_text = ord("T");

helper_text[0] = "F1 to show debug info";
helper_text[1] = "F2 to restart the gameroom";
helper_text[2] = "Player controls: Arrows to move & jump";


debug_message[0] = "FPS: " + string(fps);

p = instance_exists(o_player) ? o_player : noone;
enemy = instance_exists(o_reptilian_large) ? o_reptilian_large : noone;
nearest_enemy = instance_nearest(p.x, p.y, enemy);

debug_message[1] = "enemy: " + string(nearest_enemy.x) + "," + string(nearest_enemy.y);