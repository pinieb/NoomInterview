import SwiftUI

struct FoodLogEntryView: View {
    let entry: FoodLog.Entry

    var body: some View {
        HStack {
            Circle()
                .fill(entry.food.color.viewColor)
                .frame(width: 10)

            Text(entry.food.name)
        }
    }
}
