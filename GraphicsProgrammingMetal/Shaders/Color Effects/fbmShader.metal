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



// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 fbmShader(float2 position, half4 color, float4 bounds, float time) {
    
    return half4(1.0, 0.0, 0.0, 1.0);
}
