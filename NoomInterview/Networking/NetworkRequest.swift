import Foundation

protocol NetworkRequest {
    var request: URLRequest { get throws }
}
