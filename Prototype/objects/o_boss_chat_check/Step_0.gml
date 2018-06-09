/// @description check if chat

if instance_exists(o_player) && distance_to_object(o_player) < 200{
	var rep = instance_nearest(x, y, o_reptilian_large);
	var play = instance_nearest(x, y, o_player);
	
	if rep.dialogue_read && !changed {
		changed = true;
		rep.interactable = false;
		rep.enemy_list = [o_player];
		play.enemy_list = [o_reptilian_large];
	}
}

if instance_exists(o_player) && global.boss_killed_reptilian {
	var play = instance_nearest(x, y, o_player);
	play.pause_input = true;
}