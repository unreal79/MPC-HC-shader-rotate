// Shader for MPC-HC video player: Rotates screen 270 degrees clockwise,
// while keeping the aspect ratio of the video.
//
// 1. Save the file(s) in "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\Shaders"
// 2. In MPC-HC: Right click: Shaders - Select Shaders... - Add to pre-resize (the file)

sampler s0 : register(s0);
float4 p0 :  register(c0);

#define width  (p0[0])
#define height (p0[1])

float2 fit_rotated_aspect(float2 uv)
{
	float screen_ar = width / height;
	float image_ar = height / width;
	float2 scale = float2(1.0, 1.0);

	if (screen_ar > image_ar) {
		scale.x = image_ar / screen_ar;
	} else {
		scale.y = screen_ar / image_ar;
	}

	return (uv - 0.5) / scale + 0.5;
}

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float2 uv = fit_rotated_aspect(tex);
	if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
		return 0;
	}

	float2 rotated_tex = float2(1.0 - uv.y, uv.x);
	return tex2D(s0, rotated_tex);
}
