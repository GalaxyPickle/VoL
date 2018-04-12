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