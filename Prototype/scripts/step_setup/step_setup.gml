/// @description mother function to call every step for entity

//////////////////////////
// 0. hitbox vars
//////////////////////////

var vel_x = 0, vel_y = 1;

hitbox_left = x + velocity[vel_x] - sprite_get_xoffset(sprite_hitbox);
hitbox_right = x + velocity[vel_x] + sprite_get_width(sprite_hitbox) - sprite_get_xoffset(sprite_hitbox);
hitbox_top = y + velocity[vel_y] - sprite_get_yoffset(sprite_hitbox);
hitbox_bottom = y + velocity[vel_y] + sprite_get_height(sprite_hitbox) - sprite_get_yoffset(sprite_hitbox);

hitbox_head_left = x + velocity[vel_x] - sprite_get_xoffset(sprite_hitbox_head);
hitbox_head_right = x + velocity[vel_x] + sprite_get_width(sprite_hitbox_head) - sprite_get_xoffset(sprite_hitbox_head);
hitbox_head_top = y + velocity[vel_y] - head_hitbox_offset - sprite_get_yoffset(sprite_hitbox_head);
hitbox_head_bottom = y + velocity[vel_y] - head_hitbox_offset + sprite_get_height(sprite_hitbox_head) - sprite_get_yoffset(sprite_hitbox_head);

////////////////////////////////////////////////////////////////////////////
// 1. secondly, deal with any residual movement
////////////////////////////////////////////////////////////////////////////

// on ground?
on_ground = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]);
	
// sliding on walls?
on_wall_left = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left-1, bbox_top], [bbox_left-1, bbox_top + abs(bbox_bottom - bbox_top) / 2] ]);
on_wall_right = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_right, bbox_top], [bbox_right, bbox_top + abs(bbox_bottom - bbox_top) / 2] ]);

// stuck on little rock or wall by foot?
on_wall_bottom_left = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left-1, bbox_bottom - TILE_SIZE / 2] ]);
on_wall_bottom_right = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_right, bbox_bottom - TILE_SIZE / 2] ]);
	
on_wall = on_wall_left || on_wall_right || on_wall_bottom_left || on_wall_bottom_right;

// apply friction
if on_ground {
	if (x_direction == 0 || !move) && current_state == states.idle {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
	}
	else if current_state == states.pain {
	velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction / 2);
}
}
// apply friction even in air for other states
if current_state == states.attack {
	velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
}
else if current_state == states.dodge {
	velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction / 5);
}

// apply gravity
velocity[vel_y] += GRAVITY;

// move and contact tiles!
move_and_contact_tiles(collision_tile_map_id, TILE_SIZE, velocity);

//////////////////////////////////
// set emitter position
//////////////////////////////////

audio_emitter_position(s_emit, x, y, 0);