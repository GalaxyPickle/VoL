/// @description update light engine

// sunyata lights
var sun_p = sun;
sun = global.sunyata;

if sun != sun_p {
	if global.sunyata {
		pl_option_set_ambience(c_dkgray, .5);
	}
	else pl_option_set_ambience(c_black, .5);
}

pl_update();

if alarm[0] > -1
	exit;