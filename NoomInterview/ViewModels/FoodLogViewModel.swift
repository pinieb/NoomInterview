import Combine

class FoodLogViewModel: ObservableObject {
    private let graph: DependencyGraphProtocol

    lazy private(set) var searchViewModel = SearchViewModel(graph: graph,
                                                            addToLogHandler: addToLog)

    @Published var foodLog = FoodLog()

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
