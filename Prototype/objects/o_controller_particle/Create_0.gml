/// @description set particle system depths

part_system_depth(global.ps, layer_get_depth(layer_get_id("layer_instance_particles")));

part_system_depth(global.ps_between, layer_get_depth(layer_get_id("layer_instance_between")) - 50);

part_system_depth(global.ps_top, layer_get_depth(layer_get_id("layer_instance_top")) - 50);