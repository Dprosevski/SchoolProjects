#version 450
in vec4 pos;
in vec2 nor;
out vec3 wnormal;
out vec3 bposition;
uniform mat3 N;
uniform mat4 WVP;
uniform vec3 dim;
uniform vec3 hdim;
uniform float posUnpack;
void main() {
vec4 spos = vec4(pos.xyz, 1.0);
bposition = (spos.xyz * posUnpack + hdim) / dim;
	wnormal = normalize(N * vec3(nor.xy, pos.w));
	gl_Position = WVP * spos;
}
