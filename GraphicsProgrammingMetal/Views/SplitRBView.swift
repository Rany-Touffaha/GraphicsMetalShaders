import SwiftUI

struct SplitRBView: View {
    @State private var percent = 0.5
    
    var body: some View {
        VStack {
            TreeView()
                .visualEffect{[percent] content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary
                                .splitRBShader(
                                    .float2(proxy.size),
                                    .float(percent)
                                )
                        )
                }
            Slider(value: $percent, in: 0...1)
        }.padding()
    }
}

#Preview {
    SplitRBView()
}
