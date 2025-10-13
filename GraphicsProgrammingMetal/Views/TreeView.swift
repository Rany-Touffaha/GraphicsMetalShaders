import SwiftUI

struct TreeView: View {
    var body: some View {
        Image("tree")
            .resizable()
            .frame(height: 300)
            .scaledToFit()
    }
}

#Preview {
    TreeView()
}
