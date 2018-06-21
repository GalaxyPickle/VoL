/// @desc checks for item in the active item list, returns bool

if ds_list_find_index(global.active_list, id) != -1
	return true;
else return false;