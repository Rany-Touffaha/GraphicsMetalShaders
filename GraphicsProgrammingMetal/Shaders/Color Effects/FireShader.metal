#include <metal_stdlib>
using namespace metal;

float2 hash(float2 p)
{
    p = float2( dot(p, float2(127.1, 311.7)),
               dot(p, float2(269.5, 183.3)));
    return -1.0 + 2.0 * fract(sin(p) * 43758.5453123);
}

float noise(float2 p)
{
    const float K1 = 0.366025404;
    const float K2 = 0.211324865;
    
    float2 i = floor( p + (p.x + p.y) * K1);
    
    float2 a = p - i + (i.x + i.y)* K2;
    float2 o = (a.x > a.y) ? float2(1.0, 0.0) : float2 (0.0, 1.0);
    float2 b = a - o + K2;
    float2 c = a - 1.0 + 2.0*K2;
    
    float3 h = max( 0.5 - float3(dot(a, a), dot(b, b), dot(c, c)), 0.0);
    
    float3 n = h*h*h*h*float3( dot(a, hash(i + 0.0)), dot(b, hash(i+o)), dot(c, hash(i+1.0)));
    
    return dot(n, float3(70.0));
}

float fbm(float2 uv)
{
    float f;
    float2x2 m = float2x2(1.6, 1.2, -1.2, 1.6);
    f = 0.5000*noise(uv); uv = m*uv;
    f = 0.2500*noise(uv); uv = m*uv;
    f = 0.1250*noise(uv); uv = m*uv;
    f = 0.0625*noise(uv); uv = m*uv;
    f = 0.5 + 0.5*f;
    return f;
}


[[ stitchable ]] half4 fireShader(float2 position, half4 color, float2 size, float time) {
    
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(uv.x, uv.y, 0, 1);
    
    return result;
}
