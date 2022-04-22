// This file is copied from URP 10.0 which will be a workaround till URP 10.0 is actually released
#ifndef YETMAN_POSTPROCESS_DECLARE_NORMALS_TEXTURE_INCLUDED
#define YETMAN_POSTPROCESS_DECLARE_NORMALS_TEXTURE_INCLUDED
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

TEXTURE2D_X_FLOAT(_CameraNormalsTexture);
SAMPLER(sampler_CameraNormalsTexture);

float3 SampleSceneNormals(float2 uv)
{
    return UnpackNormalOctRectEncode(SAMPLE_TEXTURE2D_X(_CameraNormalsTexture, sampler_CameraNormalsTexture, UnityStereoTransformScreenSpaceTex(uv)).xy) * float3(1.0, 1.0, -1.0);
}

float3 LoadSceneNormals(uint2 uv)
{
    return UnpackNormalOctRectEncode(LOAD_TEXTURE2D_X(_CameraNormalsTexture, uv).xy) * float3(1.0, 1.0, -1.0);
}
#endif