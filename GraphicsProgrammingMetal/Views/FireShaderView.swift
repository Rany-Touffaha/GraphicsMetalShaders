import SwiftUI

struct FireShaderView: View {
    private let startDate = Date()
    
    var body: some View {
        Text("Fire Shader")
            .font(.largeTitle)
            .bold()
        
        Spacer()
        
        TimelineView(.animation) { _ in
            Rectangle()
                .frame(width: 300, height: 300)
                .visualEffect {
                    content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.fireShader(
                                .float2(proxy.size),
                                .float(startDate.timeIntervalSinceNow)
                            )
                        )
                }
        }
        
        Spacer()
    }
}

#Preview {
    FireShaderView()
}
