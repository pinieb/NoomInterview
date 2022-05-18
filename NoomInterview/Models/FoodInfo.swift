import Foundation

struct FoodInfo {
    enum CodingKeys: String, CodingKey {
        case id
        case brand
        case name
        case caloriesPer100Grams = "calories"
        case portionSize = "portion"
    }

    let id: Int
    let brand: String
    let name: String
    let caloriesPer100Grams: Int
    let portionSize: Int

    var color: FoodColor {
        if caloriesPer100Grams < 300 {
            return .green
        }

        if caloriesPer100Grams < 600 {
            return .yellow
        }

        return .red
    }

    var calories: Int {
        Int(Double(caloriesPer100Grams) / Double(max(portionSize, 1)) * 100)
    }
}

extension FoodInfo: Codable {}
extension FoodInfo: Identifiable {}
