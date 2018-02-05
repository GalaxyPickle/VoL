/// @description step parallax move based on camera

// get all parallax layer ids
var bg0_id = layer_get_id("layer_bg");
var bg1_id = layer_get_id("layer_bg_front");

var bg0_shift = 5;
var bg1_shift = 2;

layer_x(bg0_id, x / bg0_shift);
layer_y(bg0_id, y / bg0_shift);

layer_x(bg1_id, (x - xstart) / bg1_shift);
layer_y(bg1_id, (y - ystart) / bg1_shift);