import SwiftUI

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

    private var content: AnyView {
        if viewModel.isSearching {
            return AnyView(ProgressView())
        }

        return AnyView(listView)
    }

    private var listView: some View {
        List(viewModel.items) { item in
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(graph: DependencyGraph(),
                                              addToLogHandler: { _ in }))
    }
}
