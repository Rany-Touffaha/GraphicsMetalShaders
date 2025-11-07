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
    
    
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .bold()
            .padding()
            .background(.black)
            .clipShape(Capsule())
    }
}

#Preview {
    fbmButtonView(text: "Press Me")
        .padding()
}
