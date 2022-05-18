import Combine
import DataLayer

class FoodLogViewModel: ObservableObject {
    private let graph: DependencyGraphProtocol

    var searchViewModel: SearchViewModel {
        SearchViewModel(graph: graph,
                        addToLogHandler: addToLog)
    }

    @Published var foodLog = FoodLog()

    var totalCalories: Int { foodLog.totalCalories }

    init(graph: DependencyGraphProtocol) {
        self.graph = graph
    }

    func addToLog(_ food: FoodInfo) {
        foodLog.add(food: food)
    }

    func remove(_ entry: FoodLog.Entry) {
        foodLog.remove(id: entry.id)
    }
}
