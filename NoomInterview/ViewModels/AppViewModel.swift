import Combine

class AppViewModel: ObservableObject {
    private let graph: DependencyGraphProtocol

    lazy private(set) var foodLogViewModel = FoodLogViewModel(graph: graph)

    init(graph: DependencyGraphProtocol) {
        self.graph = graph
    }
}
