/// @description either wander or follow player

// for every enemy in my list...
for (var i = 0; i < array_length_1d(enemy_list); i++) {
	
	// for every instance in the room of the current enemy...
	if instance_exists(enemy_list[i]) {
		for (var j = 0; j < instance_number(enemy_list[i]); j++) {
		
			var enemy = instance_find(enemy_list[i], j);				
			////////////////////////////////
			// wander or follow player
			////////////////////////////////
			
				
			////////////////////////////////
			// end
			////////////////////////////////
		}
	}
}