/// @desc quit to menu (call save before)

layer_destroy_instances("layer_instance_NPC");
layer_destroy_instances("layer_instance_between");
audio_stop_all();
room_goto(r_main_menu);

global.pause = false;
global.sunyata = false;