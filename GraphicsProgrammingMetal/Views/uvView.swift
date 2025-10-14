import SwiftUI

struct uvView: View {
    @State private var mixFactor = 0.5
    
    @State private var r = 0.5
    @State private var g = 0.5
    @State private var b = 0.5
    @State private var a = 0.5
    
    var body: some View {
        Form {
            DisclosureGroup("UV Example 1") {
                TreeView()
                    .visualEffect {
                        content, proxy in
                        content.colorEffect(
                            ShaderLibrary.uvColorEffect1(
                                .float2(proxy.size)
                            )
                        )
                    }
            }
            DisclosureGroup("UV Example 2") {
                TreeView()
                    .visualEffect {
                        content, proxy in
                        content.colorEffect(
                            ShaderLibrary.uvColorEffect2(
                                .float2(proxy.size)
                            )
                        )
                    }
            }
            DisclosureGroup("UV Example 3") {
                TreeView()
                    .visualEffect {
                        content, proxy in
                        content.colorEffect(
                            ShaderLibrary.uvColorEffect3(
                                .float2(proxy.size)
                            )
                        )
                    }
            }
            DisclosureGroup("UV Example 4") {
                TreeView()
                    .visualEffect {
                        content, proxy in
                        content.colorEffect(
                            ShaderLibrary.uvColorEffect4(
                                .float2(proxy.size)
                            )
                        )
                    }
            }
            DisclosureGroup("UV Example 5") {
                TreeView()
                    .visualEffect {
                        content, proxy in
                        content.colorEffect(
                            ShaderLibrary.uvColorEffect5(
                                .float2(proxy.size)
                            )
                        )
                    }
            }
            DisclosureGroup("UV Example 6") {
                TreeView()
                    .visualEffect {
                        content, proxy in
                        content.colorEffect(
                            ShaderLibrary.uvColorEffect5(
                                .float2(proxy.size)
                            )
                        )
                    }
            }
            Section {
                DisclosureGroup("UV Image") {
                    TreeView()
                        .visualEffect {
                            content, proxy in
                            content.colorEffect(
                                ShaderLibrary.uvImage(
                                    .float2(proxy.size)
                                )
                            )
                        }
                }
                DisclosureGroup("Simple UV Mix") {
                    TreeView()
                        .visualEffect { [mixFactor]
                            content, proxy in
                            content.colorEffect(
                                ShaderLibrary.simpleUVMix(
                                    .float2(proxy.size),
                                    .float(mixFactor)
                                )
                            )
                        }
                    Slider(value: $mixFactor, in: 0...1)
                }
                DisclosureGroup("UV Mix") {
                    TreeView()
                        .visualEffect { [r,g,b,a]
                            content, proxy in
                            content.colorEffect(
                                ShaderLibrary.uvMix(
                                    .float2(proxy.size),
                                    .float4(r,g,b,a)
                                )
                            )
                        }
                    Slider(value: $r, in: 0...1)
                    Slider(value: $g, in: 0...1)
                    Slider(value: $b, in: 0...1)
                    Slider(value: $a, in: 0...1)
                }
            }
        }
    }
}

#Preview {
    uvView()
}
