/// @desc adds object to the activated list if it's not in already

if ds_list_find_index(global.active_list, id) == -1
	ds_list_add(global.active_list, id);