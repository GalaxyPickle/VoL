/// @description draw shaders and self

var upixelH = shader_get_uniform(sh_outline, "pixelH");
var upixelW = shader_get_uniform(sh_outline, "pixelW");
var texelW = 1 * texture_get_texel_width(sprite_get_texture(sprite_index, image_index));
var texelH = 1 * texture_get_texel_height(sprite_get_texture(sprite_index, image_index));

if shader_is_compiled(sh_outline) {
	shader_set(sh_outline);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	draw_self();
	shader_reset();
}
else show_debug_message("sh_outline failed");