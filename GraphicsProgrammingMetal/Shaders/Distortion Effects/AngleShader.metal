#include <metal_stdlib>
using namespace metal;

// Distortion Effect Snippet with Size parameters
[[ stitchable ]] float2 angleShader(float2 position, float2 size, float force, float angleRadians) {
    float2 displacement = force * float2(cos(angleRadians),-sin(angleRadians));
    
    float2 result = position - displacement;
    
    return result;
}
/*
 Text("Distortion Effect with Size")
 .font(.largeTitle)
 .visualEffect {
 content, proxy in
 content
 .distortionEffect(
 ShaderLibrary.angleShader(
 .float2(proxy.size)
 ),
 maxSampleOffset: .zero
 )
 }
 */
