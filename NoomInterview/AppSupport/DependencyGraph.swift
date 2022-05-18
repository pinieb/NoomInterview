import DataLayer
import NetworkEngine

protocol DependencyGraphProtocol {
    var searchService: SearchServiceProtocol { get }
}

class DependencyGraph: DependencyGraphProtocol {
    let networkEngine: NetworkEngineProtocol
    let searchService: SearchServiceProtocol

    init() {
        networkEngine = NetworkEngine()
        searchService = SearchService(networkEngine: networkEngine)
    }
}
