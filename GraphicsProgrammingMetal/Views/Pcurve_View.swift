import SwiftUI

struct Pcurve_View: View {
    @State private var a = 3.0
    @State private var b = 1.0

    let dim: CGFloat
    init(dim: CGFloat = 300.0) {
        self.dim = dim
    }
    
    var body: some View {
        VStack {
            Image(systemName: "figure.dance")
                .resizable()
                .frame(width: dim, height: dim)
                .scaledToFill()
                .visualEffect { [a,b]
                    content, proxy in
                    content.colorEffect(
                        ShaderLibrary.pCurveShader(
                            .float2(proxy.size),
                            .float(a),
                            .float(b)
                        )
                    )
                }
            
            Slider(value: $a, in: 0...20)
            Slider(value: $b, in: 0...20)
        }
    }
}

#Preview {
    Pcurve_View()
}
