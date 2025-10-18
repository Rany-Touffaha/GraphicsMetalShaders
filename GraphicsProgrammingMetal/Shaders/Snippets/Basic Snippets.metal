#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 myColorEffect(float2 position, half4 color) {
    half4 result = color.a ==0 ? half4(1,0,1,1) : color;
    
    return result;
}
/*
 Text("Color Effect!")
     .font(.largeTitle)
     .colorEffect(ShaderLibrary.myColorEffect())
 */

// Distortion Effect Snippet
[[ stitchable ]] float2 myDistortionEffect(float2 position) {
    float2 result = float2(position.x,
                           position.y+2*sin(position.x));
    
    return result;
}
/*
 Text("Distortion Effect!")
     .font(.largeTitle)
     .distortionEffect(
         ShaderLibrary.myDistortionEffect(),
         maxSampleOffset: .zero
     )
 */

// Layer Effect Snippet
[[ stitchable ]] half4 myLayerEffect(float2 position, SwiftUI::Layer layer) {
    return half4(0,0,1,1);
}
/*
 Text("Layer Effect!")
     .font(.largeTitle)
     .layerEffect(
         ShaderLibrary.myLayerEffect(),
         maxSampleOffset: .zero
     )
 */

// Distortion Effect Snippet with Sine Effect
[[ stitchable ]] float2 SineDistortionEffect(float2 position, float amplitude) {
    float2 result = float2(position.x,
                           position.y+ amplitude *sin(position.x));
    
    return result;
}
/*
 Text("Distortion Effect!")
    .font(.largeTitle)
    .distortionEffect(
        ShaderLibrary.SineDistortionEffect(),
        maxSampleOffset: .zero
    )
 */

// Color Effect Snippet with Size parameter
[[ stitchable ]] half4 ColorEffectWithSize(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, 0, 1);
    
    return result;
}
/*
 Text("Color Effect with Size parameter!")
 .font(.largeTitle)
 .visualEffect {
     content, proxy in
     content.colorEffect(
         ShaderLibrary.ColorEffectWithSize(
             .float2(proxy.size)
         )
     )
 }
 */

// Layer effect Snippet with Size parameter
[[ stitchable ]] half4 LayerEffectWithSize(float2 position, SwiftUI::Layer layer, float2 size) {
    
    return half4(0,0,1,1);
}
/*
 Text("Color Effect with Size parameter!")
 .font(.largeTitle)
 .visualEffect {
     content, proxy in
     content
        .layerEffect(
         ShaderLibrary.LayerEffectWithSize(
             .float2(proxy.size),
         )
            maxSampleOffset: .zero
     )
 }
 */

// Using Timeline with size and time parameters

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 ColorEffectWithTimeAndSize(float2 position, half4 color, float2 size, float time) {
    
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, 0, 1);
    
    return result;
}
/*
 private let startDate = Date()
 
 TimelineView(.animation) { _ in
     Text("Color Effect with Time and Size")
         .font(.largeTitle)
         .visualEffect {
             content, proxy in
             content
                .layerEffect(
                 ShaderLibrary.ColorEffectWithTimeAndSize(
                     .float2(proxy.size),
                     .float(startDate.timeIntervalSinceNow)
                 )
                    maxSampleOffset: .zero
             )
         }
 }
 */

// Distortion Effect Snippet with Size and Time parameters
[[ stitchable ]] float2 DistortionEffectWithTimeAndSize(float2 position, float2 size, float time) {
    float2 result = float2(position.x,
                           position.y+2*sin(position.x));
    
    return result;
}
/*
 private let startDate = Date()
 
 TimelineView(.animation) { _ in
     Text("Color Effect with Time and Size")
         .font(.largeTitle)
         .visualEffect {
             content, proxy in
             content
                 .distortionEffect(
                     ShaderLibrary.DistortionEffectWithTimeAndSize(
                        .float2(proxy.size),
                        .float(startDate.timeIntervalSinceNow)
                     ),
                     maxSampleOffset: .zero
                 )
         }
 }
 */

// Layer effect Snippet with Size parameter
[[ stitchable ]] half4 LayerEffectWithTimeAndSize(float2 position, SwiftUI::Layer layer, float2 size, float time) {
    
    return half4(0,0,1,1);
}
/*
 private let startDate = Date()
 
 TimelineView(.animation) { _ in
     Text("Layer Effect with Time and Size parameters")
     .font(.largeTitle)
     .visualEffect {
         content, proxy in
         content
            .layerEffect(
             ShaderLibrary.LayerEffectWithTimeAndSize(
                 .float2(proxy.size),
                 .float(startDate.timeIntervalSinceNow)
             )
                maxSampleOffset: .zero
         )
     }
 }
 */
