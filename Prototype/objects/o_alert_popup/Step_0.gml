/// @description show stuff

if height < height_max && !shutdown {
	height += 2;
}
else if shutdown && height > 0 {
	height -= 2;
}
else if height == 0 && shutdown {
	instance_destroy();	
}