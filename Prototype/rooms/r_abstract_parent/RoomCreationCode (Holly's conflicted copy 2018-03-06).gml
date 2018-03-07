window_center();
// flush texture page
draw_texture_flush();

var lay_id = layer_get_id("layer_bg");
var back_id = layer_background_get_id(lay_id);
var scale = 2;

layer_background_xscale(back_id, scale);
layer_background_yscale(back_id, scale);