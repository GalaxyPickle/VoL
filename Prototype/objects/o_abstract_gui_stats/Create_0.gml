/// @description 

event_inherited();

draw_variables = [];
draw_my_healthbars = true;

interact_text = "Commune";

/////////////////////////
// SHADERS
/////////////////////////
outline_color = c_black;
outline_thickness = 1;
// outline
outline_init();

scr_shader_overlay_init();
alarm[6] = room_speed / 16;
flash_entity = false;

init_thermal_shader();