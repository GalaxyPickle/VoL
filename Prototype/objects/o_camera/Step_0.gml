/// @description smooth movement follow player

// smooth follow player
#region
var can_follow_left = true;
var can_follow_right = true;
var can_follow_up = true;
var can_follow_down = true;

// smooth camera glide to follow (default player) pos
if follow == noone
	follow = instance_exists(o_player) ? o_player : noone;
else {
	// camera shake when player is hit
	if follow.current_state == states.pain {
		shaking = true;
	}
	else shaking = false;
}

// if at border of a room, clamp it boi
// CLAMP X
if x <= global.game_width / 2
	can_follow_left = false;
else if x >= room_width - global.game_width / 2
	can_follow_right = false;
// CLAMP Y
if y <= global.game_height / 2
	can_follow_up = false;
else if y >= room_height - global.game_height / 2
	can_follow_down = false;

// set camera to follow player
if (follow != noone) {
	
	// clamp camera to left and right side
	if follow.x <= x && !can_follow_left
		x_to = global.game_width / 2;
	else if follow.x >= x && !can_follow_right
		x_to = room_width - global.game_width / 2;
	else 
		x_to = follow.x;
		
	// clamp camera to up and down
	if follow.y <= y && !can_follow_up
		y_to = global.game_height / 2;
	else if follow.y >= y && !can_follow_down
		y_to = room_height - global.game_height / 2;
	else 
		y_to = follow.y;
		
	// make camera show view once player has stopped moving
	var follow_xscale_previous = follow_xscale;
	follow_xscale = follow.image_xscale;
	
	// if I turned recently don't let the camera move
	if follow_xscale != follow_xscale_previous {
		alarm[0] = room_speed; // .5 sec
		can_pan = false;
	}
	// if player is facing same way still,,, then make camera show more
	if can_pan {
		glide_rate = glide_rate_base * 2;
		x_to = follow.x + global.game_width * 1 / 4 * follow_xscale;
	}
	else glide_rate = glide_rate_base;
}

// if shaking, then SHAKE IT BABE
if shaking {
	x = clamp( x + irandom_range(-shake_rate, shake_rate), 
		global.game_width / 2, room_width - global.game_width / 2 );
	y = clamp( y + irandom_range(-shake_rate, shake_rate), 
		global.game_height / 2, room_height - global.game_height / 2 );
}
else { // if the camera isn't shaking then glide to follow pos
	x += (x_to - x) / glide_rate;
	y += (y_to - y) / glide_rate_y;
}
#endregion

global.view_x = x - global.game_width;
global.view_y = y - global.game_height;

// update matrix for camera
var vm = matrix_build_lookat(
	x, y, magic_number,	// camera 3D pos in space
	x, y, 0,	// camera distance from canvas
	0, 1, 0);	// set the camera to point towards the canvas
	
camera_set_view_mat(camera, vm);

// apply parallax effect for all bg layers
parallax_all_bg();