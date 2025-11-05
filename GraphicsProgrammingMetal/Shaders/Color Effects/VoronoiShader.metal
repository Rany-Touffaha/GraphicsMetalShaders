#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 voronoiShader(float2 position, half4 color, float2 size, float time) {
    
    float2 seedPoints[30] = {
        float2(0.1,0.1), float2(0.3,0.5), float2(0.6,0.3),
        float2(0.8,0.7), float2(0.5,0.8), float2(0.2,0.2),
        float2(0.7,0.1), float2(0.4,0.6), float2(0.9,0.9),
        float2(0.3,0.8), float2(0.1,0.9), float2(0.8,0.2),
        float2(0.4,0.3), float2(0.6,0.7), float2(0.2,0.5),
        float2(0.5,0.4), float2(0.9,0.1), float2(0.7,0.8),
        float2(0.3,0.2), float2(0.1,0.6), float2(0.8,0.9),
        float2(0.6,0.4), float2(0.4,0.9), float2(0.2,0.7),
        float2(0.7,0.6), float2(0.9,0.5), float2(0.5,0.2),
        float2(0.3,0.4), float2(0.1,0.3), float2(0.6,0.9),
    };
    
    half3 seedColors[30] = {
        half3(1.0, 0.0, 0.0), //Red
        half3(0.0, 1.0, 0.0), //Green
        half3(0.0, 0.0, 1.0), //Blue
        half3(1.0, 1.0, 0.0), //Yellow
        half3(0.0, 1.0, 1.0), //Cyan
        half3(1.0, 0.0, 1.0), //Magenta
        half3(1.0, 0.5, 0.0), //Orange
        half3(0.5, 0.0, 1.0), //Purple
        half3(0.0, 0.5, 0.5), //Teal
        half3(0.5, 0.5, 0.5), //Gray
        half3(0.9, 0.1, 0.1), //Light Red
        half3(0.1, 0.9, 0.1), //Light Green
        half3(0.1, 0.1, 0.9), //Light Blue
        half3(0.8, 0.8, 0.1), //Gold
        half3(0.1, 0.8, 0.8), //Aquamarine
        half3(0.8, 0.1, 0.8), //Orchid
        half3(0.9, 0.6, 0.2), //Amber
        half3(0.6, 0.2, 0.9), //Violet
        half3(0.2, 0.9, 0.6), //Spring Green
        half3(0.7, 0.7, 0.7), //Light Gray
        half3(0.2, 0.2, 0.2), //Dark Gray
        half3(0.4, 0.8, 0.2), //Lime
        half3(0.8, 0.4, 0.2), //Burnt Orange
        half3(0.4, 0.2, 0.8), //Indigo
        half3(0.2, 0.8, 0.4), //Mint
        half3(0.6, 0.4, 0.1), //Mustard
        half3(0.4, 0.6, 0.1), //Olive
        half3(0.2, 0.4, 0.6), //Slate Blue
        half3(0.9, 0.2, 0.4), //Coral
        half3(0.3, 0.3, 0.7), //Royal Blue
    };
    
    float2 uv = position / size; //normalise values between 0 and 1
    half3 result = half3(0.0);
    
    float minDistance = 1.0;
    
    for (int i = 0; i < 30; i++) {
        float distance = length(uv - seedPoints[i]);
        
        if (distance < minDistance) {
            minDistance = distance;
            result = seedColors[i];
        }
    }
    
    return half4(result, 1.0);
}
