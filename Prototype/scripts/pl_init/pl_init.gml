/// @description  pl_init()
/// @function  pl_init

// Setup light object list
_pl_lightObjects = ds_list_create();

// Setup the global light surface
_pl_lightmap = surface_create(global.game_width, global.game_height);
_pl_vivid = true;

// Setup blurring
_pl_blurmap = surface_create(global.game_width, global.game_height);
_pl_blurring = true;

// Set options
pl_option_set_ambience(make_color_rgb(1, 16, 32), 0.8);
pl_option_set_blur(5, 0.25);

// Initialise gaussian blur shader
_pl_uni_resolution_hoz = shader_get_uniform(pl_shd_gaussian_horizontal, "resolution");
_pl_uni_resolution_vert = shader_get_uniform(pl_shd_gaussian_vertical, "resolution");
_pl_var_resolution_x = global.game_width / _pl_blurringAmount;
_pl_var_resolution_y = global.game_height / _pl_blurringAmount;