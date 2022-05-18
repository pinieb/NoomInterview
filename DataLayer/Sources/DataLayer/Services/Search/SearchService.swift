import NetworkEngine

public class SearchService: SearchServiceProtocol {
    private let networkEngine: NetworkEngineProtocol

    public init(networkEngine: NetworkEngineProtocol) {
        self.networkEngine = networkEngine
    }

    public func search(for text: String) async throws -> [FoodInfo] {
        guard text.count >= 3 else { return [] }

        let request = SearchRequest(searchTerm: text)
        let response = try await networkEngine.perform(request: request)

        return response
    }
}
