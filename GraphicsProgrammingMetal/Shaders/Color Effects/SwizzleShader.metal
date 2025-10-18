#include <metal_stdlib>
using namespace metal;

// Color Effect Snippet
[[ stitchable ]] half4 swizzle1(float2 position, half4 color) {
    half4 result = color.rgba;
    
    return result;
}

[[ stitchable ]] half4 swizzle2(float2 position, half4 color) {
    half4 result = color.rrra;
    
    return result;
}

[[ stitchable ]] half4 swizzle3(float2 position, half4 color) {
    half4 result = color.gbra;
    
    return result;
}

[[ stitchable ]] half4 swizzle4(float2 position, half4 color) {
    half4 result = color.ggra;
    
    return result;
}

[[ stitchable ]] half4 swizzle5(float2 position, half4 color) {
    half4 result = color.yyzw;
    
    return result;
}

[[ stitchable ]] half4 swizzle6(float2 position, half4 color) {
    half4 result = half4(color.rg,0,1);
    
    return result;
}

[[ stitchable ]] half4 swizzle7(float2 position, half4 color) {
    
    half4 result;
    result.rgba = half4(1,0,0,0);
    result.abgr = result;
    result.rg = half2(1);
    
    return result;
}
/*
 Text("Color Effect!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.<#myColorEffect#>())
 */
