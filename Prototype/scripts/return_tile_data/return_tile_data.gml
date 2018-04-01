///@function return_tile_data
///@param layer id
///@param x
///@param y

var lay_id = layer_get_id(argument[0]);
var map_id = layer_tilemap_get_id(lay_id);
var mx = tilemap_get_cell_x_at_pixel(map_id,argument[1],argument[2]);
var my = tilemap_get_cell_y_at_pixel(map_id,argument[1],argument[2]);

var data = tilemap_get(map_id, mx, my);
var ind = tile_get_index(data);

return data;