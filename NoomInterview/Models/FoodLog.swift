import Foundation

struct FoodLog {
    struct Entry: Identifiable {
        let id = UUID()
        let food: FoodInfo
    }

    private(set) var entries: [Entry] = []

    mutating func add(food: FoodInfo) {
        entries.append(Entry(food: food))
    }

    mutating func remove(id: UUID) {
        entries.removeAll { $0.id == id }
    }
}
