#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 OpacityZeroCircle(float2 position, half4 color,
                                         float2 touchPosition, float radius,
                                         float3 weight, float mixLevel) {
    
    half4 otherColor = half4(half3(weight) * color.rgb, 1);
    
    float distanceToCenter = distance(touchPosition, position);
    
    if (distanceToCenter <= radius) {
        if (distanceToCenter > radius - 2){
            return half4(0,0,0,1);
        } else {
            return mix(color, otherColor, mixLevel);
        }
    }
    
    return mix(color, otherColor, 1-mixLevel);
}
/*
 Text("Color Effect!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.OpacityZeroCircle())
 */
