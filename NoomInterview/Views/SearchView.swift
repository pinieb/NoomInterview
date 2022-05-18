import SwiftUI
import DataLayer

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            content
                .navigationTitle("FIND FOOD")
                .styledNavBar()
                .searchable(text: $viewModel.searchText,
                            prompt: "Search for food")
        }
    }

    @ViewBuilder
    private var content: some View {
        if case .searching = viewModel.state {
            ProgressView()
        } else if case let .list(items) = viewModel.state {
            resultsView(items: items)
        } else {
            VStack {
                EmptyStateText("Enter at least 3 characters")
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func resultsView(items: [FoodInfo]) -> some View {
        if items.isEmpty {
            VStack {
                EmptyStateText("No results for \"\(viewModel.searchText)\"")
                Spacer()
            }
        } else {
            List(items) { item in
                NavigationLink(destination: {
                    FoodDetailView(item: item,
                                   buttonInfo: .init(text: "Add to log",
                                                     action: { viewModel.addToLog(food: item) }))
                }) {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.brand)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                }
                .swipeActions(edge: .leading,
                              allowsFullSwipe: false) {
                    Button(action: { viewModel.addToLog(food: item) }) {
                        Label("Add", systemImage: "plus")
                    }
                    .tint(item.color.viewColor)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(graph: DependencyGraph(),
                                              addToLogHandler: { _ in }))
    }
}
