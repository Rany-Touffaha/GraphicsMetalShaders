#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size parameter
[[ stitchable ]] half4 coolCenterShader(float2 position, half4 color, float2 size,
                                        float time, float minRadius, float maxRadius) {
    float2 center = size / 2.0;
    
    float distanceToCenter = distance(center, position);
    
    bool condition = distanceToCenter >= minRadius &&
        distanceToCenter <= maxRadius;
    
    float red = condition ? (maxRadius - distanceToCenter)/maxRadius : 0;
    float green = condition ? distanceToCenter/maxRadius : 0;
    float blue = 1;
    float opacity = condition ? 0.3 + 0.7 * pow(sin(time), 2) : 0.3;
    
    
    half4 result = half4(red, green, blue, opacity);
    
    return result;
}
/*
 Text("Color Effect with Size parameter!")
 .font(.largeTitle)
 .visualEffect {
 content, proxy in
 content.colorEffect(
 ShaderLibrary.coolCenterShader(
 .float2(proxy.size)
 )
 )
 }
 */

