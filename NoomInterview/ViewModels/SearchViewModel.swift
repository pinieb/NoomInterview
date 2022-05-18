import Combine
import Foundation

class SearchViewModel: ObservableObject {
    enum State {
        case start
        case searching
        case list
        case error
    }

    private let searchService: SearchServiceProtocol
    private let addToLogHandler: (FoodInfo) -> ()

    private var searchTask: Task<Void, Never>?

    @Published var state = State.start
    @Published var isSearching = false
    @Published var searchText = "" {
        didSet {
            beginSearch()
        }
    }

    @Published var items = [FoodInfo]()

    init(graph: DependencyGraphProtocol,
         addToLogHandler: @escaping (FoodInfo) -> ()) {
        self.searchService = graph.searchService
        self.addToLogHandler = addToLogHandler
    }

    func beginSearch() {
        searchTask?.cancel()

        guard searchText.count >= 3 else {
            items = []
            isSearching = false
            state = .start

            return
        }

        searchTask = Task {
            do {
                DispatchQueue.main.async { [weak self] in
                    self?.state = .searching
                }

                let newItems = try await searchService.search(for: searchText)

                DispatchQueue.main.async { [weak self] in
                    self?.items = newItems
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.state = .error
                }
            }

            DispatchQueue.main.async { [weak self] in
                self?.state = .list
            }
        }
    }

    func addToLog(food: FoodInfo) {
        addToLogHandler(food)
    }
}
