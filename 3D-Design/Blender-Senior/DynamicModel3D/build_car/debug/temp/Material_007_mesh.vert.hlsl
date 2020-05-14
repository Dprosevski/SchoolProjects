uniform float posUnpack;
uniform float3 hdim;
uniform float3 dim;
uniform float3x3 N;
uniform float4x4 WVP;

static float4 gl_Position;
static float4 pos;
static float3 bposition;
static float3 wnormal;
static float2 nor;

struct SPIRV_Cross_Input
{
    float2 nor : TEXCOORD0;
    float4 pos : TEXCOORD1;
};

struct SPIRV_Cross_Output
{
    float3 bposition : TEXCOORD0;
    float3 wnormal : TEXCOORD1;
    float4 gl_Position : SV_Position;
};

void vert_main()
{
    float4 spos = float4(pos.xyz, 1.0f);
    bposition = ((spos.xyz * posUnpack) + hdim) / dim;
    wnormal = normalize(mul(float3(nor, pos.w), N));
    gl_Position = mul(spos, WVP);
    gl_Position.z = (gl_Position.z + gl_Position.w) * 0.5;
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    pos = stage_input.pos;
    nor = stage_input.nor;
    vert_main();
    SPIRV_Cross_Output stage_output;
    stage_output.gl_Position = gl_Position;
    stage_output.bposition = bposition;
    stage_output.wnormal = wnormal;
    return stage_output;
}
