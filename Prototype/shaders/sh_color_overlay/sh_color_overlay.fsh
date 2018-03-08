//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixel_colorR;
uniform float pixel_colorG;
uniform float pixel_colorB;
uniform float pixel_AlphaBlend;

void main()
{
	float Alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	
	vec3 originalColour = (texture2D( gm_BaseTexture, v_vTexcoord ).rgb * v_vColour.rgb);
	originalColour = originalColour*( 1.0 - pixel_AlphaBlend);
	
	vec3 newColour = vec3( pixel_colorR, pixel_colorG, pixel_colorB );
	newColour = newColour*( pixel_AlphaBlend );
	
    gl_FragColor = vec4( (originalColour + newColour) , Alpha);
}

