#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 stripesShader(float2 position, half4 color, float stripeWidth) {
    // Define stripe colors
    const half4 colors[3] = {
        half4(1.0, 0.0, 0.0, 1.0), // Red
        half4(0.0, 1.0, 0.0, 1.0), // Green
        half4(0.0, 0.0, 1.0, 1.0)  // Blue
    };

    // Compute stripe index based on position
    int stripeIndex = int(fmod(position.x, 3.0 * stripeWidth) / stripeWidth);
    
    half4 result = (stripeIndex >= 0 && stripeIndex < 3) ? colors[stripeIndex] : half4(0.0, 0.0, 0.0, 1.0);
    
    // Return the corresponding color (defaults to black if out of range)
    return mix(color, result, half4(0.5));
}

/*
 Text("Color Effect!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.stripesShader())
 */

// Color Effect Snippet
[[ stitchable ]] half4 stripesFillShader(float2 position, float stripeWidth) {
    // Define stripe colors
    const half4 colors[3] = {
        half4(1.0, 0.0, 0.0, 1.0), // Red
        half4(0.0, 1.0, 0.0, 1.0), // Green
        half4(0.0, 0.0, 1.0, 1.0)  // Blue
    };

    // Compute which stripe this pixel belongs to
    int stripeIndex = int(fmod(position.x, 3.0 * stripeWidth) / stripeWidth);

    // Select color (fallback to black if out of range)
    return (stripeIndex >= 0 && stripeIndex < 3) ? colors[stripeIndex] : half4(0.0, 0.0, 0.0, 1.0);
}
