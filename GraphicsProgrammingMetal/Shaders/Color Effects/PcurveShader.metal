#include <metal_stdlib>
using namespace metal;

float pcurve(float x, float a, float b) {
    float k = pow(a+b, a+b) / (pow(a, a)*pow(b, b));
    return k * pow(x,a) * pow(1.0-x,b);
}

float plot(float2 uv, float percentage) {
    return smoothstep(percentage-0.02, percentage, uv.y) -
    smoothstep(percentage, percentage+0.02, uv.y);
}

// Color Effect Snippet with Size parameter
[[ stitchable ]] half4 pCurveShader(float2 position, half4 color, float2 size,
                                    float a, float b) {
    float2 uv = position / size;
    
    float y = pcurve(uv.x, a, b);
    
    y = 1-y;
    
    float percentage = plot(uv, y);
    half3 green = half3(0.0,1.0,0.0);
    
    half3 newColor = half3(uv.x);
    
    newColor = (1.0 - percentage) * newColor + percentage * green;
    
    half4 result = half4(newColor, 1.0);
    
    return result;
}

/*
 Text("Color Effect with Size parameter!")
 .font(.largeTitle)
 .visualEffect {
 content, proxy in
 content.colorEffect(
 ShaderLibrary.pCurveShader(
 .float2(proxy.size)
 )
 )
 }
 */

