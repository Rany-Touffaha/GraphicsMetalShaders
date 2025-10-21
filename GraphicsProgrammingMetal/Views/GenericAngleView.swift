import SwiftUI

struct GenericAngleView: View {
    let shaderFunction: ShaderFunction
    
    @State private var force = 0.0
    @State private var angleRadians = 0.0
    let maxAngle = 2 * Double.pi
    let minForce: Double
    let maxForce: Double
    let numberOfButtons: Int
    
    init(shaderFunction: ShaderFunction, force: Double = 0.0, angleRadians: Double = 0.0, minForce: Double = -300.0, maxForce: Double = 300.0, numberOfButtons: Int = 8) {
        self.shaderFunction = shaderFunction
        self.force = force
        self.angleRadians = angleRadians
        self.minForce = minForce
        self.maxForce = maxForce
        self.numberOfButtons = numberOfButtons
    }
    
    var angleDegrees: Double {
        angleRadians * 180 / Double.pi
    }
    
    
    
    var body: some View {
        VStack {
            TreeView()
                .visualEffect { [force, angleRadians]
                    content, proxy in
                    content
                        .distortionEffect(
                            shaderFunction(
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
    GenericAngleView(shaderFunction: ShaderLibrary.angleShader)
}
