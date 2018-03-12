/// @description draw the menu

// player surfs with arrows and clamp movment to options
var hd = gamepad_axis_value(0, gp_axislh);
anim += clamp( (abs(hd) > .5 ? sign(hd) : 0) + 
	keyboard_check_pressed(global.key_down) - keyboard_check_pressed(global.key_up), -1, 1 );
anim = clamp(anim, 0, array_length_1d(menu) - 1);

anim_n = reach_tween(anim_n, anim, tween_amount);

draw_set_font(f_menu);
for (var i = 0; i < array_length_1d(menu); i++) {
	
	// draw golden current option selected
	var c = c_white; //(i == anim ? c_yellow : c_white);
	if i == anim {
		draw_text_outline_color(draw_x_start, draw_y_start + (i - anim_n) * spacing, menu[i],
			2, c_aqua, 16, c_black, 1);
	}
	else {
		draw_text_color(draw_x_start, draw_y_start + (i - anim_n) * spacing, menu[i],
			c, c, c, c, 1);	
	}
}

current_option = anim;

// draw main menu name now
draw_set_font(f_menu_big);

var title_start = 300, s = 10;
var c = c_white;
var c2 = c_gray;

draw_text_color(title_start, s, title, c, c, c, c, 1);
draw_set_font(f_menu);
draw_text_color(title_start + s, s + 100, subtitle, c2, c2, c2, c2, 1);