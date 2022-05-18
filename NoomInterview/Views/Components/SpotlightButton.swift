import SwiftUI

struct SpotlightButton: View {
    let text: String
    let color: Color
    let action: () -> ()

    var body: some View {
        Button(action: action) {
            Text(text.uppercased())
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.heavy)
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
                .background(color)
                .cornerRadius(10)
        }
    }
}

struct SpotlightButton_Previews: PreviewProvider {
    static var previews: some View {
        SpotlightButton(text: "Submit",
                        color: .blue) {}
    }
}
