import SwiftUI

@main
struct NoomInterviewApp: App {
    @StateObject var viewModel = AppViewModel(graph: DependencyGraph())

    @State var shouldShowLaunch = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                FoodLogView(viewModel: viewModel.foodLogViewModel)

                if shouldShowLaunch {
                    LaunchView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    shouldShowLaunch.toggle()
                }
            }
        }
    }
}
