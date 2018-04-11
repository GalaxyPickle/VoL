/// @description set particle colors and props

// Inherit the parent event
event_inherited();

c_start = c_aqua;
c_end = c_white;

type = 0;

light_color = c_blue;
with lightsource {
	pl_light_set_color(other.light_color);
}

if ds_list_find_index(global.active_list, id) != -1 {
	alarm[1] = 3;
}