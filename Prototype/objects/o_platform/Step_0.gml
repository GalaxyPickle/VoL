/// @description entity stay on or fall through

if global.player.bbox_bottom > y || keyboard_check(global.key_down) {
	mask_index = -1;	
}
else {
	mask_index = s_platform;
}