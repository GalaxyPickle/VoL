/// @description check for keys activated

// keys
//if !ready exit;

interact_conditions = ready && place_meeting(x, y, global.player) && !global.chatbox_up && 
	!open && !opening && !global.sunyata && !global.pause;

////////////////////////////////////////////////
// start opening when player presses open
////////////////////////////////////////////////

if place_meeting(x, y, global.player) && !opening && !open && ready && !global.sunyata && !global.pause &&
	( keyboard_check_pressed(global.key_interact) ||
	gamepad_button_check_pressed(0, global.gp_key_interact) )
{
	opening = true;
	audio_play_sound(a_stone_grind, 1, true);
}

if !opening && !open {
	image_speed = 0;	
}

if opening && !open {
	image_speed = 1;
	
	if image_index > image_number - 1 {
		open = true;
	}
}

// if open, keep open with the sprite
if open && !finished_opening {
	image_speed = 0;
	
	// slam dat door foo
	if audio_is_playing(a_stone_grind)
		audio_stop_sound(a_stone_grind);
	audio_play_sound(a_door_slam, 1, false);
	
	// fade music out for room transition
	if audio_is_playing(global.music)
		audio_sound_gain(global.music, 0, room_speed);
	
	// transition
	if !fade fade = true;
	
	finished_opening = true;
}

if fade {
	
	timer += 1 / room_speed;
	
	if timer % 4 {
		if counter < width 
			spawn = true;
		counter++;
	}
	
	if spawn {
		for (var i = 0; i < height; i++) {
			xx = s_width * counter;
			yy = s_width * i;
			
			var lay_id = layer_get_id("layer_instance_top");
			
			with instance_create_layer(0, 0, lay_id, o_transition) {
				xx = other.xx;
				yy = other.yy;
			}
		}
		spawn = false;
	}
	
	if counter - 30 > width {
		counter = -1;
		fade = false;
		timer = 1;
		
		global.player.x = goto_position[0];
		global.player.y = goto_position[1];
		
		room_goto(goto_room);
	}
}