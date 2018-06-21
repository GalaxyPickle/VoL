/// @description heck yeah

event_inherited();
interact_text = "Activate";

text = "Gem of Power Activated";

// gen
activated = false;
type = 0;

goto = [x, y];

// light
radius = 800;
color = c_white;

// particles
c_start = c_white;
c_end = c_white;

alarm[0] = 1;

within_range = false;
sight_range = 30;

// CHECK IF ACTIVATED YOOOOOO
if check_if_activated() {
	alarm[1] = 1;
	activated = true;
}