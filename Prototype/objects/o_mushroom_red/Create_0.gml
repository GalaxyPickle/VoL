/// @description set particle colors and props

// Inherit the parent event
event_inherited();

c_start = c_red;
c_end = c_white;

type = 1;

light_color = c_red;
with lightsource {
	pl_light_set_color(other.light_color);
}