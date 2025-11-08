#include <metal_stdlib>
using namespace metal;

float hash(float n) {
    return fract(sin(n)*753.5453123);
}

float noise(float2 x) {
    float2 p = floor(x);
    float2 f = fract(x);
    
    f = f*f*(3.0 - 2.0*f);
    
    float n = p.x + p.y * 157.0;
    float v1 = mix(hash(n), hash(n + 1.0), f.x);
    float v2 = mix(hash(n + 157.0), hash(n + 158.0), f.x);
    
    return mix(v1, v2, f.y);
}

float fbm(float2 p, half3 a) {
    int OCTAVES = 3;
    
    half2 uv = half2(p.xy);
    
    float v = 0.0;
    float aa = 0.5;
    half2 shift = half2(100.0, 100.0);
    
    float angle = 0.2;
    
    half2x2 rotationMatrix = half2x2(cos(angle), sin(angle),
                                     -sin(angle), cos(angle));
    
    for(int i = 0; i < OCTAVES; ++i) {
        v += aa * noise(float2(uv));
        uv = rotationMatrix * uv * 2.0 + shift;
        a *= 0.5;
    }
    
    return v;
}

half3 drawLines(float2 uv, float time) {
    
    float timeVal = time;
    timeVal *= 0.05;
    
    half sinTime = abs(sin(timeVal));
    half cosTime = abs(cos(timeVal));
    
    half3 finalColor = half3(0.0);
    half3 colorSets[4] = {
        half3(0.7*sinTime, 0.05*cosTime,sinTime),
        half3(sinTime,0.19,0.0),
        half3(0.0,cosTime,0.3),
        half3(0.0,0.38,1.0)
    };
    
    for(int i = 0; i <4; ++i) {
        float indexAsFloat = float(i);
        float amp = 10.0 + indexAsFloat*0.1;
        float period = 2.0 + indexAsFloat*2.0;
        float thickness = mix(0.4,0.2,noise(uv*2.0));
        
        float t = abs(1. / (sin(uv.y + fbm(uv + timeVal*period, half3(1.0)))*amp)*thickness);
        
        finalColor += t*colorSets[i];
        
        
    }
    
    return finalColor;
}


// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 fbmShader(float2 position, half4 color, float4 bounds, float time) {
    float2 uv = (position / bounds.w) - 1.0;
    uv *= 1.5;
    
    half3 finalColor = half3(0.0);
    
    int glowFactor = 1;
    for(int i = 0; i < glowFactor; ++i){
        finalColor += drawLines(uv, abs(time));
    }
    
    return half4(finalColor, 1.0);
}
