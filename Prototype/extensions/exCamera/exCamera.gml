#define ex_camera_clear_bounds
/// @description ex_camera_clear_bounds(cameraName)
/// @function ex_camera_clear_bounds
/// @param cameraName

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;

// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
            show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }

    return 0;
}

_list[# _ex_camera._bound_x,      _table_row] = -1;
_list[# _ex_camera._bound_y,      _table_row] = -1;
_list[# _ex_camera._bound_width,  _table_row] = -1;
_list[# _ex_camera._bound_height, _table_row] = -1;

return 1;




#define ex_camera_count
/// @description ex_camera_count()
/// @function ex_camera_count

var _list = obj_ex_camera._ex_cameras;

if (_list == -1) {
    return 0;
}

var _ds_height = ds_grid_height(_list);

if (_ds_height < 2) {

    if (_list[# 0, 0] == "") {
        return 0;
    }

}

return _ds_height;





#define ex_camera_create
/// @description ex_camera_create(name, view, x, y, width, height, scrollX, scrollY, angle, zoom, focusInstance, limitBounds, boundX, boundY, boundWidth, boundHeight)
/// @function ex_camera_create
/// @param name
/// @param  view
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  scrollX
/// @param  scrollY
/// @param  angle
/// @param  zoom
/// @param  focusInstance
/// @param  limitBounds
/// @param  boundX
/// @param  boundY
/// @param  boundWidth
/// @param  boundHeight

var _table           = obj_ex_camera._ex_cameras;
var _table_max_size  = _ex_camera._length;
var _autoincrement   = 0;
var _name            = argument[0];
var _view            = argument[1];
var _instance        = noone;
var _x               = 0;
var _y               = 0;
var _xport           = 0;
var _yport           = 0;
var _width           = __view_get( e__VW.WView, _view );
var _height          = __view_get( e__VW.HView, _view );
var _angle           = __view_get( e__VW.Angle, _view );
var _zoom            = 100;
var _limit_bounds    = true;
var _bound_x         = 0;
var _bound_y         = 0;
var _bound_width     = room_width;
var _bound_height    = room_height;

if (argument_count >= 3) {
    _xport = argument[2];
}

if (argument_count >= 4) {
    _yport = argument[3];
}

if (argument_count >= 5) {
    if (argument[4] > 0) {
        _width = argument[4];
        __view_set( e__VW.WView, _view, _width );
        __view_set( e__VW.WPort, _view, _width );
    }
}

if (argument_count >= 6) {
    if (argument[5] > 0) {
        _height = argument[5];
        __view_set( e__VW.HView, _view, _height );
        __view_set( e__VW.HPort, _view, _height );
    }
}

if (argument_count >= 7) {
    _x = argument[6];
}

if (argument_count >= 8) {
    _y = argument[7];
}

if (argument_count >= 9) {
    _angle = argument[8];
}

if (argument_count >= 10) {
    _zoom = argument[9];
}

if (argument_count >= 11) {
    _instance = argument[10];
}

if (argument_count >= 12) {
    _limit_bounds = argument[11];
}

if (argument_count >= 13) {
    _bound_x = argument[12];
}

if (argument_count >= 14) {
    _bound_y = argument[13];
}

if (argument_count >= 15) {
    _bound_width = argument[14];
}

if (argument_count >= 16) {
    _bound_height = argument[15];
}

// create or update the list
if (ds_exists(_table, ds_type_grid)) {
    
    // workaround
    if (_table[# 0, 0] == "") {
    
    } else {
    
        ds_grid_resize(_table, _table_max_size, ds_grid_height(_table)+1);
        _autoincrement = ds_grid_height(_table)-1;
    
    }

} else {
    obj_ex_camera._ex_cameras = ds_grid_create(_table_max_size, 0);
    _table = obj_ex_camera._ex_cameras;
    ds_grid_resize(_table, _table_max_size, ds_grid_height(_table)+1);
}

// check if item with the same name exists
var _row = ds_grid_value_y(_table, 0, 0, ds_grid_width(_table), ds_grid_height(_table), _name);
if (_row > -1) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, camera name \""+string( _name )+"\" already exists, camera names must be unique");
    }
    return -1;
}

__view_set( e__VW.XPort, _view, _xport );
__view_set( e__VW.YPort, _view, _yport );

__view_set( e__VW.Angle, _view, _angle );

if (_limit_bounds == false) {
    _bound_x      = -1;
    _bound_y      = -1;
    _bound_width  = -1;
    _bound_height = -1;
}

// add item to list
_table[# _ex_camera._name,            _autoincrement] = _name;
_table[# _ex_camera._view,            _autoincrement] = _view;
_table[# _ex_camera._width,           _autoincrement] = _width;
_table[# _ex_camera._height,          _autoincrement] = _height;
_table[# _ex_camera._bound_x,         _autoincrement] = _bound_x;
_table[# _ex_camera._bound_y,         _autoincrement] = _bound_y;
_table[# _ex_camera._bound_width,     _autoincrement] = _bound_width;
_table[# _ex_camera._bound_height,    _autoincrement] = _bound_height;
_table[# _ex_camera._safe_area,  _autoincrement] = 128;
_table[# _ex_camera._fade_start, _autoincrement] = -1;
_table[# _ex_camera._fade_end, _autoincrement] = -1;
_table[# _ex_camera._fade_tween_position, _autoincrement] = -1;
_table[# _ex_camera._fade_tween_duration, _autoincrement] = -1;
_table[# _ex_camera._fade_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._fade_color, _autoincrement] = c_black;
_table[# _ex_camera._fade_blend, _autoincrement] = bm_normal;
_table[# _ex_camera._fade_alpha, _autoincrement] = 0;
_table[# _ex_camera._fade_oncomplete, _autoincrement] = -1;
_table[# _ex_camera._fade_oncomplete_arguments, _autoincrement] = ex_camera_arguments_undefined;
_table[# _ex_camera._fade_draw_target, _autoincrement] = ex_camera_draw_target_event;
_table[# _ex_camera._flash_start, _autoincrement] = -1;
_table[# _ex_camera._flash_end, _autoincrement] = -1;
_table[# _ex_camera._flash_tween_position, _autoincrement] = -1;
_table[# _ex_camera._flash_tween_duration, _autoincrement] = -1;
_table[# _ex_camera._flash_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._flash_color, _autoincrement] = c_white;
_table[# _ex_camera._flash_blend, _autoincrement] = bm_add;
_table[# _ex_camera._flash_draw_target, _autoincrement] = ex_camera_draw_target_event;
_table[# _ex_camera._flash_alpha, _autoincrement] = 1;
_table[# _ex_camera._flash_oncomplete, _autoincrement] = -1;
_table[# _ex_camera._flash_oncomplete_arguments, _autoincrement] = ex_camera_arguments_undefined;
_table[# _ex_camera._flash_start, _autoincrement] = -1;
_table[# _ex_camera._shake_start, _autoincrement] = -1;
_table[# _ex_camera._shake_end, _autoincrement] = -1;
_table[# _ex_camera._shake_tween_duration, _autoincrement] = -1;
_table[# _ex_camera._shake_tween_position, _autoincrement] = -1;
_table[# _ex_camera._shake_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._shake_power_x, _autoincrement] = 0;
_table[# _ex_camera._shake_power_y, _autoincrement] = 0;
_table[# _ex_camera._shake_power_angle, _autoincrement] = 0;
_table[# _ex_camera._shake_oncomplete, _autoincrement] = -1;
_table[# _ex_camera._shake_oncomplete_arguments, _autoincrement] = ex_camera_arguments_undefined;
_table[# _ex_camera._zoom_start_scale, _autoincrement] = -1;
_table[# _ex_camera._zoom_end_scale, _autoincrement] = -1;
_table[# _ex_camera._zoom_tween_duration, _autoincrement] = -1;
_table[# _ex_camera._zoom_tween_position, _autoincrement] = -1;
_table[# _ex_camera._zoom_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._zoom_scale, _autoincrement] = 100;
_table[# _ex_camera._zoom_offset_x, _autoincrement] = 0;
_table[# _ex_camera._zoom_offset_y, _autoincrement] = 0;
_table[# _ex_camera._zoom_start_x, _autoincrement] = 0;
_table[# _ex_camera._zoom_start_y, _autoincrement] = 0;
_table[# _ex_camera._zoom_end_x, _autoincrement] = 0;
_table[# _ex_camera._zoom_end_y, _autoincrement] = 0;
_table[# _ex_camera._zoom_oncomplete, _autoincrement] = -1;
_table[# _ex_camera._zoom_oncomplete_arguments, _autoincrement] = ex_camera_arguments_undefined;
_table[# _ex_camera._tilt_start, _autoincrement] = -1;
_table[# _ex_camera._tilt_end, _autoincrement] = -1;
_table[# _ex_camera._tilt_tween_duration, _autoincrement] = -1;
_table[# _ex_camera._tilt_tween_position, _autoincrement] = -1;
_table[# _ex_camera._tilt_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._tilt_angle, _autoincrement] = _angle;
_table[# _ex_camera._tilt_oncomplete, _autoincrement] = -1;
_table[# _ex_camera._tilt_oncomplete_arguments, _autoincrement] = ex_camera_arguments_undefined;
_table[# _ex_camera._scroll_x, _autoincrement] = _x;
_table[# _ex_camera._scroll_y, _autoincrement] = _y;
_table[# _ex_camera._scroll_start_x, _autoincrement] = 0;
_table[# _ex_camera._scroll_start_y, _autoincrement] = 0;
_table[# _ex_camera._scroll_end_x, _autoincrement] = 0;
_table[# _ex_camera._scroll_end_y, _autoincrement] = 0;
_table[# _ex_camera._scroll_tween_duration, _autoincrement] = -1;
_table[# _ex_camera._scroll_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._scroll_tween_position, _autoincrement] = -1;
_table[# _ex_camera._scroll_oncomplete, _autoincrement] = -1;
_table[# _ex_camera._scroll_oncomplete_arguments, _autoincrement] = ex_camera_arguments_undefined;
_table[# _ex_camera._is_scrolling, _autoincrement] = false;
_table[# _ex_camera._is_zooming, _autoincrement] = false;
_table[# _ex_camera._is_flashing, _autoincrement] = false;
_table[# _ex_camera._is_fading, _autoincrement] = false;
_table[# _ex_camera._is_tilting, _autoincrement] = false;
_table[# _ex_camera._is_shaking, _autoincrement] = false;
_table[# _ex_camera._is_resizing, _autoincrement] = false;
_table[# _ex_camera._resize_tween_position, _autoincrement] = 0;
_table[# _ex_camera._resize_tween_duration, _autoincrement] = 0;
_table[# _ex_camera._resize_tween_easing, _autoincrement] = -1;
_table[# _ex_camera._resize_start_width, _autoincrement] = 0;
_table[# _ex_camera._resize_start_height, _autoincrement] = 0;
_table[# _ex_camera._resize_end_width, _autoincrement] = 0;
_table[# _ex_camera._resize_end_height, _autoincrement] = 0;
_table[# _ex_camera._resize_start_x, _autoincrement] = 0;
_table[# _ex_camera._resize_end_x, _autoincrement] = 0;
_table[# _ex_camera._resize_start_y, _autoincrement] = 0;
_table[# _ex_camera._resize_end_y, _autoincrement] = 0;

// base
var _view_w_half = _width/2;
var _view_h_half = _height/2;

var _ratio_x = (_view_w_half)/100;
var _ratio_y = (_view_h_half)/100;
// base

if (_instance != noone and instance_exists(_instance)) {

    // unclamped
    var _focus_x_u = _instance.x-(_view_w_half)+(_instance.sprite_width/2)+_x;
    var _focus_y_u = _instance.y-(_view_h_half)+(_instance.sprite_height/2)+_y;   
        
    // clamped
    var _focus_x = clamp(_instance.x-(_view_w_half)+(_instance.sprite_width/2)+_x,  _bound_x, _bound_width-_width);
    var _focus_y = clamp(_instance.y-(_view_h_half)+(_instance.sprite_height/2)+_y, _bound_y, _bound_height-_height);
    
    var _sprite_width_scaled  = _instance.sprite_width/2*(_zoom/100);
    var _sprite_height_scaled = _instance.sprite_height/2*(_zoom/100);

} else {

    // unclamped
    var _focus_x_u = __view_get( e__VW.XView, _view );
    var _focus_y_u = __view_get( e__VW.YView, _view );   
        
    // clamped
    var _focus_x = clamp(__view_get( e__VW.XView, _view ), _bound_x, _bound_width-_width);
    var _focus_y = clamp(__view_get( e__VW.YView, _view ), _bound_y, _bound_height-_height);
    
    var _sprite_width_scaled  = 0;
    var _sprite_height_scaled = 0;
    
}

if (_limit_bounds == true) {
    
    //show_debug_message("---CLAMPED");
    _focus_x += _x;
    _focus_y += _y;
    
    // first move
    __view_set( e__VW.XView, _view, _focus_x );
    __view_set( e__VW.YView, _view, _focus_y );    
    
    // update the grid
    _table[# _ex_camera._scroll_x, _autoincrement] = _focus_x;
    _table[# _ex_camera._scroll_y, _autoincrement] = _focus_y;    
    
    // zoom
    __view_set( e__VW.WView, _view, __view_get( e__VW.WPort, _view ) * (_zoom / 100) );
    __view_set( e__VW.HView, _view, __view_get( e__VW.HPort, _view ) * (_zoom / 100) );
    
    // get final zoom offset
    var _zoom_end_x = __view_get( e__VW.XView, _view )+(100 - _zoom)*( _ratio_x )-_x;
    var _zoom_end_y = __view_get( e__VW.YView, _view )+(100 - _zoom)*( _ratio_y )-_y;
    
    _zoom_end_x = _zoom_end_x-_focus_x;
    _zoom_end_y = _zoom_end_y-_focus_y;
    
    // add the zoom offset
    __view_set( e__VW.XView, _view, __view_get( e__VW.XView, _view ) + (_zoom_end_x) );
    __view_set( e__VW.YView, _view, __view_get( e__VW.YView, _view ) + (_zoom_end_y) ); 
    
    // update the grid
    _table[# _ex_camera._zoom_scale,    _autoincrement] = _zoom;
    _table[# _ex_camera._zoom_offset_x, _autoincrement] = _zoom_end_x;
    _table[# _ex_camera._zoom_offset_y, _autoincrement] = _zoom_end_y;    
    
} else {
    
    //show_debug_message("---NOT CLAMPED");

    // no bounds active
    _table[# _ex_camera._bound_x,      _autoincrement] = -1;
    _table[# _ex_camera._bound_y,      _autoincrement] = -1;    
    _table[# _ex_camera._bound_width,  _autoincrement] = -1;
    _table[# _ex_camera._bound_height, _autoincrement] = -1;
    
    _focus_x_u += _x;
    _focus_y_u += _y;
    
    // first move
    __view_set( e__VW.XView, _view, _focus_x_u );
    __view_set( e__VW.YView, _view, _focus_y_u );    
    
    // update the grid
    _table[# _ex_camera._scroll_x, _autoincrement] = _focus_x_u;
    _table[# _ex_camera._scroll_y, _autoincrement] = _focus_y_u;    
    
    // zoom
    __view_set( e__VW.WView, _view, __view_get( e__VW.WPort, _view ) * (_zoom / 100) );
    __view_set( e__VW.HView, _view, __view_get( e__VW.HPort, _view ) * (_zoom / 100) );
    
    // get zoom offset
    var _zoom_end_x = ((_focus_x_u)+( 100 - _zoom )*( _ratio_x ) )-_focus_x_u;
    var _zoom_end_y = ((_focus_y_u)+( 100 - _zoom )*( _ratio_y ) )-_focus_y_u;
    
    // scale to the center of the sprite (if applicable)
    _zoom_end_x -= _sprite_width_scaled;
    _zoom_end_y -= _sprite_height_scaled;
    
    // add the zoom offset
    __view_set( e__VW.XView, _view, __view_get( e__VW.XView, _view ) + (_zoom_end_x) );
    __view_set( e__VW.YView, _view, __view_get( e__VW.YView, _view ) + (_zoom_end_y) ); 
    
    // update the grid
    _table[# _ex_camera._zoom_scale,    _autoincrement] = _zoom;
    _table[# _ex_camera._zoom_offset_x, _autoincrement] = _zoom_end_x;
    _table[# _ex_camera._zoom_offset_y, _autoincrement] = _zoom_end_y;    

}
    
if (view_enabled == false) {
    view_enabled = true;
}

__view_set( e__VW.Visible, _view, true );

if (ex_camera_get_debug_mode()) {
    var _row = ds_grid_value_y(_table, 0, 0, 1, ds_grid_height(_table), string( _name ));
    show_debug_message("exCamera: Created camera with name \""+_name+"\" ["+string( _row )+"]");
}

// return grid y position
return _autoincrement;




#define ex_camera_destroy
/// @description ex_camera_destroy(cameraName)
/// @function ex_camera_destroy
/// @param cameraName

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;

// check name column
var _y = ds_grid_value_y(_list, 0, 0, 1, ds_grid_height(_list), _name);
if (_y < 0) {

if (ex_camera_get_debug_mode()) {
    show_debug_message("exCamera: Error, could not find camera with name \""+string( _name )+"\"");
}

    return 0;
}

// remove item
if (ds_grid_height(_list) < 2) {

    ds_grid_clear(_list, "");
    ds_grid_resize(_list, ds_grid_width(_list), 1);

} else {
    ex_camera_ds_grid_delete_y(_list, _y, true);
}


if (ex_camera_get_debug_mode()) {
    show_debug_message("exCamera: Removed camera with name \""+_name+"\"");
}

return 1;





#define ex_camera_fade
/// @description ex_camera_fade(cameraName, alpha, duration, easing, color, onComplete, onCompleteArguments)
/// @function ex_camera_fade
/// @param cameraName
/// @param  alpha
/// @param  duration
/// @param  easing
/// @param  color
/// @param  onComplete
/// @param  onCompleteArguments

var _name   = argument[0];
var _list   = obj_ex_camera._ex_cameras;
var _alpha  = argument[1];
var _duration = argument[2];
var _easing = -1;
var _oncomplete = -1;
var _arguments  = ex_camera_arguments_undefined;
var _color = c_black;

// arguments
if (argument_count >= 4) {
    _easing = argument[3];
}


if (argument_count >= 6) {
    _oncomplete = argument[5];
}

if (argument_count >= 7) {
    _arguments = argument[6];
}

// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    
    return 0;
    
}

if (argument_count >= 5) {
    _color = argument[4];
    _list[# _ex_camera._fade_color, _table_row] = _color;
}

_list[# _ex_camera._fade_start, _table_row] = _list[# _ex_camera._fade_alpha, _table_row];
_list[# _ex_camera._fade_end, _table_row] = _alpha;
_list[# _ex_camera._fade_tween_duration, _table_row] = _duration;
_list[# _ex_camera._fade_tween_position, _table_row] = -1;
_list[# _ex_camera._fade_tween_easing, _table_row] = _easing;
_list[# _ex_camera._fade_oncomplete, _table_row] = _oncomplete;
_list[# _ex_camera._fade_oncomplete_arguments, _table_row] = _arguments;

_list[# _ex_camera._is_fading, _table_row] = true;

if (ex_camera_get_debug_mode()) {
    show_debug_message("exCamera: camera \""+_name+"\" has started fading");
}

return 1;






#define ex_camera_fade_in
/// @description ex_camera_fade_in(cameraName, duration, easing, color, onComplete, onCompleteArguments)
/// @function ex_camera_fade_in
/// @param cameraName
/// @param  duration
/// @param  easing
/// @param  color
/// @param  onComplete
/// @param  onCompleteArguments

var _easing     = -1;
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;
var _color      = ex_camera_get_fade_color(argument[0]);

if (argument_count >= 3) {
    _easing = argument[2];
}

if (argument_count >= 4) {
    _color = argument[3];
}

if (argument_count >= 5) {
    _oncomplete = argument[4];
}

if (argument_count >= 6) {
    _oncomplete_arguments = argument[5];
}

return ex_camera_fade(argument[0], 0, argument[1], _easing, _color, _oncomplete, _oncomplete_arguments);




#define ex_camera_fade_out
/// @description ex_camera_fade_out(cameraName, duration, easing, color, onComplete, onCompleteArguments)
/// @function ex_camera_fade_out
/// @param cameraName
/// @param  duration
/// @param  easing
/// @param  color
/// @param  onComplete
/// @param  onCompleteArguments

var _easing     = -1;
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;
var _color      = ex_camera_get_fade_color(argument[0]);

if (argument_count >= 3) {
    _easing = argument[2];
}

if (argument_count >= 4) {
    _color = argument[3];
}

if (argument_count >= 5) {
    _oncomplete = argument[4];
}

if (argument_count >= 6) {
    _oncomplete_arguments = argument[5];
}



return ex_camera_fade(argument[0], 1, argument[1], _easing, _color, _oncomplete, _oncomplete_arguments);





#define ex_camera_flash
/// @description ex_camera_flash(cameraName, intensity, duration, easing, color, blendMode, onComplete, onCompleteArguments)
/// @function ex_camera_flash
/// @param cameraName
/// @param  intensity
/// @param  duration
/// @param  easing
/// @param  color
/// @param  blendMode
/// @param  onComplete
/// @param  onCompleteArguments

var _name       = argument[0];
var _list       = obj_ex_camera._ex_cameras;
var _intensity  = 1.0;
var _duration   = 12;
var _easing     = -1;
var _color      = c_white;
var _blend      = bm_add;
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

if (argument_count >= 2) {
    _intensity = argument[1];
}

if (argument_count >= 3) {
    _duration = argument[2];
}

if (argument_count >= 4) {
    _easing = argument[3];
}


// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }

return 0;
}


if (argument_count >= 5) {
    _color = argument[4];
    _list[# _ex_camera._flash_color, _table_row] = _color;
}

if (argument_count >= 6) {
    _blend = argument[5];
    _list[# _ex_camera._flash_blend, _table_row] = _blend;
}

if (argument_count >= 7) {
    _oncomplete = argument[6];
    _list[# _ex_camera._flash_oncomplete, _table_row] = _oncomplete;
}

if (argument_count >= 8) {
    _oncomplete_arguments = argument[7];
    _list[# _ex_camera._flash_oncomplete_arguments, _table_row] = _oncomplete_arguments;
}

_list[# _ex_camera._flash_start, _table_row] = _intensity;
_list[# _ex_camera._flash_end, _table_row] = _duration;
_list[# _ex_camera._flash_tween_duration, _table_row] = _duration
_list[# _ex_camera._flash_tween_position, _table_row] = -1;
_list[# _ex_camera._flash_tween_easing, _table_row] = _easing;
_list[# _ex_camera._flash_alpha, _table_row] = _intensity;

_list[# _ex_camera._is_flashing, _table_row] = true;

if (ex_camera_get_debug_mode()) {
    show_debug_message("exCamera: camera \""+_name+"\" has started flashing");
}

return 1;





#define ex_camera_get_debug_mode
/// @description ex_camera_get_debug_mode()
/// @function ex_camera_get_debug_mode

return obj_ex_camera._ex_camera_debug_mode;





#define ex_camera_get_fade_color
/// @description ex_camera_get_fade_color(cameraName)
/// @function ex_camera_get_fade_color
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._fade_color;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_height
/// @description ex_camera_get_height(cameraName)
/// @function ex_camera_get_height
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._height;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_index
/// @description ex_camera_get_index(cameraName)
/// @function ex_camera_get_index
/// @param cameraName

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;

// check if exists first
if (ex_camera_count() < 1) {
	return -1;
}

var _y = ds_grid_value_y(_list, 0, 0, 1, ds_grid_height(_list), _name);
if (_y < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    _y = -1;
}

return _y;






#define ex_camera_get_name
/// @description ex_camera_get_name(cameraIndex)
/// @function ex_camera_get_name
/// @param cameraIndex

var _index = argument[0];
var _list = obj_ex_camera._ex_cameras;

if (_list < 0) {
    return "";
}

if (_index < 0 or _index > ds_grid_height(_list)) {
    return "";
}

return _list[# _ex_camera._name, _index];





#define ex_camera_get_safe_area
/// @description ex_camera_get_safe_area(cameraName)
/// @function ex_camera_get_safe_area
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._safe_area;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_scroll_position_x
/// @description ex_camera_get_scroll_position_x(cameraName)
/// @function ex_camera_get_scroll_position_x
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._scroll_x;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_scroll_position_y
/// @description ex_camera_get_scroll_position_y(cameraName)
/// @function ex_camera_get_scroll_position_y
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._scroll_y;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_tilt_angle
/// @description ex_camera_get_tilt_angle(cameraName)
/// @function ex_camera_get_tilt_angle
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._tilt_angle;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_view_index
/// @description ex_camera_get_view_index(cameraName)
/// @function ex_camera_get_view_index
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._view;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_width
/// @description ex_camera_get_width(cameraName)
/// @function ex_camera_get_width
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._width;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_get_x
/// @description ex_camera_get_x(cameraName)
/// @function ex_camera_get_x
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._view;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _table_column, _table_row];

return __view_get( e__VW.XPort, _view );





#define ex_camera_get_y
/// @description ex_camera_get_y(cameraName)
/// @function ex_camera_get_y
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._view;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _table_column, _table_row];

return __view_get( e__VW.YPort, _view );





#define ex_camera_get_zoom_offset_x
/// @description ex_camera_get_zoom_offset_x(cameraName)
/// @function ex_camera_get_zoom_offset_x
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._zoom_offset_x;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

return _table[# _table_column, _table_row];





#define ex_camera_get_zoom_offset_y
/// @description ex_camera_get_zoom_offset_y(cameraName)
/// @function ex_camera_get_zoom_offset_y
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._zoom_offset_y;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

return _table[# _table_column, _table_row];





#define ex_camera_get_zoom_scale
/// @description ex_camera_get_zoom_scale(cameraName, normalize)
/// @function ex_camera_get_zoom_scale
/// @param cameraName
/// @param  normalize

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._zoom_scale;
var _default      = 0;
var _percent      = false;

// arguments
var _name = argument[0];

if (argument_count >= 2) {
    _percent = argument[1];    
}

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

if (_percent == true) {
    var _value = _table[# _table_column, _table_row];
    return _value/100.00;
} else {
    return _table[# _table_column, _table_row];
}





#define ex_camera_initialize
/// @description ex_camera_initialize()
/// @function ex_camera_initialize

if (instance_exists(obj_ex_camera)) {

if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Warning, Camera system is already initialized");
    }

    return 0;
}

// create exCamera object
instance_create(0, 0, obj_ex_camera);

return 1;





#define ex_camera_is_shaking
/// @description ex_camera_is_shaking(cameraName)
/// @function ex_camera_is_shaking
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._is_shaking;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// get table row
return _table[# _table_column, _table_row];





#define ex_camera_is_visible
/// @description ex_camera_is_visible(cameraName)
/// @function ex_camera_is_visible
/// @param cameraName

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._view;
var _default      = 0;

// arguments
var _name = argument[0];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _table_column, _table_row];
return __view_get( e__VW.Visible, _view );






#define ex_camera_resize
/// @description ex_camera_resize(cameraName, x, y, width, height, duration, easing, onComplete, onCompleteArguments)
/// @function ex_camera_resize
/// @param cameraName
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  duration
/// @param  easing
/// @param  onComplete
/// @param  onCompleteArguments

// smooth resize camera with animation

var _table               = obj_ex_camera._ex_cameras;
var _table_column_width  = _ex_camera._width;
var _table_column_height = _ex_camera._height;
var _table_column_view   = _ex_camera._view;
var _default             = 0;

// arguments
var _name         = argument[0];
var _value_x      = argument[1];
var _value_y      = argument[2];
var _value_width  = argument[3];
var _value_height = argument[4];

var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

if (argument_count >= 6) {
    _duration = argument[5];
}

if (argument_count >= 7) {
    _easing = argument[6];
}

if (argument_count >= 8) {
    _oncomplete = argument[7];
}

if (argument_count >= 9) {
    _oncomplete_arguments = argument[8];
}

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+string(_name)+"\"");
    }
    return _default;
}

var _view = _table[# _table_column_view,  _table_row];

_table[# _ex_camera._resize_tween_duration,  _table_row] = _duration;
_table[# _ex_camera._resize_tween_easing,  _table_row] = _easing;

_table[# _ex_camera._resize_start_x,  _table_row] = __view_get( e__VW.XPort, _view );
_table[# _ex_camera._resize_start_y,  _table_row] = __view_get( e__VW.YPort, _view );
_table[# _ex_camera._resize_end_x,  _table_row] = _value_x;
_table[# _ex_camera._resize_end_y,  _table_row] = _value_y;

_table[# _ex_camera._resize_start_width,  _table_row] = __view_get( e__VW.WPort, _view );
_table[# _ex_camera._resize_start_height,  _table_row] = __view_get( e__VW.HPort, _view );
_table[# _ex_camera._resize_end_width,  _table_row] = _value_width;
_table[# _ex_camera._resize_end_height,  _table_row] = _value_height;

_table[# _ex_camera._resize_oncomplete,  _table_row] = _oncomplete;
_table[# _ex_camera._resize_oncomplete_arguments,  _table_row] = _oncomplete_arguments;

_table[# _ex_camera._is_resizing,  _table_row] = true;

return 1;






#define ex_camera_scroll_by
/// @description ex_camera_scroll_by(cameraName, x, y, duration, easing, onComplete, onCompleteArguments)
/// @function ex_camera_scroll_by
/// @param cameraName
/// @param  x
/// @param  y
/// @param  duration
/// @param  easing
/// @param  onComplete
/// @param  onCompleteArguments

var _easing   = -1;
var _list     = obj_ex_camera._ex_cameras;

// arguments
var _name       = argument[0];
var _target_x   = argument[1];
var _target_y   = argument[2];
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

if (argument_count >= 4) {
    _duration = argument[3];
}

if (argument_count >= 5) {
    _easing = argument[4];
}

if (argument_count >= 6) {
    _oncomplete = argument[5];
}

if (argument_count >= 7) {
    _oncomplete_arguments = argument[6];
}

var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }

    return 0;
}

var _view      = _list[# _ex_camera._view, _table_row];
var _current_x = _list[# _ex_camera._scroll_x, _table_row];
var _current_y = _list[# _ex_camera._scroll_y, _table_row];

_target_x = _current_x+_target_x;
_target_y = _current_y+_target_y;

ex_camera_scroll_to_point(_name, _target_x, _target_y, _duration, _easing, false, _oncomplete, _oncomplete_arguments);

if (ex_camera_get_debug_mode()) {
    show_debug_message("exCamera: camera \""+_name+"\" has started scrolling by "+string(_target_x)+", "+string(_target_y));
}

return 1;






#define ex_camera_scroll_to_object
/// @description ex_camera_scroll_to_object(cameraName, instanceID, duration, easing, center, onComplete, onCompleteArguments)
/// @function ex_camera_scroll_to_object
/// @param cameraName
/// @param  instanceID
/// @param  duration
/// @param  easing
/// @param  center
/// @param  onComplete
/// @param  onCompleteArguments

var _center       = true;
var _easing       = -1;
var _oncomplete   = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

// arguments
var _name     = argument[0];
var _instance = argument[1];
var _duration = argument[2];

if (argument_count >= 4) {
    _easing = argument[3];
}

if (argument_count >= 5) {
    _center = argument[4];
}

if (argument_count >= 6) {
    _oncomplete = argument[5];
}

if (argument_count >= 7) {
    _oncomplete_arguments = argument[6];
}

if (instance_exists(_instance)) {

    var _target_x = _instance.x;
    var _target_y = _instance.y;
    
    
    ex_camera_scroll_to_point(_name,  _target_x , _target_y, _duration, _easing, _center, _oncomplete, _oncomplete_arguments);    
    
    if (ex_camera_get_debug_mode()) {
    //    show_debug_message('exCamera: camera "'+string(_name)+'" has started scrolling to object');
    }

    return 1;
} else {
    return 0;
}





#define ex_camera_scroll_to_point
/// @description ex_camera_scroll_to_point(cameraName, x, y, duration, easing, center, onComplete, onCompleteArguments)
/// @function ex_camera_scroll_to_point
/// @param cameraName
/// @param  x
/// @param  y
/// @param  duration
/// @param  easing
/// @param  center
/// @param  onComplete
/// @param  onCompleteArguments

var _name   = argument[0];
var _list   = obj_ex_camera._ex_cameras;
var _center = false;
var _easing = -1;
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

// arguments
var _target_x = argument[1];
var _target_y = argument[2];

var _duration = argument[3];

if (argument_count >= 5) {
    _easing = argument[4];
}

if (argument_count >= 6) {
    _center = argument[5];
}

if (argument_count >= 7) {
    _oncomplete = argument[6];
}

if (argument_count >= 8) {
    _oncomplete_arguments = argument[7];
}

// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+string(_name)+"\"");
    }

    return 0;
}


var _view         = _list[# _ex_camera._view, _table_row];

var _bound_x      = _list[# _ex_camera._bound_x, _table_row];
var _bound_y      = _list[# _ex_camera._bound_y, _table_row];
var _bound_width  = _list[# _ex_camera._bound_width, _table_row];
var _bound_height = _list[# _ex_camera._bound_height, _table_row];

var _width   = _list[# _ex_camera._width, _table_row];
var _height  = _list[# _ex_camera._height, _table_row];

if (_center == true) {

    _target_x = _target_x-(_width/2);
    _target_y = _target_y-(_height/2);

    if (_bound_x != -1 and _bound_y != -1 and _bound_width != -1 and _bound_height != -1) {
        _target_x = clamp(_target_x, _bound_x, _bound_width-_width);
        _target_y = clamp(_target_y, _bound_y, _bound_height-_height);
    }

} else {

    if (_bound_x != -1 and _bound_y != -1 and _bound_width != -1 and _bound_height != -1) {
        _target_x = clamp(_target_x, _bound_x, _bound_width-_width);
        _target_y = clamp(_target_y, _bound_y, _bound_height-_height);
    }

}

// cancel motion on no position change
if (
    round(_target_x) == round(_list[# _ex_camera._scroll_x, _table_row]-_list[# _ex_camera._zoom_offset_x, _table_row]) 
    and round(_target_y) == round(_list[# _ex_camera._scroll_y, _table_row]-_list[# _ex_camera._zoom_offset_y, _table_row])
    ) {
    
    //if (ex_camera_get_debug_mode()) {
        //show_debug_message('exCamera: camera "'+string(_name)+'" has no need to scroll (same x,y position detected)');
    //}
    
    return 0;
}

var _follow_x = 0, _follow_y = 0;
/* if (_follow != noone) {

    _follow_x = _follow.x-(_width/2);
    _follow_y = _follow.y-(_height/2);
    
}*/

var _zoom_x_offset = _list[# _ex_camera._zoom_offset_x, _table_row];
var _zoom_y_offset = _list[# _ex_camera._zoom_offset_y, _table_row];

_list[# _ex_camera._scroll_start_x, _table_row] = __view_get( e__VW.XView, _view )-_follow_x-_zoom_x_offset;
_list[# _ex_camera._scroll_end_x, _table_row] = _target_x-_follow_x;

_list[# _ex_camera._scroll_start_y, _table_row] = __view_get( e__VW.YView, _view )-_follow_y-_zoom_y_offset;
_list[# _ex_camera._scroll_end_y, _table_row] = _target_y-_follow_y;

_list[# _ex_camera._scroll_tween_position, _table_row] = 0;

_list[# _ex_camera._scroll_tween_duration, _table_row] = _duration;
_list[# _ex_camera._scroll_tween_easing,   _table_row] = _easing;

_list[# _ex_camera._scroll_oncomplete, _table_row] = _oncomplete;
_list[# _ex_camera._scroll_oncomplete_arguments, _table_row] = _oncomplete_arguments;

_list[# _ex_camera._is_scrolling, _table_row] = true;

if (ex_camera_get_debug_mode()) {
    //show_debug_message('exCamera: camera "'+string(_name)+'" has started scrolling to point: '+string(_target_x)+', '+string(_target_y));
}

return 1;





#define ex_camera_set_bounds
/// @description ex_camera_set_bounds(cameraName, x, y, width, height)
/// @function ex_camera_set_bounds
/// @param cameraName
/// @param  x
/// @param  y
/// @param  width
/// @param  height

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;

// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
            show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }

    return 0;
}

_list[# _ex_camera._bound_x,      _table_row] = argument[1];
_list[# _ex_camera._bound_y,      _table_row] = argument[2];
_list[# _ex_camera._bound_width,  _table_row] = argument[3];
_list[# _ex_camera._bound_height, _table_row] = argument[4];

return 1;





#define ex_camera_set_debug_mode
/// @description ex_camera_set_debug_mode(enabled)
/// @function ex_camera_set_debug_mode
/// @param enabled

obj_ex_camera._ex_camera_debug_mode = argument[0];





#define ex_camera_set_fade_alpha
/// @description ex_camera_set_fade_alpha(cameraName, alpha)
/// @function ex_camera_set_fade_alpha
/// @param cameraName
/// @param  alpha

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._fade_alpha;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_fade_color
/// @description ex_camera_set_fade_color(cameraName, color)
/// @function ex_camera_set_fade_color
/// @param cameraName
/// @param  color

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._fade_color;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_fade_draw_target
/// @description ex_camera_set_fade_draw_target(cameraName, drawTarget)
/// @function ex_camera_set_fade_draw_target
/// @param cameraName
/// @param  drawTarget

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._fade_draw_target;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_flash_blend
/// @description ex_camera_set_flash_blend(cameraName, blendMode)
/// @function ex_camera_set_flash_blend
/// @param cameraName
/// @param  blendMode

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._flash_blend;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_flash_color
/// @description ex_camera_set_flash_color(cameraName, color)
/// @function ex_camera_set_flash_color
/// @param cameraName
/// @param  color

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._flash_color;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_flash_draw_target
/// @description ex_camera_set_flash_draw_target(cameraName, drawTarget)
/// @function ex_camera_set_flash_draw_target
/// @param cameraName
/// @param  drawTarget

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._flash_draw_target;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_position
/// @description ex_camera_set_position(cameraName, x, y)
/// @function ex_camera_set_position
/// @param cameraName
/// @param  x
/// @param  y

var _table               = obj_ex_camera._ex_cameras;
var _table_column_view   = _ex_camera._view;
var _default             = 0;

// arguments
var _name         = argument[0];
var _value_x      = argument[1];
var _value_y      = argument[2];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _table_column_view,  _table_row];

// set table row
__view_set( e__VW.XPort, _view, _value_x );
__view_set( e__VW.YPort, _view, _value_y );

return 1;





#define ex_camera_set_safe_area
/// @description ex_camera_set_safe_area(cameraName, value)
/// @function ex_camera_set_safe_area
/// @param cameraName
/// @param  value

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._safe_area;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

// set table row
_table[# _table_column, _table_row] = _value;

return 1;





#define ex_camera_set_scroll_position_at_object
/// @description ex_camera_set_scroll_position_at_object(cameraName, instanceID, center)
/// @function ex_camera_set_scroll_position_at_object
/// @param cameraName
/// @param  instanceID
/// @param  center

var _table               = obj_ex_camera._ex_cameras;
var _table_column_x      = _ex_camera._scroll_x;
var _table_column_y      = _ex_camera._scroll_y;
var _table_column_view   = _ex_camera._view;
var _default             = 0;
var _center              = false;

// arguments
var _name          = argument[0];
var _instance      = argument[1];

if (argument_count >= 3) {
    _center = argument[2];
}

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view         = _table[# _table_column_view,  _table_row];
var _width        = _table[# _ex_camera._width, _table_row];
var _height       = _table[# _ex_camera._height, _table_row];

var _bound_x      = _table[# _ex_camera._bound_x, _table_row];
var _bound_y      = _table[# _ex_camera._bound_y, _table_row];
var _bound_width  = _table[# _ex_camera._bound_width, _table_row];
var _bound_height = _table[# _ex_camera._bound_height, _table_row];

if (_center == true) {

    _target_x = _instance.x-(_width/2);
    _target_y = _instance.y-(_height/2);

} else {

    _target_x = _instance.x;
    _target_y = _instance.y;

}

if (_bound_x != -1 and _bound_y != -1 and _bound_width != -1 and _bound_height != -1) {
    _target_x = clamp(_target_x, _bound_x, _bound_width-_width);
    _target_y = clamp(_target_y, _bound_y, _bound_height-_height);
}

// set table row
_table[# _table_column_x, _table_row] = _target_x;
_table[# _table_column_y, _table_row] = _target_y;

return 1;





#define ex_camera_set_scroll_position_at_point
/// @description ex_camera_set_scroll_position_at_point(cameraName, x, y, center)
/// @function ex_camera_set_scroll_position_at_point
/// @param cameraName
/// @param  x
/// @param  y
/// @param  center

var _table               = obj_ex_camera._ex_cameras;
var _table_column_x      = _ex_camera._scroll_x;
var _table_column_y      = _ex_camera._scroll_y;
var _table_column_view   = _ex_camera._view;
var _default             = 0;
var _center              = false;

// arguments
var _name          = argument[0];
var _target_x      = argument[1];
var _target_y      = argument[2];

if (argument_count >= 4) {
    _center = argument[3];
}

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view         = _table[# _table_column_view,  _table_row];
var _width        = _table[# _ex_camera._width, _table_row];
var _height       = _table[# _ex_camera._height, _table_row];

var _bound_x      = _table[# _ex_camera._bound_x, _table_row];
var _bound_y      = _table[# _ex_camera._bound_y, _table_row];
var _bound_width  = _table[# _ex_camera._bound_width, _table_row];
var _bound_height = _table[# _ex_camera._bound_height, _table_row];

if (_center == true) {

    _target_x = _target_x-(_width/2);
    _target_y = _target_y-(_height/2);

}

if (_bound_x != -1 and _bound_y != -1 and _bound_width != -1 and _bound_height != -1) {
    _target_x = clamp(_target_x, _bound_x, _bound_width-_width);
    _target_y = clamp(_target_y, _bound_y, _bound_height-_height);
}

// set table row
_table[# _table_column_x, _table_row] = _target_x;
_table[# _table_column_y, _table_row] = _target_y;

return 1;





#define ex_camera_set_size
/// @description ex_camera_set_size(cameraName, width, height)
/// @function ex_camera_set_size
/// @param cameraName
/// @param  width
/// @param  height

var _table               = obj_ex_camera._ex_cameras;
var _table_column_width  = _ex_camera._width;
var _table_column_height = _ex_camera._height;
var _table_column_view   = _ex_camera._view;
var _default             = 0;

// arguments
var _name         = argument[0];
var _value_width  = argument[1];
var _value_height = argument[2];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _table_column_view,  _table_row];

// set view
__view_set( e__VW.WView, _view, _value_width );
__view_set( e__VW.HView, _view, _value_height );
__view_set( e__VW.WPort, _view, _value_width );
__view_set( e__VW.HPort, _view, _value_height );

// set table row
_table[# _table_column_width,  _table_row] = _value_width;
_table[# _table_column_height, _table_row] = _value_height;

return 1;





#define ex_camera_set_tilt_angle
/// @description ex_camera_set_tilt_angle(cameraName, value)
/// @function ex_camera_set_tilt_angle
/// @param cameraName
/// @param  value

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._tilt_angle;
var _default      = 0;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _ex_camera._view, _table_row];

// set table row
_table[# _table_column, _table_row] = _value;

// set angle
__view_set( e__VW.Angle, _view, _value );

return 1;




#define ex_camera_set_visible
/// @description ex_camera_set_visible(cameraName, value)
/// @function ex_camera_set_visible
/// @param cameraName
/// @param  value

var _table        = obj_ex_camera._ex_cameras;
var _table_column = _ex_camera._view;
var _default      = 1;

// arguments
var _name  = argument[0];
var _value = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view = _table[# _table_column, _table_row];
__view_set( e__VW.Visible, _view, _value );





#define ex_camera_set_zoom_scale
/// @description ex_camera_set_zoom_scale(cameraName, scale)
/// @function ex_camera_set_zoom_scale
/// @param cameraName
/// @param  scale

var _table              = obj_ex_camera._ex_cameras;
var _table_column_scale = _ex_camera._zoom_scale;
var _table_column_view  = _ex_camera._view;
//var _table_column_x     = _ex_camera._scroll_x;
//var _table_column_y     = _ex_camera._scroll_y;
var _default            = 0;

// arguments
var _name  = argument[0];
var _zoom_scale = argument[1];

// check if item exists first
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {
    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    return _default;
}

var _view  = _table[# _table_column_view,  _table_row];
var _scale = _table[# _ex_camera._zoom_scale, _table_row];

var _scroll_x_offset = _table[# _ex_camera._scroll_x, _table_row];
var _scroll_y_offset = _table[# _ex_camera._scroll_y, _table_row];

var _view_width  = _table[# _ex_camera._width, _table_row];
var _view_height = _table[# _ex_camera._height, _table_row];

var _ratio_x = (( ( _view_width  / 2) ) / 100 );
var _ratio_y = (( ( _view_height / 2) ) / 100 );

var _zoom_end_x = (( __view_get( e__VW.XView, _view ))+( _scale - _zoom_scale )*( _ratio_x ) )-_scroll_x_offset; 
var _zoom_end_y = (( __view_get( e__VW.YView, _view ))+( _scale - _zoom_scale )*( _ratio_y ) )-_scroll_y_offset;

_table[# _ex_camera._zoom_offset_x, _table_row] = _zoom_end_x;
_table[# _ex_camera._zoom_offset_y, _table_row] = _zoom_end_y;

__view_set( e__VW.WView, _view, __view_get( e__VW.WPort, _view ) * (_zoom_scale / 100) );
__view_set( e__VW.HView, _view, __view_get( e__VW.HPort, _view ) * (_zoom_scale / 100) );


// set table row
_table[# _table_column_scale, _table_row] = _zoom_scale;

return 1;





#define ex_camera_shake
/// @description ex_camera_shake(cameraName, shakeX, shakeY, shakeAngle, duration, easing, onComplete, onCompleteArguments)
/// @function ex_camera_shake
/// @param cameraName
/// @param  shakeX
/// @param  shakeY
/// @param  shakeAngle
/// @param  duration
/// @param  easing
/// @param  onComplete
/// @param  onCompleteArguments

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;
var _shake_x = 0;
var _shake_y = 0;
var _shake_angle = 0;
var _duration = 12;
var _easing = -1;
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

if (argument_count >= 2) {
    _shake_x = argument[1];
}

if (argument_count >= 3) {
    _shake_y = argument[2];
}

if (argument_count >= 4) {
    _shake_angle = argument[3];
}

if (argument_count >= 5) {
    _duration = argument[4];
}

if (argument_count >= 6) {
    _easing = argument[5];
}

if (argument_count >= 7) {
    _oncomplete = argument[6];
}

if (argument_count >= 8) {
    _oncomplete = argument[7];
}


// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }

    return 0;
}

_list[# _ex_camera._shake_start, _table_row] = 0;
_list[# _ex_camera._shake_end, _table_row] = _duration;
_list[# _ex_camera._shake_tween_duration, _table_row] = _duration;
_list[# _ex_camera._shake_tween_position, _table_row] = 0;
_list[# _ex_camera._shake_tween_easing, _table_row] = _easing;
_list[# _ex_camera._shake_power_x, _table_row] = _shake_x;
_list[# _ex_camera._shake_power_y, _table_row] = _shake_y;
_list[# _ex_camera._shake_power_angle, _table_row] = _shake_angle;
_list[# _ex_camera._shake_oncomplete, _table_row] = _oncomplete;
_list[# _ex_camera._shake_oncomplete_arguments, _table_row] = _oncomplete_arguments;

_list[# _ex_camera._is_shaking, _table_row] = true;

if (ex_camera_get_debug_mode()) {
show_debug_message("exCamera: camera \""+_name+"\" has started shaking");
}

return 1;





#define ex_camera_tilt
/// @description ex_camera_tilt(cameraName, value, duration, easing, onComplete, onCompleteArguments)
/// @function ex_camera_tilt
/// @param cameraName
/// @param  value
/// @param  duration
/// @param  easing
/// @param  onComplete
/// @param  onCompleteArguments

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;
var _easing = -1;
var _value = argument[1];
var _duration = argument[2];
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

if (argument_count >= 4) {
    _easing = argument[3];
}

if (argument_count >= 5) {
    _oncomplete = argument[4];
}



// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    
    return 0;
}

_list[# _ex_camera._tilt_start, _table_row] = _list[# _ex_camera._tilt_angle, _table_row];
_list[# _ex_camera._tilt_end, _table_row] = _value;
_list[# _ex_camera._tilt_tween_duration, _table_row] = _duration;
_list[# _ex_camera._tilt_tween_position, _table_row] = -1;
_list[# _ex_camera._tilt_tween_easing, _table_row] = _easing;
_list[# _ex_camera._tilt_oncomplete, _table_row] = _oncomplete;
_list[# _ex_camera._tilt_oncomplete_arguments, _table_row] = _oncomplete_arguments;

_list[# _ex_camera._is_tilting, _table_row] = true;

if (ex_camera_get_debug_mode()) {
show_debug_message("exCamera: camera \""+_name+"\" has started tilting");
}

return 1;





#define ex_camera_zoom
/// @description ex_camera_zoom(cameraName, scale, duration, easing, onComplete, onCompleteArguments)
/// @function ex_camera_zoom
/// @param cameraName
/// @param  scale
/// @param  duration
/// @param  easing
/// @param  onComplete
/// @param  onCompleteArguments

var _name = argument[0];
var _list = obj_ex_camera._ex_cameras;
var _zoom_scale = argument[1];
var _duration = argument[2];
var _easing = -1;
var _oncomplete = -1;
var _oncomplete_arguments = ex_camera_arguments_undefined;

if (argument_count >= 3) {
    _duration = argument[2];
}

if (argument_count >= 4) {
    _easing = argument[3];
}

if (argument_count >= 5) {
    _oncomplete = argument[4];
}

if (argument_count >= 6) {
    _oncomplete_arguments = argument[5];
}

// check name column
var _table_row = ex_camera_get_index(_name);
if (_table_row < 0) {

    if (ex_camera_get_debug_mode()) {
        show_debug_message("exCamera: Error, could not find camera with name \""+_name+"\"");
    }
    
    return 0;
}

var _scale = _list[# _ex_camera._zoom_scale, _table_row];
var _view  = _list[# _ex_camera._view, _table_row];
var _view_width  = _list[# _ex_camera._width, _table_row];
var _view_height = _list[# _ex_camera._height, _table_row];

var _scroll_x_offset = _list[# _ex_camera._scroll_x, _table_row];
var _scroll_y_offset = _list[# _ex_camera._scroll_y, _table_row];

_list[# _ex_camera._zoom_start_scale, _table_row]    = _list[# _ex_camera._zoom_scale, _table_row];
_list[# _ex_camera._zoom_end_scale, _table_row]      = _zoom_scale;
_list[# _ex_camera._zoom_tween_duration, _table_row] = _duration;

_list[# _ex_camera._zoom_tween_position, _table_row]   = 0;
_list[# _ex_camera._zoom_tween_easing, _table_row]     = _easing;
_list[# _ex_camera._zoom_oncomplete, _table_row] = _oncomplete;
_list[# _ex_camera._zoom_oncomplete_arguments, _table_row] = _oncomplete_arguments;

/// setup center for zoom
var _ox = ((room_width  - (__view_get( e__VW.XView, _view )+__view_get( e__VW.WView, _view ))));
var _oy = ((room_height - (__view_get( e__VW.YView, _view )+__view_get( e__VW.HView, _view ))));
var _oxc = ((room_width  - (__view_get( e__VW.XView, _view )+__view_get( e__VW.WView, _view )))/2);
var _oyc = ((room_height - (__view_get( e__VW.YView, _view )+__view_get( e__VW.HView, _view )))/2);

var _zoom_start_x = __view_get( e__VW.XView, _view )-_scroll_x_offset;
var _zoom_start_y = __view_get( e__VW.YView, _view )-_scroll_y_offset;

// find view ratio (don't use view w/h but stored value because former changes as you zoom)
var _ratio_x = (( ( _view_width /2) ) /100 );
var _ratio_y = (( ( _view_height/2) ) /100 );

var _zoom_end_x = (( __view_get( e__VW.XView, _view ))+( _scale - _zoom_scale )*( _ratio_x ) )-_scroll_x_offset; // *6.4 in 720p
var _zoom_end_y = (( __view_get( e__VW.YView, _view ))+( _scale - _zoom_scale )*( _ratio_y ) )-_scroll_y_offset; // *3.6 in 720p

// start-end values for the zoom
_list[# _ex_camera._zoom_start_x, _table_row] = _zoom_start_x;
_list[# _ex_camera._zoom_start_y, _table_row] = _zoom_start_y;
_list[# _ex_camera._zoom_end_x, _table_row]   = _zoom_end_x;
_list[# _ex_camera._zoom_end_y, _table_row]   = _zoom_end_y;

_list[# _ex_camera._is_zooming, _table_row] = true;

if (ex_camera_get_debug_mode()) {
    show_debug_message("exCamera: Camera \""+_name+"\" has started zooming");
    show_debug_message("exCamera: View ratio is "+string(_ratio_x) +", "+ string(_ratio_y));
    show_debug_message("exCamera: Zooming \""+_name+"\" from X: "+string( _zoom_start_x )+", Y: "+string( _zoom_start_y )+", Scale: "+string(_scale)+
" to X: "+string( _zoom_end_x )+", Y: "+string( _zoom_end_y )+", Scale: "+string(_zoom_scale)
);
    
}

return 1;


#define ex_camera_math_smoothstep
/// @description ex_camera_math_smoothstep(a, b, t)
/// @function ex_camera_math_smoothstep
/// @param a
/// @param  b
/// @param  t

/**
 * Returns 0 when (t < upperBound), 1 when (t >= lowerBound)
 * a smooth transition from 0 to 1 otherwise
 * or -1 on error (upperBound == lowerBound)
 *
 * @param   a  Lower bound, real
 * @param   b  Upper bound, real
 * @param   t  Value, real
 * 
 * @return  Returns the smoothstep value (0, 1 or -1 on error), real
 *
 * @license http://gmlscripts.com/license
 */

// for internal use only
 
gml_pragma("forceinline"); 
 
var _p;

var _a = argument[0];
var _b = argument[1];
var _t = argument[2];

if (_t < _a) { 
    return 0;
}

if (_t >= _b) {
    return 1;
}

if (_a == _b) {
    return -1;
}

_p = ((_t - _a) / (_b - _a));

return (_p * _p * (3 - 2 * _p));


#define ex_camera_ds_grid_delete_y
/// @description ex_camera_ds_grid_delete_y(DSGridIndex, y, shift)
/// @function ex_camera_ds_grid_delete_y
/// @param DSGridIndex
/// @param  y
/// @param  shift

/*
 * Removes a row at Y position from a DS grid
 *
 * @param   gridIndex  The DS grid index, real
 * @param   y          The Y position on the DS grid, real
 * @param   shift      (optional) Whether to shift the rest of the grid, boolean
 * 
 * @return  Returns 1 on success, 0 if reached and removed first item, real
 */

// for internal use only
 
var _grid   = argument[0];
var _y      = argument[1];
var _shift  = false;

if (argument_count >= 3) {
    _shift = argument[2];
}

var _grid_width  = ds_grid_width(_grid);
var _grid_height = ds_grid_height(_grid);

if (_grid_height < 2) {

    ds_grid_clear(_grid, "");
    ds_grid_resize(_grid, ds_grid_width(_grid), 1);

    return 0;
}


if (_shift == true) {

    ds_grid_set_grid_region(_grid, _grid, 0, _y+1, _grid_width-1, _y+1, 0, _y);
    for (var _i=_y; _i <= ds_grid_height(_grid); ++_i) {
        ds_grid_set_grid_region(_grid, _grid, 0, _i+1, _grid_width-1, _i+1, 0, _i);    
    }
    
} else {
    
    ds_grid_set_grid_region(_grid, _grid, 0, _y+1, _grid_width-1, _grid_height-_y, 0, _y);
    
}

ds_grid_resize(_grid, _grid_width, _grid_height-1);

return 1;



