#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet with Size and Time parameter
[[ stitchable ]] half4 LavaLampShader(float2 position, half4 color, float2 size, float time, float threshold, float distanceFactor) {
    
    float2 uv = position / size; //normalise values between 0 and 1
    
    half4 result = half4(half3(0.0), 1);
    
    // Create some blobs
    // xy represents position
    // z represents "strength"
    float3 blobCenters[4];
    blobCenters[0] = float3(0.6,0.6,0.5);
    blobCenters[1] = float3(0.5,0.55,0.6);
    blobCenters[2] = float3(0.2,0.3,0.3);
    blobCenters[3] = float3(0.1,0.4,0.6);
    
    // Number of blobs
    unsigned long int n = sizeof(blobCenters) / sizeof(blobCenters[0]);
    
    // Influence of blobs
    float influence = 0.0;

    for(unsigned long int i = 0; i < n; i++){
        float distanceToCenter = distance(size*blobCenters[i].xy, position) * (1 / distanceFactor);
        
        influence += blobCenters[i].z / distanceToCenter;
        
        if(influence > threshold) {
            result = half4(1.0);
        }
        
    }
    
    return result;
}
