import DataLayer
import SwiftUI

struct FoodDetailView: View {
    struct ButtonInfo {
        let text: String
        let action: () -> ()
    }

    @Environment(\.presentationMode) var presentationMode

    let item: FoodInfo
    var buttonInfo: ButtonInfo?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(item.color)".uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(item.color.viewColor)

                    Text(item.name.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)

                    Text(item.brand.uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.secondary)

                    Divider()
                }

                VStack(alignment: .leading, spacing: 15) {
                    Text("NUTRITION INFO")
                        .fontWeight(.heavy)

                    VStack(alignment: .leading) {
                        DetailPair(value: "\(item.caloriesPer100Grams) calories",
                                   label: "per 100 grams")

                        DetailPair(value: "\(item.portionSize) grams",
                                   label: "per portion")
                    }

                    DetailPair(value: "\(item.caloriesPerPortion) calories",
                               label: "per portion",
                               valueWeight: .bold)
                }

                Spacer()

                buttonInfo.flatMap { info in
                    HStack {
                        Spacer()

                        SpotlightButton(text: info.text,
                                        color: item.color.viewColor) {
                            info.action()
                            presentationMode.wrappedValue.dismiss()
                        }

                        Spacer()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity,
                   alignment: .topLeading)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static let foodInfo = FoodInfo(id: 0,
                                   brand: "Starbucks",
                                   name: "Bacon, Gouda & Egg Sandwich",
                                   caloriesPer100Grams: 400,
                                   portionSize: 213)
    
    static var previews: some View {
        FoodDetailView(item: foodInfo)
    }
}
