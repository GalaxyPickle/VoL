/// @description sunyata stuff

if keyboard_check(ord("Q")) var_radial_blur_offset += 0.01;
if keyboard_check(ord("A")) var_radial_blur_offset -= 0.01;

if keyboard_check(ord("W")) var_radial_brightness += 0.01;
if keyboard_check(ord("S")) var_radial_brightness -= 0.01;

var_time_var+=0.04;

////////////////////////////////////

var sun_p = sun;
sun = global.sunyata;

if sun != sun_p {
	var ids = layer_get_all();
	
	if !global.sunyata {
		for (var i = 0; i < array_length_1d(ids); i++) { 
			layer_set_visible(ids[i], true);
		}
		layer_set_visible(layer_get_id("layer_tile_ghost_base"), false);
		layer_set_visible(layer_get_id("layer_tile_ghost_base_top"), false);
		exit;
	}
	else {
		for (var i = 0; i < array_length_1d(ids); i++) { 
			//layer_set_visible(ids[i], false);
		}
		layer_set_visible(layer_get_id("layer_instance_player"), true);
		//layer_set_visible(layer_get_id("layer_instance_lights"), true);
		layer_set_visible(layer_get_id("layer_instance_particles"), true);
		//layer_set_visible(layer_get_id("layer_instance_between"), true);
		layer_set_visible(layer_get_id("layer_instance_NPC"), true);
		layer_set_visible(layer_get_id("layer_instance_helper"), true);
		layer_set_visible(layer_get_id("layer_instance_top"), true);
	}
}

// sunyata is active!
if !surface_exists(global.ghost_surface)
	global.ghost_surface = surface_create(global.game_width, global.game_height);

surface_set_target(global.ghost_surface);
draw_clear_alpha(c_black, 0);

/*
var xx = (global.player.x - global.view_x) * 2;
var yy = (global.player.y - global.view_y) * 2;

shader_set(shd_radial_blur);
    shader_set_uniform_f(uni_time, var_time_var);
    shader_set_uniform_f(uni_mouse_pos, xx, yy);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_radial_blur_offset, var_radial_blur_offset);
    shader_set_uniform_f(uni_radial_brightness, var_radial_brightness);
*/
var ghost_id = layer_tilemap_get_id(layer_get_id("layer_tile_ghost_base"));
var ghost_id_2 = layer_tilemap_get_id(layer_get_id("layer_tile_ghost_base_top"));

draw_tilemap(ghost_id, -global.view_x, -global.view_y);
draw_tilemap(ghost_id_2, -global.view_x, -global.view_y);

//shader_reset();

/*
draw_text(0,0,string_hash_to_newline("Real FPS: "+string(fps_real)));
draw_text(0,12,string_hash_to_newline("Blur offset (Q & A to adjust): "+string(var_radial_blur_offset)));
draw_text(0,24,string_hash_to_newline("Blur brightness (E & D to adjust): "+string(var_radial_brightness)));

draw_text(0,60,string_hash_to_newline("Spacebar to toggle shader"));
draw_text(0,72,string_hash_to_newline("Shift key to toggle fullscreen or sprite only"));
draw_text(0,84,string_hash_to_newline("Escape key to exit"));
*/

surface_reset_target()