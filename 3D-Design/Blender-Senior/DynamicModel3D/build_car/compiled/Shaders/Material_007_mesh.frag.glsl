#version 450
#include "compiled.inc"
#include "std/gbuffer.glsl"
in vec3 wnormal;
in vec3 bposition;
out vec4 fragColor[2];

vec3 tex_brick(vec3 p, const vec3 c1, const vec3 c2, const vec3 c3) {
    p /= vec3(0.9, 0.49, 0.49) / 2;
    if (fract(p.y * 0.5) > 0.5) p.x += 0.5;   
    p = fract(p);
    vec3 b = step(p, vec3(0.95, 0.9, 0.9));
    return mix(c3, c1, b.x * b.y * b.z);
}
float tex_brick_f(vec3 p) {
    p /= vec3(0.9, 0.49, 0.49) / 2;
    if (fract(p.y * 0.5) > 0.5) p.x += 0.5;   
    p = fract(p);
    vec3 b = step(p, vec3(0.95, 0.9, 0.9));
    return mix(1.0, 0.0, b.x * b.y * b.z);
}

vec3 tex_magic(const vec3 p) {
    float a = 1.0 - (sin(p.x) + sin(p.y));
    float b = 1.0 - sin(p.x - p.y);
    float c = 1.0 - sin(p.x + p.y);
    return vec3(a, b, c);
}
float tex_magic_f(const vec3 p) {
    vec3 c = tex_magic(p);
    return (c.x + c.y + c.z) / 3.0;
}
void main() {
vec3 n = normalize(wnormal);
	vec3 basecol;
	float roughness;
	float metallic;
	float occlusion;
	float specular;
	vec3 MagicTexture_Color_res = tex_magic(bposition * 5.0 * 4.0);
	vec3 ColorRamp_cols[2];
	ColorRamp_cols[0] = vec3(0.0, 0.0, 0.0);
	ColorRamp_cols[1] = vec3(1.0, 1.0, 1.0);
	float ColorRamp_fac = 0.5;
	int ColorRamp_i = 0 + (ColorRamp_fac > 1.0 ? 1 : 0);
	float ColorRamp_facs[2];
	ColorRamp_facs[0] = 0.0;
	ColorRamp_facs[1] = 1.0;
	vec3 ColorRamp_Color_res = mix(ColorRamp_cols[ColorRamp_i], ColorRamp_cols[ColorRamp_i + 1], (ColorRamp_fac - ColorRamp_facs[ColorRamp_i]) * (1.0 / (ColorRamp_facs[ColorRamp_i + 1] - ColorRamp_facs[ColorRamp_i]) ));
	vec3 BrickTexture_Color_res = tex_brick(bposition * 5.0, MagicTexture_Color_res, ColorRamp_Color_res, vec3(0.0, 0.0, 0.0));
	basecol = BrickTexture_Color_res;
	roughness = 0.5;
	metallic = 0.0;
	occlusion = 1.0;
	specular = 0.5;
	n /= (abs(n.x) + abs(n.y) + abs(n.z));
	n.xy = n.z >= 0.0 ? n.xy : octahedronWrap(n.xy);
	const uint matid = 0;
	fragColor[0] = vec4(n.xy, roughness, packFloatInt16(metallic, matid));
	fragColor[1] = vec4(basecol, packFloat2(occlusion, specular));
}
