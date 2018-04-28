/// @description show stuff

if alarm[0] > max_a - room_speed {
	alpha += .02;
}
else if alarm[0] < room_speed {
	shutdown = true;
	alpha -= .02;	
}
else alpha = 1;

if height < height_max && !shutdown {
	height += 2;
}
else if height > 0 && shutdown {
	height -= 2;
}