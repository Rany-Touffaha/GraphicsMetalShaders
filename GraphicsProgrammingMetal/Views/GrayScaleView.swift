import SwiftUI

struct Gray_Scale_View: View {
    var body: some View {
        TreeView()
            .colorEffect(
                ShaderLibrary.grayScaleShader()
            )
    }
}

#Preview {
    Gray_Scale_View()
}
