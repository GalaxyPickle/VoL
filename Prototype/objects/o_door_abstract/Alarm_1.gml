/// @description check for completion of keys and locks

if ready exit;

var check = 0;
// check keys
for (var i = 0; i < array_length_1d(keys); i++) {
	var key = keys[i];
	if key.activated {
		check++;
	}
}

if check == array_length_1d(keys) {
	ready = true;
	alarm[2] = room_speed;
	
	// add it to the active list 
	if ds_list_find_index(global.active_list, id) == -1
		ds_list_add(global.active_list, id);
}


alarm[1] = room_speed / 6;