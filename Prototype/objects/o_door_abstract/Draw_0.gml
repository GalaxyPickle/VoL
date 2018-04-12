/// @description show move arrow

if place_meeting(x, y, global.player) {
	outline_start(1, c_white, sprite_index, 4);
	draw_self();
	outline_end();
	
	draw_sprite(s_arrow_default, 0, 
		x + sprite_width / 2, 
		(2 * move_arrow ? 1 : -1) + y - 10);
		
	// do the bouncy arrow sound
	//if move_arrow && !audio_is_playing(a_arrow_bounce)
	//	audio_play_sound(a_arrow_bounce, 1, false);
}
else draw_self();