#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 <#myColorEffect#>(float2 position, half4 color) {
    half4 result = color.a ==0 ? half4(1,0,1,1) : color;
    
    return result;
}
/*
 Text("Color Effect!")
     .font(.largeTitle)
     .colorEffect(ShaderLibrary.<#myColorEffect#>())
 */

// Distortion Effect Snippet
[[ stitchable ]] float2 <#myDistortionEffect#>(float2 position) {
    float2 result = float2(position.x,
                           position.y+2*sin(position.x));
    
    return result;
}
/*
 Text("Distortion Effect!")
     .font(.largeTitle)
     .distortionEffect(
         ShaderLibrary.<#myDistortionEffect#>(),
         maxSampleOffset: .zero
     )
 */

// Layer Effect Snippet
[[ stitchable ]] half4 <#myLayerEffect#>(float2 position, SwiftUI::Layer layer) {
    return half4(0,0,1,1);
}
/*
 Text("Layer Effect!")
     .font(.largeTitle)
     .layerEffect(
         ShaderLibrary.<#myLayerEffect#>(),
         maxSampleOffset: .zero
     )
 */
