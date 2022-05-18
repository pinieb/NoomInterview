import Foundation

protocol SearchServiceProtocol {
    func search(for text: String) async throws -> [FoodInfo]
}

class SearchService: SearchServiceProtocol {
    var session = URLSession.shared

    func search(for text: String) async throws -> [FoodInfo] {
        guard text.count >= 3 else { return [] }

        let request = try SearchRequest(searchTerm: text).request
        let (data, _) = try await session.data(for: request)

        let decoder = JSONDecoder()
        return try decoder.decode([FoodInfo].self, from: data)
    }
}
