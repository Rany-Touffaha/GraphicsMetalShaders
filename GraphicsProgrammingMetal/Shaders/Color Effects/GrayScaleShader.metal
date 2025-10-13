#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 grayScaleShader(float2 position, half4 color) {
    half4 weights = half4(0.2126, 0.7152, 0.0722, 0);
    
    half brightness = dot(weights, color);
    
    return half4(brightness,brightness,brightness,1);
}
/*
 Text("Color Effect!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.grayScaleShader())
 */
