/// @description draw the menu

// player surfs with arrows and clamp movment to options
anim += keyboard_check_pressed(KEY_DOWN) - keyboard_check_pressed(KEY_UP);
anim = clamp(anim, 0, array_length_1d(menu) - 1);

anim_n = reach_tween(anim_n, anim, tween_amount);

draw_set_color(c_white);
draw_set_font(f_menu);
for (var i = 0; i < array_length_1d(menu); i++) {
	
	// draw golden current option selected
	draw_set_color( i == anim ? c_yellow : c_white );
	draw_text(draw_x_start, draw_y_start + (i - anim_n) * spacing, menu[i]);	
}

current_option = anim;

// draw main menu name now
draw_set_color(c_white);
draw_set_font(f_menu_big);

var title_start = 300, s = 10;

draw_text(title_start, s, title);
draw_set_font(f_menu);
draw_text_color(title_start + s, s + 100, subtitle, c_gray, c_gray, c_gray, c_gray, 1);