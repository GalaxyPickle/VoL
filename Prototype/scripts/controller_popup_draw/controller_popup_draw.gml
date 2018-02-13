/// @description popup controller object script

/// @param popup_object

var popup_object = argument0;

// if there is an instance...
with (popup_object) {
			
	var draw_font = f_menu;
	
	if !global.shader_outline {
		draw_set_font(draw_font);
	
		if damage >= damage_size_max {
			if flash
				flash_color = c_white;
			else flash_color = c_red;
		}
		else flash_color = c_red;
	
		draw_text_transformed_color(
			x, --y, "-" + string(damage), size, size, rotation,
			flash_color, flash_color, flash_color, flash_color, alpha);	
		
		exit;
	}

	var upixelH = shader_get_uniform(sh_outline, "pixelH");
	var upixelW = shader_get_uniform(sh_outline, "pixelW");
	var texelW = 2 * texture_get_texel_width(font_get_texture(draw_font));
	var texelH = 2 * texture_get_texel_height(font_get_texture(draw_font));

	if shader_is_compiled(sh_outline) {
		shader_set(sh_outline);
		shader_set_uniform_f(upixelW, texelW);
		shader_set_uniform_f(upixelH, texelH);

		draw_set_font(draw_font);
	
		if damage >= damage_size_max {
			if flash
				flash_color = c_white;
			else flash_color = c_red;
		}
		else flash_color = c_red;
	
		draw_text_transformed_color(
			x, --y, "-" + string(damage), size, size, rotation,
			flash_color, flash_color, flash_color, flash_color, alpha);
	
		shader_reset();
	}
	else show_debug_message("sh_outline failed");
			
}