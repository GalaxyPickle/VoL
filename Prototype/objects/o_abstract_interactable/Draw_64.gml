/// @description draw an interaction popup if I'm interactable

if (global.chatbox_up && !interacting) || !interactable || global.player == noone
	exit;
	
var border_w = 200;
var border_h = 10;
var yheight = 200;
var t_margin = 5;
var xwidth = global.window_width - border_w * 2 - t_margin * 6;
	
var portrait_border_w = 10;
var portrait_width = border_w - portrait_border_w * 2;

// interacting
#region
if interacting {
	global.chatbox_up = true;
	
	///////////////////////////////////////////
	// 1. draw the chat box rectangle border
	///////////////////////////////////////////
	#region
	
	draw_set_alpha(.8);
	
	// lerp it up from the bottom of the screen
	//var t_h = lerp(target_height_1, global.window_height - yheight - border_h, 1);
	draw_roundrect_color(border_w, global.window_height - yheight - border_h, 
		global.window_width - border_w, global.window_height - border_h, 
		c_orange, c_orange, false);
		
	// 2. draw the chat box
	draw_set_color(c_black);
	
	// lerp it up
	//var t_h2 = lerp(target_height_2, global.window_height - yheight - border_h + t_margin, .1);
	draw_roundrect_color(border_w + t_margin, 
		global.window_height - yheight - border_h + t_margin, 
		global.window_width - border_w - t_margin, 
		global.window_height - border_h - t_margin, c_black, c_black, false);
			
	// 3. draw the bg frame of the entity in question
	var pc = c_black;
	draw_rectangle_color(portrait_border_w, global.window_height - yheight - border_h, 
		border_w - portrait_border_w, global.window_height - border_h, 
		pc, pc, pc, pc, false);
			
	// 4. draw the portrait
	draw_sprite(sprite_portrait, 0, portrait_width / 2 + portrait_border_w,
		global.window_height - (yheight - border_h) / 2);
	
	#endregion
	///////////////////////////////////////////
	// 5. now we can draw some text stuff
	///////////////////////////////////////////
	draw_set_font(f_chat);
	draw_set_color(c_white);

	// how many messages are in the array?
	var message_end = array_length_1d(message);
	
	// if the message string is finished, then show the move-on keys
	if cutoff == string_length(message[message_current]) {
		message_current_finished = true;
		
		// draw next button sprites no matter what
		draw_sprite(s_textbox_keys, 0,
			global.window_width - border_w + t_margin * 3, 
			global.window_height - border_h - t_margin * 3);
				
		// draw blinking arrow
		if move_arrow {
			draw_sprite(s_textbox_continue, 0,
				global.window_width - border_w + t_margin * 4 + sprite_get_width(s_textbox_keys), 
				global.window_height - border_h - t_margin * 3);
		}
	}
	else message_current_finished = false;

	if message_end > 0 {
		
		// typrewrite effect
		var char_width = font_get_size(f_chat) * 3 / 4;
		var line_end = xwidth / char_width;
		var line_space = font_get_size(f_chat) * 2;
		var line = 0;
		var space = 0;
		var i = 1;
		var delay = 1;
		
		if keyboard_check(global.key_interact) || gamepad_button_check(0, global.gp_key_interact) {
			delay = 0;	
		}
		
		// if there's more characters to write in the string...
		if cutoff < string_length(message[message_current]) {
			if timer >= delay {
				cutoff++;
				timer = 0;
			}
			else {
				timer++;	
			}
		}
		
		// text pos
		var tX = border_w + t_margin * 3;
		var tY = global.window_height - yheight - border_h + t_margin * 3;
	
		// next message
		if ( keyboard_check_pressed(global.key_interact) || 
			gamepad_button_check_pressed(0, global.gp_key_interact) ) && interacting && !start_interaction
		{
			// if we have more messages, go to the next one
			if message_current_finished && message_current < message_end - 1 {
				message_current++;
				cutoff = 0;
				//audio_play_sound(a_message_popup, 1, false);
			}
			// else we're finished
			else {
				if message_current_finished {
					interacting = false;
					cutoff = 0;
					done_interacting = true;
					dialogue_read = true;
					global.chatbox_up = false;
				}
			}
		}
	
		// draw the text to the screen
		while i <= string_length(message[message_current]) && i <= cutoff {
			
			// go to next line
			var length = 0;
			while string_char_at(message[message_current], i) != " " &&
				i <= string_length(message[message_current])
			{
				i++;
				length++;
			}
			
			if space + length > line_end {
				space = 0;
				line++;
			}
			i -= length;
			
			draw_text(tX + space * char_width, tY + line_space * line, 
				string_char_at(message[message_current], i));
				
			space++;
			
			//if !audio_is_playing(a_message_type) && !message_current_finished
			//	audio_play_sound(a_message_type, 1, false);
			
			i++;
		}
	}
	// exit chatbox if player presses it again
}
else {
	// reset chatbox
	global.chatbox_up = false;
	// if player is in interactable range...
	if interactable && distance_to_object(global.player) < close_range {
		
		draw_set_alpha(1);
		// draw next button sprites no matter what
		draw_sprite(s_textbox_keys, 0,
			global.window_width / 2, 
			global.window_height - t_margin * 8);
		draw_set_font(f_chat);
		var tc = c_white;
		draw_text_color(global.window_width / 2,	
			global.window_height - t_margin * 8, interact_text, tc, tc, tc, tc, 1);
	}
}
#endregion