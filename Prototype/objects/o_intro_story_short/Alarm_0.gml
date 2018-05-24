/// @description timer reset and change text

current_message++;

if current_message == array_length_1d(message) {
	finished = true;
	exit;
}

alarm[0] = timer[current_message];

display_text = message[current_message];