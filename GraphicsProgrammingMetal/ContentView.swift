import SwiftUI

struct ContentView: View {
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
