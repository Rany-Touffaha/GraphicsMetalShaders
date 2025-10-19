#include <metal_stdlib>
using namespace metal;

//Random generator
float random (float2 uv) {
    return fract(sin(dot(uv, float2(12.9898,78.233)))*43758.5453123);
}

// Color Effect Snippet with Size and Time parameters
[[ stitchable ]] half4 noiseShader(float2 position, half4 color, float2 size, float time) {
    float2 uv = position / size;
    float value = random(uv + time);
    half4 result = half4(half3(value), 1) * color;
    
    return result;
}
