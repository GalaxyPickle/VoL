/// @description  Update and Draw cameras

if (_suspended == true) {
    exit;
}

var _ex_camera_count = ex_camera_count();

if (_ex_camera_count < 1) {
    exit;
}

// loop through cameras and update them
var _i = _ex_camera_count;
while (--_i >= 0) {

    // get current camera in the loop
    var _name = _ex_cameras[# _ex_camera._name, _i];
    
    
    var _table_row = ds_grid_value_y(_ex_cameras, 0, 0, 1, _ex_camera_count, _name);
    if (_table_row < 0) {
        continue;
    }
    
    // get view
    var _view         = _ex_cameras[# _ex_camera._view, _i];
    
    // get bounds
    var _bound_x      = _ex_cameras[# _ex_camera._bound_x, _i];
    var _bound_y      = _ex_cameras[# _ex_camera._bound_y, _i];
    var _bound_width  = _ex_cameras[# _ex_camera._bound_width, _i];
    var _bound_height = _ex_cameras[# _ex_camera._bound_height, _i];
    
    // handle flash effect
    if (_ex_cameras[# _ex_camera._is_flashing, _table_row] == true) {

        var _value             =  _ex_cameras[# _ex_camera._flash_tween_position, _table_row];
        var _value_start       =  _ex_cameras[# _ex_camera._flash_start,    _table_row];
        var _value_end         =  _ex_cameras[# _ex_camera._flash_end,      _table_row];
        var _value_position    =  _ex_cameras[# _ex_camera._flash_tween_position, _table_row];
        var _value_duration    =  _ex_cameras[# _ex_camera._flash_tween_duration, _table_row];
        var _value_easing      =  _ex_cameras[# _ex_camera._flash_tween_easing,   _table_row];
        var _value_safe_area   =  _ex_cameras[# _ex_camera._safe_area,      _table_row];
        var _value_flash_color =  _ex_cameras[# _ex_camera._flash_color,    _table_row];
        var _value_flash_blend =  _ex_cameras[# _ex_camera._flash_blend,    _table_row];
        var _value_flash_alpha =  _ex_cameras[# _ex_camera._flash_alpha,    _table_row];
        
        _value_position += 1;
        
        if (_value_easing == -1) {
            _value_flash_alpha = lerp(_value_start, 0, ex_camera_math_smoothstep(0, 1, _value_position / _value_duration));
        } else {
            _value_flash_alpha = lerp(_value_start, 0, script_execute(_value_easing, _value_position, 0, clamp(_value_position * _value_duration, 0, 1), _value_duration));
        } 
        
        // update flash position
        _ex_cameras[# _ex_camera._flash_tween_position, _table_row] = _value_position;
        
        // update flash alpha
        _ex_cameras[# _ex_camera._flash_alpha, _table_row] = _value_flash_alpha;
        
        // if over duration, stop fading
        if (_value_position >= _value_duration) {
            _ex_cameras[# _ex_camera._flash_tween_duration, _table_row] = -1;
            
            _ex_cameras[# _ex_camera._is_flashing, _table_row] = false;
            
            if (ex_camera_get_debug_mode()) {
                show_debug_message("exCamera: Camera \""+_name+"\" has ended flashing");
            }
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._flash_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._flash_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._flash_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._flash_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
        
    }

    // get scroll offsets
    var _scroll_x_offset = _ex_cameras[# _ex_camera._scroll_x, _table_row];
    var _scroll_y_offset = _ex_cameras[# _ex_camera._scroll_y, _table_row];
    
    // handle scroll effect
    if (_ex_cameras[# _ex_camera._is_scrolling, _table_row] == true) {

        var _scroll_start_x     =  _ex_cameras[# _ex_camera._scroll_start_x, _table_row];
        var _scroll_start_y     =  _ex_cameras[# _ex_camera._scroll_start_y, _table_row];
        var _scroll_end_x       =  _ex_cameras[# _ex_camera._scroll_end_x,   _table_row];
        var _scroll_end_y       =  _ex_cameras[# _ex_camera._scroll_end_y,   _table_row];
        
        var _scroll_tween_position    =  _ex_cameras[# _ex_camera._scroll_tween_position, _table_row];
        var _scroll_tween_duration    =  _ex_cameras[# _ex_camera._scroll_tween_duration, _table_row];
        var _scroll_tween_easing      =  _ex_cameras[# _ex_camera._scroll_tween_easing,   _table_row];
        
        var _scroll_x           =  _ex_cameras[# _ex_camera._scroll_x, _table_row];
        var _scroll_y           =  _ex_cameras[# _ex_camera._scroll_y, _table_row];

        _scroll_tween_position += 1;
        
        if (_scroll_tween_easing == -1) {
            _scroll_x = lerp(_scroll_start_x, _scroll_end_x, ex_camera_math_smoothstep(0, 1, _scroll_tween_position / _scroll_tween_duration));
            _scroll_y = lerp(_scroll_start_y, _scroll_end_y, ex_camera_math_smoothstep(0, 1, _scroll_tween_position / _scroll_tween_duration));
        } else {
            _scroll_x = lerp(_scroll_start_x, _scroll_end_x, script_execute(_scroll_tween_easing, _scroll_tween_position, 0, clamp(_scroll_tween_position * _scroll_tween_duration, 0, 1), _scroll_tween_duration));
            _scroll_y = lerp(_scroll_start_y, _scroll_end_y, script_execute(_scroll_tween_easing, _scroll_tween_position, 0, clamp(_scroll_tween_position * _scroll_tween_duration, 0, 1), _scroll_tween_duration));
        } 
        
        _scroll_x_offset = _scroll_x;
        _scroll_y_offset = _scroll_y;
        
        _ex_cameras[# _ex_camera._scroll_x,    _table_row] = _scroll_x;
        _ex_cameras[# _ex_camera._scroll_y,    _table_row] = _scroll_y;
        
        // update tween position
        _ex_cameras[# _ex_camera._scroll_tween_position, _table_row] = _scroll_tween_position;
        
        // if over duration, stop scrolling
        if (_scroll_tween_position >= _scroll_tween_duration) {
            
            _ex_cameras[# _ex_camera._scroll_x,    _table_row] = _scroll_end_x;
            _ex_cameras[# _ex_camera._scroll_y,    _table_row] = _scroll_end_y;
            _ex_cameras[# _ex_camera._is_scrolling, _table_row] = false;
            
            _ex_cameras[# _ex_camera._scroll_tween_duration, _table_row] = -1;
            if (ex_camera_get_debug_mode()) {
                show_debug_message("exCamera: Camera \""+_name+"\" has ended scrolling");
            }
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._scroll_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._scroll_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._scroll_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._scroll_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
        
    }
    
    // handle tilt effect
    if (_ex_cameras[# _ex_camera._is_tilting, _table_row] == true) {

        var _value           =  _ex_cameras[# _ex_camera._tilt_angle, _table_row];
        var _value_start     =  _ex_cameras[# _ex_camera._tilt_start, _table_row];
        var _value_end       =  _ex_cameras[# _ex_camera._tilt_end,   _table_row];
        
        var _value_position    =  _ex_cameras[# _ex_camera._tilt_tween_position, _table_row];
        var _value_duration    =  _ex_cameras[# _ex_camera._tilt_tween_duration, _table_row];
        var _value_easing      =  _ex_cameras[# _ex_camera._tilt_tween_easing,   _table_row];
        
        var _value_safe_area   =  _ex_cameras[# _ex_camera._safe_area, _table_row];

        _value_position += 1;
        
        if (_value_easing == -1) {
            _value = lerp(_value_start, _value_end, ex_camera_math_smoothstep(0, 1, _value_position / _value_duration));
        } else {
            _value = lerp(_value_start, _value_end, script_execute(_value_easing, _value_position, 0, clamp(_value_position * _value_duration, 0, 1), _value_duration));
        }
        
        // update view angle
        __view_set( e__VW.Angle, _view, _value );
        
        // update camera tilt
        _ex_cameras[# _ex_camera._tilt_angle, _table_row] = _value;
        
        // update tween position
        _ex_cameras[# _ex_camera._tilt_tween_position, _table_row] = _value_position;
        
        // if over duration, stop scrolling
        if (_value_position >= _value_duration) {
        
            _ex_cameras[# _ex_camera._is_tilting, _table_row] = false;
            _ex_cameras[# _ex_camera._tilt_tween_duration, _table_row] = -1;
            
            if (ex_camera_get_debug_mode()) {
                show_debug_message("exCamera: Camera \""+_name+"\" has ended tilting");
            }
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._tilt_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._tilt_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._tilt_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._tilt_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
        
    }
    
    // handle fade effect
    if (_ex_cameras[# _ex_camera._is_fading, _table_row] == true) {

        var _value_start      =  _ex_cameras[# _ex_camera._fade_start,    _table_row];
        var _value_end        =  _ex_cameras[# _ex_camera._fade_end,      _table_row];
        var _value_position   =  _ex_cameras[# _ex_camera._fade_tween_position, _table_row];
        var _value_duration   =  _ex_cameras[# _ex_camera._fade_tween_duration, _table_row];
        var _value_easing     =  _ex_cameras[# _ex_camera._fade_tween_easing,   _table_row];
        var _value_safe_area  =  _ex_cameras[# _ex_camera._safe_area,      _table_row];
        var _value_fade_color =  _ex_cameras[# _ex_camera._fade_color,    _table_row];
        var _value_fade_blend =  _ex_cameras[# _ex_camera._fade_blend,    _table_row];
        var _value_fade_alpha =  _ex_cameras[# _ex_camera._fade_alpha,    _table_row];
        
        _value_position += 1;
        
        if (_value_easing == -1) {
            _value_fade_alpha = lerp(_value_start, _value_end, ex_camera_math_smoothstep(0, 1, _value_position / _value_duration));
        } else {
            _value_fade_alpha = lerp(_value_start, _value_end, script_execute(_value_easing, _value_position, 0, clamp(_value_position * _value_duration, 0, 1), _value_duration));
        }
        
        // update fade alpha
        _ex_cameras[# _ex_camera._fade_alpha, _table_row] = _value_fade_alpha;
        
        // update fade volume position
        _ex_cameras[# _ex_camera._fade_tween_position, _table_row] = _value_position;
        
        // if over duration, stop fading
        if (_value_position >= _value_duration) {
            
            _ex_cameras[# _ex_camera._fade_tween_duration, _table_row] = -1;
            _ex_cameras[# _ex_camera._is_fading, _table_row] = false;
            
            if (ex_camera_get_debug_mode()) {
                show_debug_message("exCamera: Camera \""+_name+"\" has ended fading");
            }
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._fade_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._fade_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._fade_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._fade_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
        
    }
    
    // get draw targets
    var _value_flash_draw_target = _ex_cameras[# _ex_camera._flash_draw_target,  _i];
    var _value_fade_draw_target  = _ex_cameras[# _ex_camera._fade_draw_target,   _i];
    
    // get safe area
    var _value_safe_area  = _ex_cameras[# _ex_camera._safe_area,  _i];
    
    if (_ex_cameras[# _ex_camera._is_flashing, _table_row] == true and _value_flash_draw_target == ex_camera_draw_target_event and view_current == _view) {
        
        // draw and update flash
        var _value_flash_alpha = _ex_cameras[# _ex_camera._flash_alpha, _i];
        var _value_flash_color = _ex_cameras[# _ex_camera._flash_color, _i];
        var _value_flash_blend = _ex_cameras[# _ex_camera._flash_blend, _i];
        
        draw_set_alpha(_value_flash_alpha);
        draw_set_blend_mode(_value_flash_blend);
        draw_set_color(_value_flash_color);
        draw_rectangle(
            __view_get( e__VW.XView, _view )-_value_safe_area,
            __view_get( e__VW.YView, _view )-_value_safe_area,
            __view_get( e__VW.XView, _view )+__view_get( e__VW.WView, _view )+_value_safe_area,
            __view_get( e__VW.YView, _view )+__view_get( e__VW.HView, _view )+_value_safe_area,
            false
        );
        draw_set_alpha(1.0);
        draw_set_color(c_white);
        draw_set_blend_mode(bm_normal);
        
    }
    
    var _value_fade_alpha = _ex_cameras[# _ex_camera._fade_alpha, _i];
    
    if (_value_fade_alpha >= 0 and _value_fade_draw_target == ex_camera_draw_target_event and view_current == _view) {
    
        // draw and update fade
        var _value_fade_color = _ex_cameras[# _ex_camera._fade_color, _i];
        
        draw_set_alpha(_value_fade_alpha);
        draw_set_color(_value_fade_color);
        draw_rectangle(
            __view_get( e__VW.XView, _view )-_value_safe_area,
            __view_get( e__VW.YView, _view )-_value_safe_area,
            __view_get( e__VW.XView, _view )+__view_get( e__VW.WView, _view )+_value_safe_area,
            __view_get( e__VW.YView, _view )+__view_get( e__VW.HView, _view )+_value_safe_area,
            false
        );
        draw_set_alpha(1.0);
        draw_set_color(c_white);
        
    }
    
    // get shake offsets
    var _shake_offset_x = 0;
    var _shake_offset_y = 0;
    var _shake_offset_angle = 0;
    
     // handle shake effect
    if (_ex_cameras[# _ex_camera._is_shaking, _table_row] == true) {
        
        var _shake_start       = _ex_cameras[# _ex_camera._shake_start,    _table_row];
        var _shake_end         = _ex_cameras[# _ex_camera._shake_end,      _table_row];
        var _shake_tween_position    = _ex_cameras[# _ex_camera._shake_tween_position, _table_row];
        var _shake_tween_duration    = _ex_cameras[# _ex_camera._shake_tween_duration, _table_row];
        var _shake_tween_easing      = _ex_cameras[# _ex_camera._shake_tween_easing,   _table_row];
        var _shake_power_x = _ex_cameras[# _ex_camera._shake_power_x, _table_row];
        var _shake_power_y = _ex_cameras[# _ex_camera._shake_power_y, _table_row];
        var _shake_power_angle = _ex_cameras[# _ex_camera._shake_power_angle, _table_row];
        
        var _shake_x = 0;
        var _shake_y = 0;
        var _shake_angle = 0;
        
        _shake_tween_position += 1;

        if (_shake_tween_easing == -1) {
            _shake_x = lerp(_shake_power_x, 0, ex_camera_math_smoothstep(0, 1, _shake_tween_position / _shake_tween_duration));
            _shake_y = lerp(_shake_power_y, 0, ex_camera_math_smoothstep(0, 1, _shake_tween_position / _shake_tween_duration));
            _shake_angle = lerp(_shake_power_angle, 0, ex_camera_math_smoothstep(0, 1, _shake_tween_position / _shake_tween_duration));
        } else {
            _shake_x = lerp(_shake_power_x, 0, script_execute(_shake_tween_easing, _shake_tween_position, 0, clamp(_shake_tween_position * _shake_tween_duration, 0, 1), _shake_tween_duration));
            _shake_y = lerp(_shake_power_y, 0, script_execute(_shake_tween_easing, _shake_tween_position, 0, clamp(_shake_tween_position * _shake_tween_duration, 0, 1), _shake_tween_duration));
            _shake_angle = lerp(_shake_power_angle, 0, script_execute(_shake_tween_easing, _shake_tween_position, 0, clamp(_shake_tween_position * _shake_tween_duration, 0, 1), _shake_tween_duration));
        } 
        
        // update shake offset
        _shake_offset_x = random_range(-_shake_x, _shake_x);
        _shake_offset_y = random_range(-_shake_y, _shake_y);
        _shake_offset_angle = random_range(-_shake_angle, _shake_angle);
        
        // update shake position
        _ex_cameras[# _ex_camera._shake_tween_position, _table_row] = _shake_tween_position;
        
        // if over duration, stop shaking
        if (_shake_tween_position >= _shake_tween_duration) {
            
            __view_set( e__VW.Angle, _view, _ex_cameras[# _ex_camera._tilt_angle, _table_row] );
            
            _ex_cameras[# _ex_camera._shake_power_x, _table_row] = 0;
            _ex_cameras[# _ex_camera._shake_power_y, _table_row] = 0;
            _ex_cameras[# _ex_camera._shake_power_angle, _table_row] = 0;
            
            _shake_offset_x = 0;
            _shake_offset_y = 0;
            _shake_offset_angle = 0;
            
            _ex_cameras[# _ex_camera._is_shaking, _table_row] = false;
            _ex_cameras[# _ex_camera._shake_tween_duration, _table_row] = -1;
            if (ex_camera_get_debug_mode()) {
                show_debug_message("exCamera: Camera \""+_name+"\" has ended shaking");
            }
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._shake_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._shake_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._shake_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._shake_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
        
    }
    
    // get zoom offsets
    var _zoom_x_offset = _ex_cameras[# _ex_camera._zoom_offset_x, _table_row];
    var _zoom_y_offset = _ex_cameras[# _ex_camera._zoom_offset_y, _table_row];

    // handle resize effect
    if (_ex_cameras[# _ex_camera._is_resizing, _table_row] == true) {
        
        var _resize_tween_position =  _ex_cameras[# _ex_camera._resize_tween_position, _table_row];
        var _resize_tween_duration =  _ex_cameras[# _ex_camera._resize_tween_duration, _table_row];
        var _resize_tween_easing   =  _ex_cameras[# _ex_camera._resize_tween_easing,   _table_row];
        
        var _resize_start_x  = _ex_cameras[# _ex_camera._resize_start_x,  _table_row];
        var _resize_end_x    = _ex_cameras[# _ex_camera._resize_end_x,  _table_row]; 

        var _resize_start_y  = _ex_cameras[# _ex_camera._resize_start_y,  _table_row];
        var _resize_end_y    = _ex_cameras[# _ex_camera._resize_end_y,  _table_row]; 
                
        var _resize_start_width  =  _ex_cameras[# _ex_camera._resize_start_width,  _table_row];
        var _resize_start_height =  _ex_cameras[# _ex_camera._resize_start_height, _table_row];
        
        var _resize_end_width  = _ex_cameras[# _ex_camera._resize_end_width,  _table_row]; 
        var _resize_end_height = _ex_cameras[# _ex_camera._resize_end_height, _table_row];   

        var _resize_value_x = __view_get( e__VW.XPort, _view );
        var _resize_value_y = __view_get( e__VW.YPort, _view );
                
        var _resize_value_width = _ex_cameras[# _ex_camera._width,  _table_row];
        var _resize_value_height = _ex_cameras[# _ex_camera._height,  _table_row];
        
        _resize_tween_position += 1;
        
        if (_resize_tween_easing == -1) {
            _resize_value_x  = lerp(_resize_start_x,  _resize_end_x,  ex_camera_math_smoothstep(0, 1, _resize_tween_position / _resize_tween_duration));
            _resize_value_y  = lerp(_resize_start_y,  _resize_end_y, ex_camera_math_smoothstep(0, 1, _resize_tween_position / _resize_tween_duration));
            _resize_value_width  = lerp(_resize_start_width,  _resize_end_width,  ex_camera_math_smoothstep(0, 1, _resize_tween_position / _resize_tween_duration));
            _resize_value_height = lerp(_resize_start_height, _resize_end_height, ex_camera_math_smoothstep(0, 1, _resize_tween_position / _resize_tween_duration));
        } else {
            _resize_value_x  = lerp(_resize_start_x,  _resize_end_x,  script_execute(_resize_tween_easing, _resize_tween_position,  0, clamp(_resize_tween_position * _resize_tween_duration, 0, 1), _resize_tween_duration));
            _resize_value_y  = lerp(_resize_start_y, _resize_end_y, script_execute(_resize_tween_easing, _resize_tween_position, 0, clamp(_resize_tween_position * _resize_tween_duration, 0, 1), _resize_tween_duration));
            _resize_value_width  = lerp(_resize_start_width,  _resize_end_width,  script_execute(_resize_tween_easing, _resize_tween_position,  0, clamp(_resize_tween_position * _resize_tween_duration, 0, 1), _resize_tween_duration));
            _resize_value_height = lerp(_resize_start_height, _resize_end_height, script_execute(_resize_tween_easing, _resize_tween_position, 0, clamp(_resize_tween_position * _resize_tween_duration, 0, 1), _resize_tween_duration));
        } 
        
        __view_set( e__VW.XPort, _view, _resize_value_x );
        __view_set( e__VW.YPort, _view, _resize_value_y );
        __view_set( e__VW.WPort, _view, _resize_value_width );
        __view_set( e__VW.HPort, _view, _resize_value_height );
        __view_set( e__VW.WView, _view, _resize_value_width );
        __view_set( e__VW.HView, _view, _resize_value_height );
        
        _ex_cameras[# _ex_camera._width,   _table_row] = _resize_value_width;
        _ex_cameras[# _ex_camera._height,  _table_row] = _resize_value_height;
        
        _ex_cameras[# _ex_camera._resize_tween_position, _table_row] = _resize_tween_position;
        
        if (_resize_tween_position >= _resize_tween_duration) {
            
            _ex_cameras[# _ex_camera._width,  _table_row] = _resize_end_width;
            _ex_cameras[# _ex_camera._height, _table_row] = _resize_end_height;
            
            _ex_cameras[# _ex_camera._is_resizing, _table_row] = false;
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._resize_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._resize_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._resize_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._resize_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
    
    }
        
    // handle zoom effect
    if (_ex_cameras[# _ex_camera._is_zooming, _table_row] == true) {

        var _zoom_tween_position    =  _ex_cameras[# _ex_camera._zoom_tween_position, _table_row];
        var _zoom_tween_duration    =  _ex_cameras[# _ex_camera._zoom_tween_duration, _table_row];
        var _zoom_tween_easing      =  _ex_cameras[# _ex_camera._zoom_tween_easing,   _table_row];
        var _zoom_scale       =  _ex_cameras[# _ex_camera._zoom_scale,    _table_row];
        
        var _zoom_start_x     = _ex_cameras[# _ex_camera._zoom_start_x, _table_row];
        var _zoom_start_y     = _ex_cameras[# _ex_camera._zoom_start_y, _table_row];
        var _zoom_start_scale       = _ex_cameras[# _ex_camera._zoom_start_scale,  _table_row];
        
        var _zoom_end_x       = _ex_cameras[# _ex_camera._zoom_end_x,  _table_row];
        var _zoom_end_y       = _ex_cameras[# _ex_camera._zoom_end_y,  _table_row];
        var _zoom_end_scale   = _ex_cameras[# _ex_camera._zoom_end_scale,   _table_row];
        
        var _zoom_offset_x    = _ex_cameras[# _ex_camera._zoom_offset_x, _table_row];
        var _zoom_offset_y    = _ex_cameras[# _ex_camera._zoom_offset_y, _table_row];
        
        _zoom_tween_position += 1;

        // tween zoom scale
        if (_zoom_tween_easing == -1) {
            _zoom_scale = lerp(_zoom_start_scale, _zoom_end_scale, ex_camera_math_smoothstep(0, 1, _zoom_tween_position / _zoom_tween_duration));
        } else {
            _zoom_scale = lerp(_zoom_start_scale, _zoom_end_scale, script_execute(_zoom_tween_easing, _zoom_tween_position, 0, clamp(_zoom_tween_position * _zoom_tween_duration, 0, 1), _zoom_tween_duration));
        }
        
        // update view size
        __view_set( e__VW.WView, _view, __view_get( e__VW.WPort, _view ) * (_zoom_scale / 100) );
        __view_set( e__VW.HView, _view, __view_get( e__VW.HPort, _view ) * (_zoom_scale / 100) );
        
        // tween x,y position in relation to the zoom scale
        if (_zoom_tween_easing == -1) {
            var _zoom_x = lerp(_zoom_start_x, _zoom_end_x, ex_camera_math_smoothstep(0, 1, _zoom_tween_position / _zoom_tween_duration));
            var _zoom_y = lerp(_zoom_start_y, _zoom_end_y, ex_camera_math_smoothstep(0, 1, _zoom_tween_position / _zoom_tween_duration));
        } else {
            var _zoom_x = lerp(_zoom_start_x, _zoom_end_x, script_execute(_zoom_tween_easing, _zoom_tween_position, 0, clamp(_zoom_tween_position * _zoom_tween_duration, 0, 1), _zoom_tween_duration));
            var _zoom_y = lerp(_zoom_start_y, _zoom_end_y, script_execute(_zoom_tween_easing, _zoom_tween_position, 0, clamp(_zoom_tween_position * _zoom_tween_duration, 0, 1), _zoom_tween_duration));
        }
        
        _zoom_x_offset = _zoom_x;
        _zoom_y_offset = _zoom_y;
        
        // update tween position
        _ex_cameras[# _ex_camera._zoom_tween_position, _table_row] = _zoom_tween_position;
        
        // update zoom offset
        _ex_cameras[# _ex_camera._zoom_offset_x, _table_row] = _zoom_x;
        _ex_cameras[# _ex_camera._zoom_offset_y, _table_row] = _zoom_y;
        
        // update zoom scale
        _ex_cameras[# _ex_camera._zoom_scale, _table_row] = _zoom_scale;
        
        // if over duration, stop zooming
        if (_zoom_tween_position >= _zoom_tween_duration) {
            
            _ex_cameras[# _ex_camera._zoom_tween_duration, _table_row] = -1;
            _ex_cameras[# _ex_camera._zoom_scale, _table_row] = _zoom_end_scale;
            
            _ex_cameras[# _ex_camera._is_zooming, _table_row] = false;
            
            _zoom_x_offset = _zoom_end_x;
            _zoom_y_offset = _zoom_end_y;
            
            _ex_cameras[# _ex_camera._zoom_offset_x, _table_row] = _zoom_end_x;
            _ex_cameras[# _ex_camera._zoom_offset_y, _table_row] = _zoom_end_y;
            
            
            
            if (ex_camera_get_debug_mode()) {
                show_debug_message("exCamera: Camera \""+_name+"\" has ended zooming");
                //show_debug_message("OFFSETS: "+string(_zoom_x_offset)+", "+string(_zoom_y_offset));
            }
            
            /* */
            // get script
            var _script = _ex_cameras[# _ex_camera._zoom_oncomplete, _table_row];
            
            if (_script > -1) {
                
                var _script_args = _ex_cameras[# _ex_camera._zoom_oncomplete_arguments, _table_row];
                
                if (is_real(_script_args) or is_string(_script_args)) {
                    
                    if (_script_args == ex_camera_arguments_undefined) {
                        script_execute(_script);
                    } else {
                        script_execute(_script, _script_args);
                    }
                
                } else if (is_array(_script_args)) {
                    
                    var _length = array_length_1d(_script_args);
                    
                    switch (_length) {
                        case 0: script_execute(_script); break;
                        case 1: script_execute(_script, _script_args[0]); break;
                        case 2: script_execute(_script, _script_args[0], _script_args[1]); break;
                        case 3: script_execute(_script, _script_args[0], _script_args[1], _script_args[2]); break;
                        case 4: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3]); break;
                        case 5: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4]); break;
                        case 6: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5]); break;
                        case 7: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6]); break;
                        case 8: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7]); break;
                        case 9: script_execute(_script, _script_args[0], _script_args[1], _script_args[2], _script_args[3], _script_args[4], _script_args[5], _script_args[6], _script_args[7], _script_args[8]); break;
                        // ...
                        default: 
                            if (ex_camera_get_debug_mode()) {
                                show_debug_message("exCamera: Error in camera with name: \""+string( _name )+"\", onComplete script to trigger has too few (less than 0) or too many arguments (max 9 [0-8] allowed)");
                            }
                            break;
                    }
                
                } else {
                    
                    script_execute(_script);
                }
                
                // reset script
                _ex_cameras[# _ex_camera._zoom_oncomplete, _table_row] = -1;
                _ex_cameras[# _ex_camera._zoom_oncomplete_arguments, _table_row] = ex_camera_arguments_undefined;
            }
            /* */
            
        }
        
    }
       
    // update coordinates
    __view_set( e__VW.XView, _view, _scroll_x_offset+_zoom_x_offset+_shake_offset_x );
    __view_set( e__VW.YView, _view, _scroll_y_offset+_zoom_y_offset+_shake_offset_y );
    
    __view_set( e__VW.Angle, _view, _ex_cameras[# _ex_camera._tilt_angle, _table_row]+_shake_offset_angle );

    
}


/* */
/*  */
