/// @description cast shadows!!!

for (var i = 0; i < array_length_1d(object_list); i++) {

	// if there's not an instance of it in the room, continue to next i++
	if !instance_exists(object_list[i])
		continue;

	script_execute(script_draw, object_list[i]);
}