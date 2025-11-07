import SwiftUI

struct FractalBrownianView: View {
    @State private var showExplanation = false
    var text: String {
        showExplanation ? "Hide Explanation" : "Press Me"
    }
    
    var textOpacity: Double {
        showExplanation ? 1.0 : 0.0
    }
    
    var imageOpacity: Double {
        showExplanation ? 0.5 : 0.85
    }
    
    let fbmExplanation = "This is a Fractal Brownian Motion"
    
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.2)
                .ignoresSafeArea()
            VStack {
                Text("Fractal Brownian Motion")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Image("clouds")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(imageOpacity)
                    .overlay {
                        Text(fbmExplanation)
                            .font(.title)
                            .opacity(textOpacity)
                            .padding()
                            .minimumScaleFactor(0.5)
                    }
                
                Spacer()
                
                Button {
                    withAnimation {
                        showExplanation.toggle()
                    }
                } label: {
                    fbmButtonView(text: text)
                }
            }
            .padding()
        }
    }
}

#Preview {
    FractalBrownianView()
}
