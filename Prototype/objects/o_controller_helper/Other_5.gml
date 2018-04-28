/// @description room end delete layers

var lays = 
[
	"layer_instance_ghost",
	"layer_instance_lights",
	"layer_instance_popups",
	"layer_instance_particles",
	"layer_instance_NPC",
	"layer_instance_top",
	"layer_instance_between"
];

for (var i = 0; i < array_length_1d(lays); i++) {
	layer_destroy_instances(lays[i]);
}