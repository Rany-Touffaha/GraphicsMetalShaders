import SwiftUI

struct fbmButtonView: View {
    let text: String
    let enabled: Bool
    
    let timeOffset: Double
    
    
    @State private var isPressed = false
    @State private var startDate = Date()
    
    init(text: String, enabled: Bool = true, timeOffset: Double = 100.0) {
        self.text = text
        self.enabled = enabled
        self.timeOffset = timeOffset
        self.isPressed = isPressed
        self.startDate = startDate
    }
    
    var mainText: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .bold()
            .padding()
            .background(.black)
    }
    
    var body: some View {
        ZStack {
            TimelineView(.animation) { context in
                mainText
                    .fbmShader(
                        time: context.date.timeIntervalSince1970 - startDate.timeIntervalSince1970 + timeOffset,
                        enabled: enabled
                    )
            }
            .clipShape(Capsule())
        }
    }
}

extension View {
    func fbmShader(time: Double, enabled: Bool) -> some View {
        self
            .colorEffect(
                ShaderLibrary
                    .fbmShader(
                        .boundingRect,
                        .float(time)
                    ),
                isEnabled: enabled
            )
    }
    
    
    
}


#Preview {
    fbmButtonView(text: "Press Me")
        .padding()
}
