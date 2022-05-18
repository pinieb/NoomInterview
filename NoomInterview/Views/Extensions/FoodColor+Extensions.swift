import SwiftUI

extension FoodColor {
    var viewColor: Color {
        switch self {
        case .green: return Color("GreenFood")
        case .yellow: return Color("YellowFood")
        case .red: return Color("RedFood")
        }
    }
}
