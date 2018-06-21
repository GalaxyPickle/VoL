/// @description setup vars

event_inherited();
interact_text = "Enter";

//////////////////////////////
// transition to room
//////////////////////////////

fade = false;
spawn = false;
counter = -1;
s_width = sprite_get_width(s_transition);
width = global.window_width / s_width;
height = global.window_height / s_width;
timer = 1;

music_playing = false;

//////////////////////////////
// opening door
//////////////////////////////

alarm[0] = room_speed / 10;
alarm[1] = room_speed / 6;
keys = [];
lock = noone;
gate = 0;
ready = true;

goto_room = room;
goto_position = [64, 64];

open = false;
opening = false;
finished_opening = false;