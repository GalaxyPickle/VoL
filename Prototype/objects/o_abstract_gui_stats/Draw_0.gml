/// @description draw shaders and self

if !global.shader_outline {
	draw_self();
	exit;
}

// draw an outline around me
var upixelH = shader_get_uniform(sh_outline, "pixelH");
var upixelW = shader_get_uniform(sh_outline, "pixelW");
var texelW = texture_get_texel_width(sprite_get_texture(s_player_air, 0));
var texelH = texture_get_texel_height(sprite_get_texture(s_player_air, 0));

if shader_is_compiled(sh_outline) {
	shader_set(sh_outline);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	draw_self();
	shader_reset();
}
else show_debug_message("sh_outline failed");