#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 splitRBShader(float2 position, half4 color, float2 size, float percent) {
    
    float2 split = size * percent;
    
    half4 redColor = half4(1.0,0.0,0.0,1.0);
    half4 blueColor = half4(0.0,0.0,1.0,1.0);
    half mask = step(split.x, position.x);
    return mix(redColor, blueColor, mask) * color;
}
