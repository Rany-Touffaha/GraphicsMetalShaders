#include <metal_stdlib>
using namespace metal;

float2 hashSmoke(float2 p)
{
    p = float2( dot(p, float2(127.1, 311.7)),
               dot(p, float2(269.5, 183.3)));
    return -1.0 + 2.0 * fract(sin(p) * 43758.5453123);
}

float noiseSmokeShader(float2 p)
{
    const float K1 = 0.366025404;
    const float K2 = 0.211324865;
    
    float2 i = floor( p + (p.x + p.y) * K1);
    
    float2 a = p - i + (i.x + i.y)* K2;
    float2 o = (a.x > a.y) ? float2(1.0, 0.0) : float2 (0.0, 1.0);
    float2 b = a - o + K2;
    float2 c = a - 1.0 + 2.0*K2;
    
    float3 h = max( 0.5 - float3(dot(a, a), dot(b, b), dot(c, c)), 0.0);
    
    float3 n = h*h*h*h*float3( dot(a, hashSmoke(i + 0.0)), dot(b, hashSmoke(i+o)), dot(c, hashSmoke(i+1.0)));
    
    return dot(n, float3(70.0));
}

float fbmSmoke(float2 uv)
{
    float f;
    float2x2 m = float2x2(1.6, 1.2, -1.2, 1.6);
    f = 0.5000*noiseSmokeShader(uv); uv = m*uv;
    f += 0.2500*noiseSmokeShader(uv); uv = m*uv;
    f += 0.1250*noiseSmokeShader(uv); uv = m*uv;
    f += 0.0625*noiseSmokeShader(uv); uv = m*uv;
    f += 0.5 + 0.5*f;
    return f;
}

[[ stitchable ]] half4 smokeShader(float2 position, half4 color, float2 size, float time) {
    
    float numberOfFlames = 1.;
    float timeFactor = 0.1;
    float softness = 1.0;
    float xDirection = 0.9;
    float yDirection = 0.5;
    
    float2 uv = position / size;
    
    float2 q = uv;
    q.x *= numberOfFlames;
    q.y *= 1.5;
    float strength = floor(q.x + 1.);
    float T3 = max(3., 1.25 * strength) * time * timeFactor;
    
    float floatPart = 1.;
    q.x = modf(q.x, floatPart) - 0.5;
    q.y -= 0.25;
    
    float n = fbmSmoke(strength*q - float2(xDirection*T3, yDirection*T3));
    float c = 1. - softness * pow( max(0., length(q*float2(1.8+q.y*1.5, 0.75)) - n * max(0., q.y+ 0.25)),1.2);
    
    float fade = 1 - pow(1.8*uv.y, 2.0);
    
    float c1 = n * c * fade;
    c1=clamp(c1, 0., 1.);
    
    half3 col = half3(c1*0.6);
    
    #ifdef  BLUE_FLAME
        col = col.xyz;
    #endif
    #ifdef GREEN_FLAME
        col = 0.85*col.xyz;
    #endif
    
    float a = c * (1. - pow(uv.y, 2.5)) * 0.5;
    
    half3 neonPurple = half3(0.70, 0.0, 1.00);
    
    half4 result = half4 (mix(neonPurple, col, a), 1.0);
    
    return result;
}
