/// @description scr_ease_in_sine(time, start, change, duration)
/// @function scr_ease_in_sine
/// @param time
/// @param  start
/// @param  change
/// @param  duration

/**
 * Returns the easing function result
 *
 * @param   time      Time current position, real
 * @param   start     Start time position, real
 * @param   change    Change current amount, real
 * @param   duration  Total duration, real
 * 
 * @return  Returns the easing function result, real
 *
 * @license http://robertpenner.com/easing_terms_of_use.html
 */

var _t = argument[0];
var _b = argument[1];
var _c = argument[2];
var _d = argument[3];

var _td = _t/_d;

return -_c * cos(_td * (pi/2)) + _c + _b;
