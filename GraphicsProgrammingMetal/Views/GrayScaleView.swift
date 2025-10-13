import SwiftUI
import SwiftData

@Model
class WeightsModel{
    var name: String
    var weight1: Double
    var weight2: Double
    var weight3: Double
    
    init(name: String, weight1: Double, weight2: Double, weight3: Double) {
        self.name = name
        self.weight1 = weight1
        self.weight2 = weight2
        self.weight3 = weight3
    }
}

struct Gray_Scale_View: View {
    @State private var w1 = 0.3333333
    @State private var w2 = 0.3333333
    var w3: Double{
        1 - w1 - w2
    }
    @Environment(\.modelContext) var modelContext
    @Query(sort: \WeightsModel.name, order: .forward) private var weightModels: [WeightsModel]

    
    var body: some View {
        NavigationStack{
            VStack{
                TreeView()
                    .colorEffect(
                        ShaderLibrary.grayScaleShader(
                            .float4(w1, w2, w3, 0)
                        )
                    )
                VStack(alignment: .leading){
                    Text("w1: \(w1.formatted())")
                    Slider(value: $w1, in: 0...1-w2)
                    Text("w2: \(w2.formatted())")
                    Slider(value: $w2, in: 0...1-w1)
                    Text("w3: \(w3.formatted())")
                }
                
                HStack{
                    SetWeightsButton(title: "Average",
                                     w1: $w1,
                                     w2: $w2,
                                     newWeight1: 0.3333333,
                                     newWeight2: 0.3333333)
                    SetWeightsButton(title: "601 Luma",
                                     w1: $w1,
                                     w2: $w2,
                                     newWeight1: 0.299,
                                     newWeight2: 0.587)
                    SetWeightsButton(title: "709 Rec",
                                     w1: $w1,
                                     w2: $w2,
                                     newWeight1: 0.2126,
                                     newWeight2: 0.7152)
                }
                if weightModels.isEmpty{
                    Text("Save favorite gray scale weights")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                } else{
                    List(weightModels) { item in
                        Text("\(item.name): \(item.weight1.formatted()), \(item.weight2.formatted()), \(item.weight3.formatted())")
                    }
                }
            }
            .padding()
            .navigationTitle("Gray Scale Slider")
            .toolbar{
                Button("Add",
                       systemImage: "plus.circle",
                       action: add
                )
            }
        }
    }
    
    func add(){
        let item = WeightsModel(
            name: "Weights \(weightModels.count+1)",
            weight1: w1,
            weight2: w2,
            weight3: w3
        )
        modelContext
            .insert(item)
        
        
    }
}

struct SetWeightsButton: View {
    let title: String
    @Binding var w1: Double
    @Binding var w2: Double
    let newWeight1: Double
    let newWeight2: Double
    
    var body: some View {
        Button(title){
            w1 = newWeight1
            w2 = newWeight2
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    Gray_Scale_View()
        .modelContainer(for:WeightsModel.self)
}
