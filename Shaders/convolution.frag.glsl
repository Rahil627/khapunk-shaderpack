#version 100

#ifdef GL_ES
precision mediump float;
#endif

varying vec2 texCoord;
varying vec4 color;

uniform sampler2D tex;
uniform vec2 resolution;
uniform float kernel[9];
uniform float division;
uniform float bias;
 
void kore()
{
	vec4 sum = vec4(0.0);
	
	float step_w = 1.0/resolution.x;
	float step_h = 1.0/resolution.y;
	
	vec2 offset[9];
	
	offset[0] = vec2(-step_w, -step_h);
	offset[1] = vec2(0.0, -step_h);
	offset[2] = vec2(step_w, -step_h);
	   
	offset[3] = vec2(-step_w, 0.0);
	offset[4] = vec2(0.0, 0.0);
	offset[5] = vec2(step_w, 0.0);
	
	offset[6] = vec2(-step_w, step_h);
	offset[7] = vec2(0.0, step_h);
	offset[8] = vec2(step_w, step_h);
	
	 for(int i=0;  i < 9; i++ ){
		vec4 tmp = texture2D(tex, texCoord.st + offset[i]);
		sum += tmp * (kernel[i]/division + bias);
	 }
	
	gl_FragColor = sum*color.a;
}
