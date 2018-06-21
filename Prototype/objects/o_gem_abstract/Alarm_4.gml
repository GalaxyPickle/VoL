/// @description teleport player

if instance_exists(o_player) {
	var player = instance_nearest(x, y, o_player);
	player.x = goto[0];
	player.y = goto[1];
}