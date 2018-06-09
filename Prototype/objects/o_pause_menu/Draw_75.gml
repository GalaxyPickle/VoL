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
	global.game_percent += (player.vitality_max / 100) * 2;
	// percent of sunyata
	global.game_percent += (player.special_max / 100) * 2;
	
	// percent of glyphs
	var temp = 0;
	for (var i = 0; i < array_length_1d(global.glyphs); i++) {
		var arr = global.glyphs[i];
		for (var j = 0; j < array_length_1d(arr); j++) {
			if arr[j] == true
				temp++;
		}
	}
	global.game_percent += temp * 2;
	
	// percent of gems
	temp = 0;
	for (var i = 0; i < array_length_1d(global.gems); i++) {
		if global.gems[i] == true
			temp += 14;
	}
	
	global.game_percent += temp;
	
	// percent of last boss y0000
	if global.boss_killed_reptilian
		global.game_percent += 14;
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
			x - TILE_SIZE * 2, y + TILE_SIZE * (5 + (i * 3)), 
			2, 2, 0, c_white, 1);
	}
	// sunyata
	var spr = s_gui_sunyata_symbol;
	for (var i = 0; i < player.special_max / 100; i++) {
		draw_sprite_ext(spr, 0, 
			x - TILE_SIZE * 5, y + TILE_SIZE * (5 + (i * 3)), 
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
		x + TILE_SIZE * 35, y + TILE_SIZE * 2.5 - 1, global.game_percent, c_black,
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
	var dist = 6;
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
		dist += 5;
	}
	
	/////////////////////////////////////////
	// draw bottom right stuff
	x = global.window_width / 2 + sprite_width / 2;
	y = global.window_height / 2 + sprite_height / 2;
	
	//////////////////////////////////////////
	// show quit / resume options
	#region
	
	var xs = x - 15 * TILE_SIZE;
	var ys = y - 10 * TILE_SIZE;
	var spacing = 75;
	
	draw_sprite_ext(s_upgrade_blade, 0, xs + 50, ys - 15,
	3, 3, 15, c_white, alpha);
	draw_sprite_ext(s_upgrade_blade, 0, xs - 50, ys - 15, 
		-3, 3, -15, c_white, alpha);

	// player surfs with arrows and clamp movment to options
	var hd = gamepad_axis_value(0, gp_axislv);
	anim += clamp( (abs(hd) > .5 ? sign(hd) : 0) + 
		keyboard_check_pressed(global.key_down) - keyboard_check_pressed(global.key_up), -1, 1 );
	anim = clamp(anim, 0, array_length_1d(menu) - 1);

	anim_n = reach_tween(anim_n, anim, tween_amount);

	draw_set_font(f_menu_med);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	for (var i = 0; i < array_length_1d(menu); i++) {
	
		// draw golden current option selected
		var c = c_white; //(i == anim ? c_yellow : c_white);
		if i == anim {
			draw_text_outline_color(xs, ys + (i - anim_n) * spacing, menu[i],
				2, c_yellow, 16, c_black, 1);
		}
		else {
			draw_text_color(xs, ys + (i - anim_n) * spacing, menu[i],
				c, c, c, c, 1);	
		}
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	// play menu sounds
	if current_option != anim {
		audio_play_sound(a_menu_switch, 1, false);
		alpha = 0;
	}

	current_option = anim;
	
	
	#endregion
	
	//////////////////////////////////
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
else { 
	global.chatbox_up = false;
	current_option = 0;
}