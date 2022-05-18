import Foundation

struct SearchRequest: NetworkRequest {
    private static let baseURL = "https://uih0b7slze.execute-api.us-east-1.amazonaws.com/dev/search"
    private let components: URLComponents

    init(searchTerm: String) {
        var components = URLComponents(string: SearchRequest.baseURL)!
        components.queryItems = [URLQueryItem(name: "kv", value: searchTerm)]

        self.components = components
    }

    var request: URLRequest {
        get throws {
            guard let url = components.url else {
                throw URLError(.badURL)
            }

            return URLRequest(url: url)
        }
    }
}
