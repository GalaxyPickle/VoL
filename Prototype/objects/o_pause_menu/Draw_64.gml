/// @description draw the menu

if global.gameover {
	// draw the screenshot and make it greyed out
	draw_sprite_ext(pause_screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
	draw_set_alpha(1);
	draw_rectangle_color(0, 0, surface_get_width(application_surface),
		surface_get_height(application_surface), c_black, c_black, c_red, c_red, false);
	draw_set_alpha(1);
	
	draw_set_font(f_menu_big);
	draw_set_color(c_white);
	draw_text(300, 300, "GAME OVER");
	
	exit;
}

if !global.pause
	exit;

// draw the screenshot and make it greyed out
draw_sprite_ext(pause_screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, surface_get_width(application_surface),
	surface_get_height(application_surface), false);

// player surfs with arrows and clamp movment to options
anim += keyboard_check_pressed(KEY_DOWN) - keyboard_check_pressed(KEY_UP);
anim = clamp(anim, 0, array_length_1d(menu) - 1);

anim_n = reach_tween(anim_n, anim, tween_amount);

// draw the menu
draw_set_color(c_white);
draw_set_font(f_menu);
for (var i = 0; i < array_length_1d(menu); i++) {
	
	// draw golden current option selected
	draw_set_color( i == anim ? c_yellow : c_white );
	draw_text(draw_x_start, draw_y_start + (i - anim_n) * spacing, menu[i]);	
}

current_option = anim;