import Foundation

public protocol NetworkEngineProtocol {
    /// Perform a `NetworkRequest` and decode the response
    /// - Parameter request: A `NetworkRequest` object
    /// - Returns: Decoded response
    func perform<Request: NetworkRequest>(request: Request) async throws -> Request.Response
}
