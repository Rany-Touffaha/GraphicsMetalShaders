#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 fbmShader(float2 position, half4 color, float4 bounds, float time) {
    
    return half4(1.0, 0.0, 0.0, 1.0);
}
