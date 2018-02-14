/// @description draw the dialogue box

draw_set_font(f_chat);
draw_set_color(c_white);

// how many messages are in the array?
var message_end = array_length_1d(message);

if message_end > 0 {
	// text pos
	var tX = 5;
	var tY = global.window_height - 55;
	
	// next message
	if keyboard_check_pressed(global.key_attack) ||
		keyboard_check_pressed(global.key_enter) 
	{
		// if we have more messages, go to the next one
		if message_current < message_end - 1 {
			message_current++;	
		}
		// else we're finished
		else {
			done = true;	
		}
	}
	
	// draw the text to the screen
	draw_text(tX, tY, message[message_current]);
}