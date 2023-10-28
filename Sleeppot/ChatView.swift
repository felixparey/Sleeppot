//
//  ChatView.swift
//  Sleepot
//
//  Created by sara hu lihua on 28/10/23.
//

import SwiftUI

struct ChatView: View {
    
    @State private var yOffset = 0.0
    @State private var eyeXOffset = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var isScalingUp = false

    var body: some View {
        ZStack {
            

            ChatContainerView(yOffset: $yOffset, eyeXOffset: $eyeXOffset, scale: $scale)
        }
        .onAppear() {
            animateRotation()
        }
    }

    func animateRotation() {
        Timer.scheduledTimer(withTimeInterval: 1.8, repeats: true) { _ in
            withAnimation(Animation.linear(duration: 12)) {
                yOffset = yOffset == 15.0 ? -15.0 : 15.0
            }
            withAnimation(Animation.easeInOut(duration: 8)) {
                if scale == 1.0 {
                    scale = 1.3
                } else {
                    scale = 1.0
                }
            }
            withAnimation(Animation.easeInOut(duration: 4)) {
                eyeXOffset = eyeXOffset == 18.0 ? -18.0 : 18.0
            }
        }
    }
}

struct ChatContainerView: View {
    @Binding var yOffset: Double
    @Binding var eyeXOffset: Double
    @Binding var scale: CGFloat
    
    var body: some View {
        ZStack {
            Image("chat")
                .resizable()
                .offset(x: 0.0, y: -27 + yOffset)
                .scaleEffect(scale)
                .shadow(color: .gray, radius: 30)
                .zIndex(0)

            VStack {
                Image("eyes2")
                    .resizable()
                    .scaleEffect(x: 0.8 * scale) // Scale the "eyes" based on the overall scale factor
                    .offset(x: eyeXOffset, y: -33)
                    .shadow(color: .red, radius: 100)
                    .zIndex(1)
            }
        }
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}









