/// @description mother function to call every step for entity

//////////////////////////
// 0. hitbox vars
//////////////////////////

var vel_x = 0, vel_y = 1;

hitbox_left = x + velocity[vel_x] - sprite_get_xoffset(sprite_hitbox) * image_xscale;
hitbox_right = x + velocity[vel_x] + (sprite_get_width(sprite_hitbox) - sprite_get_xoffset(sprite_hitbox)) * image_xscale;
hitbox_top = y + velocity[vel_y] - sprite_get_yoffset(sprite_hitbox);
hitbox_bottom = y + velocity[vel_y] + sprite_get_height(sprite_hitbox) - sprite_get_yoffset(sprite_hitbox);

if !prone {
	hitbox_head_left = x + velocity[vel_x] - sprite_get_xoffset(sprite_hitbox_head);
	hitbox_head_right = x + velocity[vel_x] + sprite_get_width(sprite_hitbox_head) - sprite_get_xoffset(sprite_hitbox_head);
	hitbox_head_top = y + velocity[vel_y] - head_hitbox_offset - sprite_get_yoffset(sprite_hitbox_head);
	hitbox_head_bottom = y + velocity[vel_y] - head_hitbox_offset + sprite_get_height(sprite_hitbox_head) - sprite_get_yoffset(sprite_hitbox_head);
}
else {
	hitbox_head_left = x + velocity[vel_x] + head_hitbox_offset * image_xscale - sprite_get_xoffset(sprite_hitbox_head);
	hitbox_head_right = x + velocity[vel_x] + head_hitbox_offset * image_xscale + sprite_get_width(sprite_hitbox_head) - sprite_get_xoffset(sprite_hitbox_head);
	hitbox_head_top = y + velocity[vel_y] - sprite_get_yoffset(sprite_hitbox_head);
	hitbox_head_bottom = y + velocity[vel_y] + sprite_get_height(sprite_hitbox_head) - sprite_get_yoffset(sprite_hitbox_head);
}
////////////////////////////////////////////////////////////////////////////
// 1. collision checks
////////////////////////////////////////////////////////////////////////////

// danger collisions
in_danger = ( move_and_check_contact_tiles(danger_tile_map_id, velocity) && !ghost_mode) ||
	( move_and_check_contact_tiles(danger_ghost_tile_map_id, velocity) && ghost_mode);

if in_danger && !invincible && !dead {
	var vit_dmg = vitality_max / 10;
	
	just_hit = true;
	current_state = states.pain;
	starting = true;
	vitality -= vit_dmg;
	velocity = [-image_xscale * 3, -3];
	
	var layer_id = layer_get_id("layer_instance_popups");
	var particle_layer = layer_get_id("layer_instance_particles");
	
	// popups
	var damage_popup = instance_create_layer(x, hitbox_head_top, layer_id, o_damage_popup);
	damage_popup.damage = vit_dmg;
	damage_popup.positive = false;
	
	// particles
	particle_fluffy_burst(x, y, pt_shape_disk, 5, c_red, c_maroon, 120,
		image_xscale == 1 ? 45 : 135, 3, 10 + random(10));
}

// on platform?
on_platform = 
	(
	tile_collide_at_points(platform_tile_map_id,
		[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) 
	||
	( tile_collide_at_points(platform_ghost_tile_map_id,
		[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) && ghost_mode )
	||
	( tile_collide_at_points(platform_normal_tile_map_id,
		[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) && !ghost_mode )
	)
	&& velocity[vel_y] >= 0;
		
if ( !NPC && !global.pause && ( keyboard_check(global.key_down) || gamepad_axis_value(0, gp_axislv) >= .5 ) ) || 
	(NPC && key_down) || dropping {
	if on_platform && velocity[vel_y] == 0 {
		alarm[5] = room_speed / 4;
		dropping = true;
	}
	on_platform = false;
}

// on ground?
on_ground = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) || on_platform;
	
// sliding on walls?
on_wall_left = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left-1, bbox_top], [bbox_left-1, bbox_top + abs(bbox_bottom - bbox_top) / 2] ]);
on_wall_right = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_right, bbox_top], [bbox_right, bbox_top + abs(bbox_bottom - bbox_top) / 2] ]);
	
// close enough yet not too far to jump off of wall
var dist = TILE_SIZE - 1;

on_wall_jump_left = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left-1 - dist, bbox_top], [bbox_left-1 - dist, bbox_top + abs(bbox_bottom - bbox_top) / 2] ]);
on_wall_jump_right = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_right + dist, bbox_top], [bbox_right + dist, bbox_top + abs(bbox_bottom - bbox_top) / 2] ]);

// stuck on little rock or wall by foot?
on_wall_bottom_left = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_left-1, bbox_bottom - TILE_SIZE / 2] ]);
on_wall_bottom_right = tile_collide_at_points(collision_tile_map_id,
	[ [bbox_right, bbox_bottom - TILE_SIZE / 2] ]);
	
on_wall = on_wall_left || on_wall_right || on_wall_bottom_left || on_wall_bottom_right;

/////////////////////////////////////////////////////
// one-way platforms
/////////////////////////////////////////////////////

// Vertical collisions
// Falling
if on_platform && velocity[vel_y] > 0
{	
	var tile_bottom = tile_collide_at_points(platform_tile_map_id,
			[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) ||
		( tile_collide_at_points(platform_ghost_tile_map_id,
			[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) && ghost_mode ) ||
		( tile_collide_at_points(platform_normal_tile_map_id,
			[ [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom] ]) && !ghost_mode );
		
	if tile_bottom {
		y = bbox_bottom & ~(TILE_SIZE-1);
		y -= bbox_bottom-y;
		velocity[vel_y] = 0;
	}
}

////////////////////////////////////////////
// falling
////////////////////////////////////////////

if on_ground {
	
	if show_recover_cloud {
		audio_play_sound_on(s_emit, sound_land, false, 1);
		// show cloud on landing
		particle_fluffy_burst(x, bbox_bottom, pt_shape_cloud, 
			sprite_height / 15 < 1 ? 1 : sprite_height / 15, 
			c_white, c_white, 50, 0, 2, 10);
		particle_fluffy_burst(x, bbox_bottom, pt_shape_cloud, 
			sprite_height / 15 < 1 ? 1 : sprite_height / 15, 
			c_white, c_white, 50, 180, 2, 10);	
		show_recover_cloud = false;
	}
	
	if !recovered {
		just_landed = true;
		recovered = true;
	}
	else just_landed = false;
}
else {
	recovered = true;
	if velocity[vel_y] >= TILE_SIZE * 3 / 4 {
		recovered = false;	
	}
	show_recover_cloud = true;
}

////////////////////////////////////////////////////////////////////////////
// 2. FRICTIONS + physics
////////////////////////////////////////////////////////////////////////////

// apply friction
if on_ground {
	if current_state == states.pain {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction / 10);
	}
	else if (x_direction == 0 || !move) && current_state == states.idle {
		velocity[vel_x] = 0;
	}
	else if ( x_direction != 0 && sign(x_direction) != sign(velocity[vel_x]) ) &&
		current_state == states.idle 
	{
		velocity[vel_x] = 0;
	}
	else if current_state == states.pain {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction / 2);
	}
	else if current_state == states.attack {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction);
	}
	else if current_state == states.dodge {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction / 10);
	}
}
// friction regardless of on ground or not
else {
	if !move || x_direction == 0 || (current_state != states.idle) {
		velocity[vel_x] = lerp(velocity[vel_x], 0, horizontal_friction / 10);
	}
}

// CLAMP IT
clamp(velocity[@ vel_x], -TILE_SIZE / 2, TILE_SIZE / 2);

//////////////////////////
// Physics 2
//////////////////////////

// keep away from other entities
var o = object_index;
// if close by, shoot away from the entity
if o != self && distance_to_point(o.x, o.y) < 10 && 
( (!move && !o.move) ) {
	if x < o.x
		velocity[vel_x] += -1;
	else if x > o.x
		velocity[vel_x] += 1;
}

var max_vel_y = TILE_SIZE * 3 / 8;

// apply gravity
if velocity[vel_y] <= max_vel_y && !on_ground && !(ghost_mode && current_state == states.dodge) {
	velocity[vel_y] += global.GRAVITY;
}

// CLAMP IT
clamp(velocity[@ vel_y], -max_vel_y, max_vel_y);

// move and contact tiles!
move_and_contact_tiles(collision_tile_map_id, TILE_SIZE, velocity);

//////////////////////////////////
// set emitter position
//////////////////////////////////

audio_emitter_position(s_emit, x, y, 0);