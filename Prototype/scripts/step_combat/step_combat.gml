/// @description calculate enemies and pain

// slight invincibility after being hit
if just_hit {
	invincible = true;
	if current_state != states.pain
		alarm[0] = room_speed / 4; // 1/4 second invinciblity
	else
		alarm[0] = stun_time + room_speed / 2;
		
	just_hit = false;
	
	// sound
	audio_play_sound_on(s_emit, sound_pain[irandom(array_length_1d(sound_pain) - 1)], false, 1);
	
	var sound_splatter = [a_splatter_1, a_splatter_2, a_splatter_3];
	audio_play_sound_on(s_emit, irandom(array_length_1d(sound_splatter) - 1), false, 1);
}

nearest_enemy = [];

// for every enemy in my list...
for (var i = 0; i < array_length_1d(enemy_list); i++) {
	
	// for every instance in the room of the current enemy...
	if instance_exists(enemy_list[i]) {
		for (var j = 0; j < instance_number(enemy_list[i]); j++) {
		
			// if the enemy is in range, add it to my nearest_enemy array
			var enemy = instance_find(enemy_list[i], j);
			
			if distance_to_object(enemy) < close_range
				nearest_enemy[j] = enemy;
		}
	}
}