//
//  SwiftUIView.swift
//  Sleepot
//
//  Created by Gianrocco Di Tomaso on 24/10/23.
//

import SwiftUI

struct IdleView: View {
    let frameCount = 96 // Assuming frames are named from idle0.png to idle95.png
    @State private var currentFrame: Int = 0

    var body: some View {
        GeometryReader { geometry in
            Image("idle\(currentFrame)")
                .resizable()
                .scaleEffect(x:1.3,y:1.3)
                .aspectRatio(contentMode: .fill)
                .offset(y:-30)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                // Create a timer for the animation loop
                    Timer.scheduledTimer(withTimeInterval: 1.0 / 30.0, repeats: true) { timer in
                        currentFrame = (currentFrame + 1) % frameCount
                    }
                }
        }
    }
}
struct FirstFrame_Previews: PreviewProvider {
    static var previews: some View {
        IdleView()
        }
    }



//import SwiftUI
//
//struct IdleView: View {
//    @State private var degrees = 0.0
//    @State private var yOffset = 0.0 // Added @State for Y offset
//    @State private var isLooping = false
//
//    var body: some View {
//        ZStack {
//
//            VStack {
//                Image("headIdle")
//                    .resizable()
//                    .scaleEffect(y: 1.3)
//                    .offset(x: -3, y: 8 + yOffset) // Apply yOffset here
//                    .rotationEffect(.degrees(degrees))
//                    .shadow(color: .gray,  radius: 30)
//
//                Slider(value: $degrees, in: -10.0...10.0)
//                    .padding()
//                    .hidden()
//            }
            //            Image("mainBody")
            //                .resizable()
            //                .offset(x: 0.0, y: -27 + yOffset)
            //                .shadow(color: .gray,  radius: 30)
            //        }
            //        .onAppear() {
            //            animateRotation()
            //        }
            //    }
            //
            //    func animateRotation() {
            //        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            //            withAnimation(Animation.easeInOut(duration: 2)) {
            //                degrees = degrees == 10.0 ? -10.0 : 10.0
            //            }
            //            withAnimation(Animation.linear(duration: 8)) {
            //                yOffset = yOffset == 20.0 ? -20.0 : 20.0 // Toggle between 3 and -3
            //            }
            //        }
            //    }
            //}
            //
            //struct FirstFrame_Previews: PreviewProvider {
            //    static var previews: some View {
            //        IdleView()
//        }
//    }
//}
