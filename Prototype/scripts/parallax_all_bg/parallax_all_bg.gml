/// @description step parallax move based on camera

// get all parallax layer ids
var bg = layer_get_id("layer_bg");
var bg_p = .9;
var back = layer_get_id("layer_asset_bg_back");
var back_p = .3;
var middle = layer_get_id("layer_asset_bg_middle");
var middle_p = .5;
var front = layer_get_id("layer_asset_bg_front");
var front_p = .7;

var parallax_list = [ [bg, bg_p], [back, back_p], [middle, middle_p], [front, front_p] ];

for (var i = 0; i < array_length_1d(parallax_list); i++) {
	var cur = parallax_list[i];
	layer_x( cur[0], (x - xstart) * cur[1] );
}