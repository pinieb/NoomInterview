import Foundation

public struct FoodLog {
    public struct Entry: Identifiable {
        public let id = UUID()
        public let food: FoodInfo
    }

    public private(set) var entries: [Entry] = []

    public var totalCalories: Int {
        var sum = 0

        entries.forEach { entry in
            sum += entry.food.caloriesPerPortion
        }

        return sum
    }

    public init() {}

    public mutating func add(food: FoodInfo) {
        entries.append(Entry(food: food))
    }

    public mutating func remove(id: UUID) {
        entries.removeAll { $0.id == id }
    }
}
