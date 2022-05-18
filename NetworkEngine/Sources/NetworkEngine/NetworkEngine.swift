import Foundation

public class NetworkEngine: NetworkEngineProtocol {
    let session: URLSession

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    /// - Note: This method can currently only perform GET requests
    public func perform<Request: NetworkRequest>(request: Request) async throws -> Request.Response {
        let request = try request.urlRequest
        let (data, _) = try await session.data(for: request)

        let decoder = JSONDecoder()
        return try decoder.decode(Request.Response.self, from: data)
    }
}
