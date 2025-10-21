import SwiftUI

struct AngleView: View {
    @State private var force = 0.0
    @State private var angleRadians = 0.0
    let maxAngle = 2 * Double.pi
    let minForce = -300.0
    let maxForce = 300.0
    
    var angleDegrees: Double {
        angleRadians * 180 / Double.pi
    }
    
    let numberOfButtons = 8
    
    var body: some View {
        VStack {
            TreeView()
                .visualEffect { [force, angleRadians]
                    content, proxy in
                    content
                        .distortionEffect(
                            ShaderLibrary.angleShader(
                                .float2(proxy.size),
                                .float(force),
                                .float(angleRadians)
                            ),
                            maxSampleOffset: .zero
                        )
                }
            Slider(value: $force, in: minForce...maxForce)
            Slider(value: $angleRadians, in: 0...maxAngle)
            
            Button("Reset Force") {
                force = 0.0
            }.buttonStyle(BorderedButtonStyle())
            
            Text("\(angleDegrees.formatted()) degrees")
            
            HStack {
                ForEach(0..<numberOfButtons, id: \.self) { i in
                    Button("\(i)") {
                        let baseAngleRadians = 2*Double.pi / Double(numberOfButtons)
                        angleRadians = Double(i) * baseAngleRadians
                    }.buttonStyle(BorderedButtonStyle())
                }
            }
            Button("30 degrees") {
                angleRadians = (30 / 180) * Double.pi
            }.buttonStyle(BorderedButtonStyle())
            Image(systemName: "arrowshape.right.fill")
                .imageScale(.large)
                .rotationEffect(.radians(-angleRadians))
        }
        .padding()
    }
}

#Preview {
    AngleView()
}
