varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_currFrame;
uniform sampler2D u_prevFrame;
uniform float u_amount;	// Operation range 0.0 - 1.0

void main()
{
	vec2 uv = v_vTexcoord;
	
	vec4 current_f = texture2D(u_currFrame, uv);
	vec4 previous_f = texture2D(u_prevFrame, uv);
	
    gl_FragColor = mix(current_f, previous_f, (u_amount * 0.5));
}