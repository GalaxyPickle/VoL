/// @description setup menu enums and ds maps

menu_option = 0;

// all my in-game menu pages
enum menu_page {
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}
// the kind of the option
enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

/*

ds_menu_pause_main = create_menu_page(
	["Resume",		menu_element_type.script_runner,	resume_game],
	["Settings",	menu_element_type.page_transfer,	menu_page.settings],
	["Quit",		menu_element_type.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["Audio",		menu_element_type.page_transfer,	menu_page.audio],
	["Graphics",	menu_element_type.page_transfer,	menu_page.graphics],
	["Controls",	menu_element_type.page_transfer,	menu_page.controls],
	["Back",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_audio = create_menu_page(
	["Master",		menu_element_type.slider,			change_volume,		1,	[0,1]],
	["Sounds",		menu_element_type.slider,			change_volume,		1,	[0,1]],
	["Music",		menu_element_type.slider,			change_volume,		1,	[0,1]],
	["Back",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_graphics = create_menu_page(
	["Resolution",	menu_element_type.shift,			change_resolution,	0,	["1280 x 720", "??? x ???"]],
	["Window Mode",	menu_element_type.toggle,			change_window_mode,	1,	["FULLSCREEN", "WINDOWED"]],
	["Back",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = create_menu_page(
	["Back",		menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;

menu_pages = [ds_menu_pause_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

for (var i = 0; i < array_length_1d(menu_pages); i++) {
	menu_option[i] = 0;
}	