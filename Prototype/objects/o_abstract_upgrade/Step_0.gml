/// @description draw particles

// get ready for pickin' if player is in distance range
if place_meeting(x, y, global.player) {
	var alert = instance_create(x, y, o_alert_popup);
	with alert 
		text = other.text;
	
	// increase stats
	if type == 0 {
		global.player.vitality_max += 100;
		global.player.vitality = global.player.vitality_max;
	}
	else if type == 1 {
		global.player.special_max += 100;
		global.player.special = global.player.special_max;
	}
	
	audio_play_sound(a_impact_creepy, 1, false);
	
	// increase completeness of game
	global.game_percent++;
	
	// despawn forever
	add_to_activated();
		
	instance_destroy();
}