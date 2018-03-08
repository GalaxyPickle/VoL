/// @description lightsource size

with lightsource {
	_pl_baseRadius = radius;
	_pl_radius = radius;
}

if radius > 250 || radius < 100
	grow = !grow;
	
if grow
	radius += .05;
else radius -= .05;

if !activated && place_meeting(x, y, global.player) {
	activated = true;
	with lightsource _pl_color = c_lime;
}