/// @description draw the menu

draw_sprite(s_bg_title, 0, 0, 0);

draw_sprite_ext(s_upgrade_blade, 0, draw_x_start + 50, draw_y_start - 15,
	3, 3, 15, c_white, alpha);
draw_sprite_ext(s_upgrade_blade, 0, draw_x_start - 50, draw_y_start - 15, 
	-3, 3, -15, c_white, alpha);

// player surfs with arrows and clamp movment to options
var hd = gamepad_axis_value(0, gp_axislv);
anim += clamp( (abs(hd) > .5 && timer > room_speed / 2 ? sign(hd) : 0) + 
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
		draw_text_outline_color(draw_x_start, draw_y_start + (i - anim_n) * spacing, menu[i],
			2, c_yellow, 16, c_black, 1);
	}
	else {
		draw_text_color(draw_x_start, draw_y_start + (i - anim_n) * spacing, menu[i],
			c, c, c, c, 1);	
	}
}

// play menu sounds
if current_option != anim && timer > 0 {
	audio_play_sound(a_menu_switch, 1, false);
	alpha = 0;
	timer = 0;
}

current_option = anim;

// show save disclaimer if about to exit
if (current_option == 1 && !global.died) || (current_option == 2 && global.died) {
	draw_set_font(f_gui_small);
	draw_text_outline_color(draw_x_start, draw_y_start + 50,
		"WARNING: Erases Progress", 1, c_black, 16, c_white, 1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

timer++;