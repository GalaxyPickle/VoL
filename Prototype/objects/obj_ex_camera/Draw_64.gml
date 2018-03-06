/// @description  Draw camera effects on GUI

if (_suspended == true) {
    exit;
}

if (_ex_camera_count < 1) {
    exit;
}

// loop through cameras and update them
for (var _i=0; _i < _ex_camera_count; ++_i) {

    // get current camera in the loop
    var _name = _ex_cameras[# _ex_camera._name, _i];
    var _view = _ex_cameras[# _ex_camera._view, _i];
    var _position = 0;
    
    var _table_row = ds_grid_value_y(_ex_cameras, 0, 0, 1, _ex_camera_count, _name);
    if (_table_row < 0) {
        continue;
    }

    var _value_flash_draw_target = _ex_cameras[# _ex_camera._flash_draw_target,  _i];
    var _value_fade_draw_target = _ex_cameras[# _ex_camera._fade_draw_target,  _i];
    
    var _value_safe_area  = _ex_cameras[# _ex_camera._safe_area,  _i];
    
    if (_ex_cameras[# _ex_camera._is_flashing, _table_row] == true and _value_flash_draw_target == ex_camera_draw_target_gui) {
        
        // draw and update flash
        var _value_flash_alpha = _ex_cameras[# _ex_camera._flash_alpha, _i];
        var _value_flash_color = _ex_cameras[# _ex_camera._flash_color, _i];
        var _value_flash_blend = _ex_cameras[# _ex_camera._flash_blend, _i];
        
        draw_set_alpha(_value_flash_alpha);
        draw_set_blend_mode(_value_flash_blend);
        draw_set_color(_value_flash_color);
        draw_rectangle(
            -_value_safe_area,
            -_value_safe_area,
            display_get_width()+_value_safe_area,
            display_get_height()+_value_safe_area,
            false
        );
        draw_set_alpha(1.0);
        draw_set_color(c_white);
        draw_set_blend_mode(bm_normal);
        
    }
    
    var _value_fade_alpha = _ex_cameras[# _ex_camera._fade_alpha, _i];
    
    if (_value_fade_alpha >= 0 and _value_fade_draw_target == ex_camera_draw_target_gui) {
    
        // draw and update fade
        var _value_fade_color = _ex_cameras[# _ex_camera._fade_color, _i];
        
        draw_set_alpha(_value_fade_alpha);
        draw_set_color(_value_fade_color);
        draw_rectangle(
            -_value_safe_area,
            -_value_safe_area,
            display_get_width()+_value_safe_area,
            display_get_height()+_value_safe_area,
            false
        );
        draw_set_alpha(1.0);
        draw_set_color(c_white);
        
    }
        
}

