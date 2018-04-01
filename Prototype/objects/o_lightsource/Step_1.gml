/// @description

if !player {
	if instance_exists(o_camera) && 
		abs(distance_to_object(o_camera)) > abs(global.game_width / global.zoom + _pl_radius)
	{
		pl_active = false;
	}
	else
		pl_active = true;	
}