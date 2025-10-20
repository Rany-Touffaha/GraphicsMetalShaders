#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size parameter
[[ stitchable ]] half4 glowingCircleShader(float2 position, half4 color, float2 size,
                                           float delta, float intensity) {
    float2 uv = position / size;
    
    uv -= 0.5;
    
    // Adjust the aspect ratio
    uv.x *= size.x / size.y;
    
    float len = length(uv);
    
    half3 resultColor;
    
    resultColor = half3(step(len, delta));
    
    // Add some glow
    float glowDistance = len - delta;
    
    // Create glow which is inversely proportional to distance
    float glow = 0.01 / glowDistance;
    
    // Remain in range of 0 to 1 using clamp
    glow = clamp(glow, 0.0, 1.0);
    
    // Add some more glow...
    resultColor += glow * intensity;
    
    return half4(resultColor, 1.0);
}
