import SwiftUI

struct DetailPair: View {
    let value: String
    let label: String

    var valueWeight = Font.Weight.regular

    var body: some View {
        HStack(alignment: .lastTextBaseline,
               spacing: 5) {
            Text(value)
                .font(.callout)
                .fontWeight(valueWeight)

            Text(label)
                .font(.caption)
                .italic()
                .fontWeight(.light)
        }
    }
}

struct DetailPair_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            DetailPair(value: "100 grams",
                       label: "per portion")

            DetailPair(value: "123 calories",
                       label: "per portion",
                       valueWeight: .heavy)
        }
    }
}
