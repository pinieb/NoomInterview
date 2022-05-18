import SwiftUI

struct FoodLogView: View {
    @ObservedObject var viewModel: FoodLogViewModel

    @State var isOverlayShowing = false

    var body: some View {
        NavigationView {
            content
            .toolbar {
                Button(action: { isOverlayShowing.toggle() }) {
                    Label("Add food", systemImage: "plus")
                }
            }
            .navigationTitle("FOOD LOG")
            .styledNavBar()
        }
        .popover(isPresented: $isOverlayShowing) {
            SearchView(viewModel: viewModel.searchViewModel)
        }
    }

    private var content: some View {
        VStack {
            if viewModel.foodLog.entries.isEmpty {
                EmptyStateText("No food added yet")
            } else {
                VStack {
                    List(viewModel.foodLog.entries) { entry in
                        NavigationLink(destination:
                            FoodDetailView(item: entry.food,
                                           buttonInfo: .init(text: "Remove",
                                                             action: { viewModel.remove(entry) })
                                          )
                        ) {
                            FoodLogEntryView(entry: entry)
                        }
                        .swipeActions(edge: .trailing,
                                      allowsFullSwipe: false) {
                            Button(action: { viewModel.remove(entry) }) {
                                Label("Delete entry", systemImage: "trash.fill")
                            }
                            .tint(Color("RedFood"))
                        }
                    }

                    DetailPair(value: "\(viewModel.totalCalories)",
                               label: "calories in this meal")
                }
            }

            Spacer()
        }
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView(viewModel: FoodLogViewModel(graph: DependencyGraph()))
    }
}
