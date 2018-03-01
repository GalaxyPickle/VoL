/// @description init all other controller objects

// grab layer id
var helper_layer = layer_get_id("layer_instance_helper");
var light_layer = layer_get_id("layer_instance_lights");

// create all helpers
instance_create_layer(x, y, helper_layer, o_camera);
instance_create_layer(x, y, helper_layer, o_music);
instance_create_layer(x, y, helper_layer, o_gui);
instance_create_layer(x, y, helper_layer, o_pause_menu);

// make other controllers
//instance_create_layer(x, y, light_layer, o_controller_light);
instance_create_layer(x, y, helper_layer, o_controller_entity);