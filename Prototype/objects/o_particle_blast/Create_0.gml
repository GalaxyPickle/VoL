stream = part_system_create()
//part_system_depth(stream,1000)

p_type = part_type_create()
part_type_sprite(stream,pt_shape_square,0,0,1)
part_type_size(stream,0.01,2,0.01,0)
part_type_alpha2(stream,1,0)
part_type_color2(stream,c_white,c_red)

part_type_direction(stream,0,0,0,0)
part_type_speed(stream,5,10,0,0)
part_type_life(stream,60,120)

part_system_automatic_draw(stream,false);

alarm[0] = room_speed;

p_emitter = part_emitter_create(stream);
part_emitter_region(stream, p_emitter, 
	x - camera_get_view_x(view_camera[0]), x - camera_get_view_x(view_camera[0]), 
	y - camera_get_view_y(view_camera[0]), y - camera_get_view_y(view_camera[0]), 
	ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(stream, p_emitter, p_type, 30 + irandom(30));