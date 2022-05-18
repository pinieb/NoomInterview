import SwiftUI

struct EmptyStateText: View {
    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.callout)
            .italic()
            .foregroundColor(.secondary)
            .padding()
    }
}

struct EmptyStateText_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateText("There's nothing here")
    }
}
