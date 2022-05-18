import Foundation

public protocol NetworkRequest {
    associatedtype Response: Codable

    var urlRequest: URLRequest { get throws }
}
