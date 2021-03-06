import Combine
import DataLayer
import Foundation

class SearchViewModel: ObservableObject {
    enum State {
        case start
        case searching
        case list(items: [FoodInfo])
        case error
    }

    private let searchService: SearchServiceProtocol
    private let addToLogHandler: (FoodInfo) -> ()

    private var searchTask: Task<Void, Never>?

    @Published var state = State.start

    @Published var searchText = "" {
        willSet {
            state = .searching
        }

        didSet {
            beginSearch()
        }
    }

    init(graph: DependencyGraphProtocol,
         addToLogHandler: @escaping (FoodInfo) -> ()) {
        self.searchService = graph.searchService
        self.addToLogHandler = addToLogHandler
    }

    func beginSearch() {
        searchTask?.cancel()

        guard searchText.count >= 3 else {
            state = .start

            return
        }

        searchTask = Task {
            do {
                let newItems = try await searchService.search(for: searchText)

                DispatchQueue.main.async { [weak self] in
                    self?.state = .list(items: newItems)
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.state = .error
                }
            }
        }
    }

    func addToLog(food: FoodInfo) {
        addToLogHandler(food)
    }
}
