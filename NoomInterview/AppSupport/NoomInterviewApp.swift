import SwiftUI

@main
struct NoomInterviewApp: App {
    @StateObject var viewModel = AppViewModel(graph: DependencyGraph())

    var body: some Scene {
        WindowGroup {
            FoodLogView(viewModel: viewModel.foodLogViewModel)
        }
    }
}
