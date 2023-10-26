//
//  IdleView.swift
//  Sleeppot
//
//  Created by Felix Parey on 24/10/23.
//

import SwiftUI

struct IdleView: View {
    @State private var degrees = 0.0
    @State private var yOffset = 0.0 // Added @State for Y offset
    @State private var isLooping = false

    var body: some View {
        ZStack {

            
                VStack {
                    Image("headIdle")
                        .resizable()
                        .scaleEffect(y: 1.3)
                        .offset(x: -3, y: 8 + yOffset) // Apply yOffset here
                        .rotationEffect(.degrees(degrees))
                        .shadow(color: .gray,  radius: 20)

                    Slider(value: $degrees, in: -10.0...10.0)
                        .padding()
                        .hidden()
                }
                
            
            Image("mainBody")
                .resizable()
                .offset(x: 0.0, y: -27 + yOffset)
                .shadow(color: .gray,  radius: 30)
            
        }
        .onAppear() {
            animateRotation()
        }
    }

    func animateRotation() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: 3.0)) {
                degrees = degrees == 10.0 ? -10.0 : 10.0
            }
            withAnimation(Animation.linear(duration: 8)) {
                yOffset = yOffset == 20.0 ? -20.0 : 20.0 // Toggle between 3 and -3
            }
        }
    }
}







#Preview {
    IdleView()
}
