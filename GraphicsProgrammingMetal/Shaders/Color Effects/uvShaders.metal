#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 uvColorEffect1(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, 0, 1);
    
    return result;
}

[[ stitchable ]] half4 uvColorEffect2(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, 1, 1);
    
    return result;
}

[[ stitchable ]] half4 uvColorEffect3(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, (uv.x+uv.y)/2, 1);
    
    return result;
}

[[ stitchable ]] half4 uvColorEffect4(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, 0, 1-uv.y, 1);
    
    return result;
}

[[ stitchable ]] half4 uvColorEffect5(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(1-uv.x, 0, 1-uv.y, 1);
    
    return result;
}

[[ stitchable ]] half4 uvColorEffect6(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(1-uv.x, uv.x, 1-uv.y, 1);
    
    return result;
}

[[ stitchable ]] half4 uvImage(float2 position, half4 color, float2 size) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(half2(uv),1,1)*color.grba;
    
    return result;
}

[[ stitchable ]] half4 simpleUVMix(float2 position, half4 color, float2 size, float mixFactor) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 newColor = half4(uv.x,uv.y,0,1);
    
    return mix(color, newColor, half4(mixFactor));
}

[[ stitchable ]] half4 uvMix(float2 position, half4 color, float2 size, float4 mixFactors) {
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 newColor = half4(uv.x,uv.y,0,1);
    
    return mix(color, newColor, half4(mixFactors));
}
