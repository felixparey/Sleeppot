import SwiftUI

struct ChatView: View {
    let frameCount = 48 // Assuming frames are named from resp0 to resp47
    @State private var currentFrame: Int = 0

    var body: some View {
        GeometryReader { geometry in
            Image("resp\(currentFrame)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaleEffect(x:2.0,y:2.0)
                .offset(x:0,y:-40)
                .shadow(color:.shadowhead,radius: 50)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                    // Create a timer for the animation loop (1/24 fps)
                    Timer.scheduledTimer(withTimeInterval: 1.0 / 24.0, repeats: true) { timer in
                        currentFrame = (currentFrame + 1) % frameCount
                    }
                }
        }
    }
}
