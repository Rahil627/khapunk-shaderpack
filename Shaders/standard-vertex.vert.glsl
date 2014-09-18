#version 100

#ifdef GL_ES
precision mediump float;
#endif

attribute vec3 vertexPosition;
attribute vec2 texPosition;
attribute vec4 vertexColor;

uniform mat4 projectionMatrix;
uniform float flipy;

varying vec2 texCoord;
varying vec4 color;

void kore() {
	vec4 res = projectionMatrix * vec4(vertexPosition, 1.0);
	res.y *= (flipy < 0.5 ? 1.0:-1.0);
	gl_Position = res;
	texCoord = texPosition;
	color = vertexColor;
}
