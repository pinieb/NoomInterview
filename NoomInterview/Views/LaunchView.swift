import SwiftUI

struct LaunchView: View {
    @State var progress = 0.0

    var body: some View {
        ZStack {
            Color("LaunchBackground")

            NoomLogo(progress: progress)
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                progress = 1
            }
        }
    }
}

struct NoomLogo: View {
    let progress: CGFloat

    var body: some View {
        HStack(spacing: 10) {
            ProgressCircle(lineWidth: 20,
                           progress: progress)
                .frame(width: 100)

            ProgressCircle(lineWidth: 15
                           ,
                           progress: progress)
                .rotationEffect(.degrees(180))
                .frame(width: 30)
                .offset(y: -70)
        }
    }
}

struct ProgressCircle: View {
    let lineWidth: CGFloat
    let progress: CGFloat

    var body: some View {
        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .foregroundColor(.white)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
