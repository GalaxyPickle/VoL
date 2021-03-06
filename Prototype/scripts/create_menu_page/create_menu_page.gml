/// @description create menu page

/// @param ["Name1",type1,entries1...]
/// @param ["Name2",type2,entries...]
/// @param ...

/// @credit friendly cosmonaut https://www.youtube.com/watch?v=1ITZOrI2qkA&t=180s

var arg, i = 0;
repeat(argument_count) {
	arg[i] = argument[i];
	i++;
}

var ds_grid_id = ds_grid_create(5, argument_count);
i = 0; repeat(argument_count) {
	var array = arg[i];
	var array_len = array_length_1d(array);
	
	var xx = 0; repeat(array_len) {
		ds_grid_id[# xx, i] = array[xx];
		xx++;
	}
	i++;
}

return ds_grid_id;