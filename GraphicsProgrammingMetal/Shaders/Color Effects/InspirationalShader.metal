#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 inspirationalShader(float2 position, half4 color, float2 size,
                                           float time, float2 speed, float complexityFactor) {
    half3 colorResult = half3(1.0);
    float len;
    float timeFactor = 0.5 * abs(time);
    
    // Loop calculates the three different colors component for colorResult
    for(int i=0; i < 3; i++) {
        float2 adjustedUV;
        float2 p = position / size;
        
        adjustedUV = p;
        
        // Shift p to center and adjust aspect ratio
        p-= 0.5;
        p.x *= size.x / size.y;
        
        // Perturb time
        timeFactor += 0.7;
        
        // Distane from the point p to the origin
        len = length(p);
        
        /*
         term1: Normalise p (between 0 and 1)
         
         term2: Oscillate using time between 2 and 4
         
         term3: Oscillate the amplitude of the sine
         */
        
        float2 term1 = p / len;
        float2 term2 = sin(timeFactor) + 3.0;
        float2 term3 = abs(sin(len * speed.y - speed.x * timeFactor));
        
        adjustedUV += term1 * term2 * term3;
        
        // Calculate the color
        colorResult[i] = 0.01 / length(fmod(adjustedUV, complexityFactor));
    }
    
    
    half4 result = half4(colorResult / len, 1.0);
    result = mix(result, color, 0.5);
    
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
 ShaderLibrary.inspirationalShader(
 .float2(proxy.size),
 .float(startDate.timeIntervalSinceNow)
 )
 maxSampleOffset: .zero
 )
 }
 }
 */
