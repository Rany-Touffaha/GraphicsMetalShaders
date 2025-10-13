import SwiftUI

struct ContentView: View {
    @State private var amplitude = 2.0
    
    var body: some View {
        VStack {
            Text("Color Effect!")
                .font(.largeTitle)
                .colorEffect(ShaderLibrary.myColorEffect())
            
            Text("Distortion Effect!")
                .font(.largeTitle)
                .distortionEffect(
                    ShaderLibrary.myDistortionEffect(),
                    maxSampleOffset: .zero
                )

            Text("Layer Effect!")
                .font(.largeTitle)
                .layerEffect(
                    ShaderLibrary.myLayerEffect(),
                    maxSampleOffset: .zero
                )
            
            Text("Distortion Effect!")
                .font(.largeTitle)
                .distortionEffect(
                    ShaderLibrary.SineDistortionEffect(
                        .float(amplitude)
                    ),
                    maxSampleOffset: .zero
                )
            Slider(value: $amplitude, in: -5...5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
