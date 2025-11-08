#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 fireShader(float2 position, half4 color, float2 size, float time) {
    
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, 0, 1);
    
    return result;
}
