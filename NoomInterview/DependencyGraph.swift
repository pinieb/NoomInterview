import Foundation

protocol DependencyGraphProtocol {
    var searchService: SearchServiceProtocol { get }
}

class DependencyGraph: DependencyGraphProtocol {
    let searchService: SearchServiceProtocol

    init() {
        searchService = SearchService()
    }
}
