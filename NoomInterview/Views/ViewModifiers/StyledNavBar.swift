import SwiftUI

struct StyledNavBar: ViewModifier {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 40,
                                     weight: .heavy)
        ]
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func styledNavBar() -> some View {
        self.modifier(StyledNavBar())
    }
}
