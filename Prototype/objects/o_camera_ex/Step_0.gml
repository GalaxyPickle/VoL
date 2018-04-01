/// @description  Follow player and play Effects

// follow
if (instance_exists(global.player) and _follow_object == true) {
    ex_camera_scroll_to_object("main", global.player, 6, scr_ease_inout_sine, false);
}

/*

// scroll effect
if (keyboard_check_pressed(ord("M")) and _follow_object == true) {
    _follow_object = false;
    
    //ex_camera_set_bounds("main", 0, 0, room_width, room_height); // how to release bounds if necessary
    
    ex_camera_scroll_to_object("main", inst_CA099180, 24, scr_ease_inout_sine, true, scr_test_focus_player);
    //ex_camera_scroll_to_point("main", 2000, 2000, 24, scr_ease_inout_sine, true, scr_test_focus_player);
    //ex_camera_scroll_by("main", 32, 32, 24, scr_ease_inout_sine, scr_test_focus_player);
}

// shake effect
if (keyboard_check_pressed(ord("S"))) {
    ex_camera_shake("main", 8, 8, 0, 12, scr_ease_out_sine);
}

// tilt effect
if (keyboard_check_pressed(ord("T"))) {
    ex_camera_tilt("main", 10, 32, scr_ease_inout_back);
}

// flash effect
if (keyboard_check_pressed(ord("F"))) {
   ex_camera_flash("main", 0.9, 20, scr_ease_out_sine, c_white, bm_add);
}

// fade effect
if (keyboard_check_pressed(ord("A"))) {
   ex_camera_fade("main", 1, 30, scr_ease_inout_sine, c_black);
}

// zoom out (-)
if (keyboard_check_pressed(189)) {
    ex_camera_zoom("main", 120, 12, scr_ease_inout_sine);
}

// zoom in (+)
if (keyboard_check_pressed(187)) {
    ex_camera_zoom("main", 60, 12, scr_ease_inout_sine);
}

// zoom reset (0)
if (keyboard_check_pressed(48)) {
    ex_camera_zoom("main", 100, 12, scr_ease_inout_sine);
}


