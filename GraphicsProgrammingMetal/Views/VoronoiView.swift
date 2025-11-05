import SwiftUI

struct VoronoiView: View {
    private let startDate = Date()
    
    var body: some View {
        TimelineView(.animation) { _ in
            Rectangle()
                .ignoresSafeArea()
                .font(.largeTitle)
                .visualEffect {
                    content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.voronoiShader(
                                .float2(proxy.size),
                                .float(startDate.timeIntervalSinceNow)
                            )
                        )
                }
        }
    }
}

#Preview {
    VoronoiView()
}
