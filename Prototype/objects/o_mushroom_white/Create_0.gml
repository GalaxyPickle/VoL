/// @description set particle colors and props

// Inherit the parent event
event_inherited();

c_start = c_fuchsia;
c_end = c_white;

type = 3;

light_color = c_white;
with lightsource {
	pl_light_set_color(other.light_color);
}