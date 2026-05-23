// Shader for MPC-HC video player: Rotates screen 180 degrees.
//
// 1. Save the file(s) in "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\Shaders"
// 2. In MPC-HC: Right click: Shaders - Select Shaders... - Add to pre-resize (the file)

sampler s0 : register(s0);
float4 p0 :  register(c0);

float4 main(float2 tex : TEXCOORD0) : COLOR
{
    float2 rotated_tex = float2(1.0 - tex.x, 1.0 - tex.y); // 180 degrees rotation
    return tex2D(s0, rotated_tex);
}
