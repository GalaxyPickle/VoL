/// @description restart

if draw_gameover && ( keyboard_check_pressed(global.key_enter) || 
	gamepad_button_check_pressed(0, global.gp_key_enter) )
{
	layer_destroy_instances("layer_instance_NPC");
	layer_destroy_instances("layer_instance_between");
	audio_stop_all();
	room_goto(r_main_menu);
}

if alpha > 1 || alpha < 0
	alpha_switch = !alpha_switch;

if alpha_switch {
	alpha -= .01;
}
else alpha += .01;