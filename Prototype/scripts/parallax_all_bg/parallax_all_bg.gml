/// @description step parallax move based on camera

// get all parallax layer ids
var bg0_id = layer_get_id("layer_bg");
var bg1_id = layer_get_id("layer_asset_bg_back");
var bg2_id = layer_get_id("layer_asset_bg_middle");
var bg3_id = layer_get_id("layer_asset_bg_front");

var parallax_list = [bg0_id, bg1_id, bg2_id, bg3_id];

var parallax_start = 5;

for (var i = 0; i < array_length_1d(parallax_list); i++) {
	layer_x( parallax_list[i], (x - xstart) / (parallax_start - i / array_length_1d(parallax_list)) );
}