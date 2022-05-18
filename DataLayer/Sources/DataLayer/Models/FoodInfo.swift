import Foundation

public struct FoodInfo {
    enum CodingKeys: String, CodingKey {
        case id
        case brand
        case name
        case caloriesPer100Grams = "calories"
        case portionSize = "portion"
    }

    public let id: Int
    public let brand: String
    public let name: String
    public let caloriesPer100Grams: Int
    public let portionSize: Int

    public init(id: Int,
                brand: String,
                name: String,
                caloriesPer100Grams: Int,
                portionSize: Int) {
        self.id = id
        self.brand = brand
        self.name = name
        self.caloriesPer100Grams = caloriesPer100Grams
        self.portionSize = portionSize
    }

    public var color: FoodColor {
        if caloriesPer100Grams < 300 {
            return .green
        }

        if caloriesPer100Grams < 600 {
            return .yellow
        }

        return .red
    }

    public var caloriesPerPortion: Int {
        Int(Double(caloriesPer100Grams) / Double(max(portionSize, 1)) * 100)
    }
}

extension FoodInfo: Codable {}
extension FoodInfo: Identifiable {}
