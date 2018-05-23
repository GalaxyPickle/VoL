/// @description draw the pause stuff mate

if global.pause {
	
	global.chatbox_up = true;
	
	draw_sprite_ext(pause_sprite, 0, global.window_width / 2, global.window_height / 2,
		1, 1, 0, c_white, .75);
	
	if instance_exists(o_player) && player == noone
		player = instance_nearest(x, y, o_player);
		
	draw_set_alpha(1);
	
	//////////////////////////////////////////
	// CALC GAME PERCENT COMPLETE
	#region
	global.game_percent = 0;
	
	// percent of health
	global.game_percent += player.vitality_max / 100;
	// percent of sunyata
	global.game_percent += player.special_max / 100;
	
	// percent of glyphs
	var temp = 0;
	for (var i = 0; i < array_length_1d(global.glyphs); i++) {
		var arr = global.glyphs[i];
		for (var j = 0; j < array_length_1d(arr); j++) {
			if arr[j] == true
				temp++;
		}
	}
	global.game_percent += temp;
	
	// percent of gems
	temp = 0;
	for (var i = 0; i < array_length_1d(global.gems); i++) {
		if global.gems[i] == true
			temp += 16;
	}
	
	global.game_percent += temp;
	
	// percent of last boss y0000
	if global.boss_killed_demon_lord
		global.game_percent += 18;
	///////////////////////////////////////////
	#endregion
	
	//////////////////////////////////////
	// draw top right stuff
	x = global.window_width / 2 + sprite_width / 2;
	y = global.window_height / 2 - sprite_height / 2;
	
	// vitality
	var spr = s_gui_hp_symbol;
	for (var i = 0; i < player.vitality_max / 100; i++) {
		draw_sprite_ext(spr, 0, 
			x - TILE_SIZE * 2, y + TILE_SIZE * 2 * (i + 1), 
			2, 2, 0, c_white, 1);
	}
	// sunyata
	var spr = s_gui_sunyata_symbol;
	for (var i = 0; i < player.special_max / 100; i++) {
		draw_sprite_ext(spr, 0, 
			x - TILE_SIZE * 5, y + TILE_SIZE * 2 * (i + 1), 
			2, 2, 0, c_white, 1);
	}	
	
	////////////////////////////////////////
	// draw top left stuff
	x = global.window_width / 2 - sprite_width / 2;
	y = global.window_height / 2 - sprite_height / 2;
	
	////////////////////////////////////////
	// percent complete!!!
	// draw the percent bar
	draw_healthbar(x + TILE_SIZE * 14, y + TILE_SIZE * 1.5, 
		x + TILE_SIZE * 30, y + TILE_SIZE * 2.5 - 1, global.game_percent, c_black,
		c_red, c_lime, 0, false, false);
	
	// text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(f_menu_med);
	
	draw_text_outline_color(x + TILE_SIZE * 7.5, y + TILE_SIZE * 2,
		string(global.game_percent) + "% Complete", 1, c_black, 8, c_white, 1);
	
	draw_set_halign(fa_top);
	draw_set_valign(fa_left);
	
	//////////////////////////////////////////
	// draw the glyph collection
	var dist = 5;
	for (var i = 0; i < array_length_1d(glyphs); i++) {
		
		var glyph = glyphs[i];
		var cur_row = global.glyphs[i];
		
		for (var j = 0; j < array_length_1d(glyph); j++) {
			if cur_row[j] == true {
				draw_sprite_ext(glyph[j], 0, 
					x + TILE_SIZE * 3 * j + TILE_SIZE * 2,
					y + TILE_SIZE * dist - TILE_SIZE,
					2, 2, 0, c_white, 1);
			}
		}
		dist += 4;
	}
	
	/////////////////////////////////////////
	// draw bottom right stuff
	x = global.window_width / 2 + sprite_width / 2;
	y = global.window_height / 2 + sprite_height / 2;
	
	// draw gems
	dist = 20;
	var gems = [s_upgrade_gem_red, s_upgrade_gem_blue, s_upgrade_gem_yellow];
	
	for (var i = 0; i < array_length_1d(gems); i++) {
		if global.gems[i] {
			draw_sprite_ext(gems[i], 0, 
				x - TILE_SIZE * dist - sprite_get_width(s_upgrade_gem_gray), 
				y - TILE_SIZE * 2.5 - sprite_get_height(s_upgrade_gem_gray),
				2, 2, 0, c_white, 1);
		}
		dist -= 5;
	}
}
else global.chatbox_up = false;