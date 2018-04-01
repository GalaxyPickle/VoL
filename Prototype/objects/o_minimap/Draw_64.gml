/// @desc draw minimap to screen

if !surface_exists(map_surf) { map_surf = surface_create(200, 200); }

surface_set_target(map_surf);

draw_clear(c_black);  //or whatever background you want for the map

//d3d_set_projection_ortho(0,0,room_width,room_height,0);  //set projection to whole room
matrix_build_projection_ortho(room_width, room_height, 0, 999999);

var _scale = room_height / 200;  //calculate scale of icons

//with (obj_thing) { draw_sprite_ext(my_map_icon,0,x,y,_scale,_scale,0,c_white,1); }  //draw map icons

surface_reset_target();

draw_surface(map_surf, 100, 100);  //the map surface can be drawn anywere on the screen.