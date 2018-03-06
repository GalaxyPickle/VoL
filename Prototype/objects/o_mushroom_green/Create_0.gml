/// @description set particle colors and props

// Inherit the parent event
event_inherited();

c_start = c_lime;
c_end = c_white;

type = 2;

light_color = c_lime;
with lightsource {
	pl_light_set_color(other.light_color);
}