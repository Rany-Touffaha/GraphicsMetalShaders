#include <metal_stdlib>
using namespace metal;

// Distortion Effect Snippet with Size parameters
[[ stitchable ]] float2 tileShader(float2 position, float2 size, float2 tile) {
    
    return fmod(position * tile, size);
}
/*
 Text("Distortion Effect with Size")
     .font(.largeTitle)
     .visualEffect {
         content, proxy in
         content
             .distortionEffect(
                 ShaderLibrary.tileShader(
                     .float2(proxy.size)
                 ),
                 maxSampleOffset: .zero
             )
     }
 */
