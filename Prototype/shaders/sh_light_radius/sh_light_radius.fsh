//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vScreenPos;


uniform vec4 u_fLightPositionRadius;        // x=lightx, y=lighty, z=light radius, w=unused

void main()
{
    // Work out vector from room location to the light
    vec2 vect = vec2( v_vScreenPos.x-u_fLightPositionRadius.x, v_vScreenPos.y-u_fLightPositionRadius.y );

    // work out the length of this vector
    float dist = sqrt(vect.x*vect.x + vect.y*vect.y);

    // if in range use the shadow texture, if not it's black.
	if( dist< u_fLightPositionRadius.z ){
	    // work out the 0 to 1 value from the centre to the edge of the radius
	    float falloff = dist/u_fLightPositionRadius.z;          
	    // get the shadow texture
	    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );        
	    // now LERP from the shadow volume shape to total shadow
	    gl_FragColor = mix( gl_FragColor, vec4(0.0,0.0,0.0,0.9), falloff);          
	}else{
	    // outside the radius - totally in shadow
	    gl_FragColor = vec4(0.0, 0.0, 0.0, 0.9);
	}
}