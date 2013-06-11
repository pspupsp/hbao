#version 150

uniform sampler2D texture0;
uniform vec2 LinMAD;
uniform int ResRatio;

out float out_frag0;

in vec2 TexCoord;

float ViewSpaceZFromDepth(float d)
{
	// [0,1] -> [-1,1] clip space
	d = d * 2.0 - 1.0;

	// Get view space Z
	return -1.0 / (LinMAD.x * d + LinMAD.y);
}

void main(void)
{
	float d = texelFetch(texture0, ivec2(round(gl_FragCoord.xy * ResRatio)), 0).r;
	out_frag0 = ViewSpaceZFromDepth(d);
}