import SwiftUI

struct SmokeShaderView: View {
    private let startDate = Date()
    
    var body: some View {
        Text("Smoke Shader")
            .font(.largeTitle)
            .bold()
        
        Spacer()
        
        TimelineView(.animation) { _ in
            Color.white.ignoresSafeArea()
                .visualEffect {
                    content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.smokeShader(
                                .float2(proxy.size),
                                .float(startDate.timeIntervalSinceNow)
                            )
                        )
                }
        }.mask {
            VStack{
                Text("🔥🔥🔥")
                Text("SMOKE")
            }
            .font(
                .system(
                    size: 80,
                    weight: .black,
                    design: .rounded
                )
            )
        }
        
        Spacer()
    }
}

#Preview {
    SmokeShaderView()
}
