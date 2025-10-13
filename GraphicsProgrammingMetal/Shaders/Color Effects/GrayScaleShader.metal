#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 grayScaleShader(float2 position, half4 color, float4 weights) {
    
    half brightness = dot(half4(weights), color);
    
    return half4(brightness,brightness,brightness,1);
}
/*
 Text("Color Effect!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.grayScaleShader())
 */
