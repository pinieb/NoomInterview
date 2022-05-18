public protocol SearchServiceProtocol {
    /// Send a request to the food search API
    /// - Parameter text: Search query
    /// - Returns: A list of `FoodInfo` objects that match the query
    func search(for text: String) async throws -> [FoodInfo]
}
