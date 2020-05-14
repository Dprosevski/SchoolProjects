static float3 wnormal;
static float3 bposition;
static float4 fragColor[2];

struct SPIRV_Cross_Input
{
    float3 bposition : TEXCOORD0;
    float3 wnormal : TEXCOORD1;
};

struct SPIRV_Cross_Output
{
    float4 fragColor[2] : SV_Target0;
};

float3 tex_magic(float3 p)
{
    float a = 1.0f - (sin(p.x) + sin(p.y));
    float b = 1.0f - sin(p.x - p.y);
    float c = 1.0f - sin(p.x + p.y);
    return float3(a, b, c);
}

float3 tex_brick(inout float3 p, float3 c1, float3 c2, float3 c3)
{
    p /= float3(0.449999988079071044921875f, 0.24500000476837158203125f, 0.24500000476837158203125f);
    if (frac(p.y * 0.5f) > 0.5f)
    {
        p.x += 0.5f;
    }
    p = frac(p);
    float3 b = step(p, float3(0.949999988079071044921875f, 0.89999997615814208984375f, 0.89999997615814208984375f));
    return lerp(c3, c1, ((b.x * b.y) * b.z).xxx);
}

float2 octahedronWrap(float2 v)
{
    return (1.0f.xx - abs(v.yx)) * float2((v.x >= 0.0f) ? 1.0f : (-1.0f), (v.y >= 0.0f) ? 1.0f : (-1.0f));
}

float packFloatInt16(float f, uint i)
{
    return (0.06248569488525390625f * f) + (0.06250095367431640625f * float(i));
}

float packFloat2(float f1, float f2)
{
    return floor(f1 * 255.0f) + min(f2, 0.9900000095367431640625f);
}

void frag_main()
{
    float3 n = normalize(wnormal);
    float3 MagicTexture_Color_res = tex_magic((bposition * 5.0f) * 4.0f);
    float3 ColorRamp_cols[2];
    ColorRamp_cols[0] = 0.0f.xxx;
    ColorRamp_cols[1] = 1.0f.xxx;
    float ColorRamp_fac = 0.5f;
    int ColorRamp_i = 0 + int(ColorRamp_fac > 1.0f);
    float ColorRamp_facs[2];
    ColorRamp_facs[0] = 0.0f;
    ColorRamp_facs[1] = 1.0f;
    float3 ColorRamp_Color_res = lerp(ColorRamp_cols[ColorRamp_i], ColorRamp_cols[ColorRamp_i + 1], ((ColorRamp_fac - ColorRamp_facs[ColorRamp_i]) * (1.0f / ((ColorRamp_facs[ColorRamp_i + 1]) - ColorRamp_facs[ColorRamp_i]))).xxx);
    float3 param = bposition * 5.0f;
    float3 _202 = tex_brick(param, MagicTexture_Color_res, ColorRamp_Color_res, 0.0f.xxx);
    float3 BrickTexture_Color_res = _202;
    float3 basecol = BrickTexture_Color_res;
    float roughness = 0.5f;
    float metallic = 0.0f;
    float occlusion = 1.0f;
    float specular = 0.5f;
    n /= ((abs(n.x) + abs(n.y)) + abs(n.z)).xxx;
    float2 _227;
    if (n.z >= 0.0f)
    {
        _227 = n.xy;
    }
    else
    {
        _227 = octahedronWrap(n.xy);
    }
    n = float3(_227.x, _227.y, n.z);
    fragColor[0] = float4(n.xy, roughness, packFloatInt16(metallic, 0u));
    fragColor[1] = float4(basecol, packFloat2(occlusion, specular));
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    wnormal = stage_input.wnormal;
    bposition = stage_input.bposition;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.fragColor = fragColor;
    return stage_output;
}
