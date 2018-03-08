/// @description start boss music

if place_meeting(x, y, global.player) {
	room_goto(r_demo_level);
	global.player.x = 1000;
	global.player.y = 2300;
}