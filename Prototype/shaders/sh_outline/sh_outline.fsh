//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;

void main()
{
	// set the width and height of the texel (% of sprite image that is 1 pixel)
	vec2 offset_x;
	offset_x.x = pixelW;
	vec2 offset_y;
	offset_y.y = pixelH;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	
	// set the borders of the sprite draw
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offset_x).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offset_x).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offset_y).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offset_y).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
}
