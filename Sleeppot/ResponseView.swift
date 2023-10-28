//
//  ResponseView.swift
//  Sleepot
//
//  Created by sara hu lihua on 28/10/23.
//

import SwiftUI

struct GRespView: View {
    @State private var degrees = 0.0
    @State private var yOffset = 0.0
    @State private var starScale: CGFloat = 0.0 // Added scale state
    @State private var isLooping = false

    var body: some View {
        ZStack {
            // Body
            Image("bodyGResp")
                .resizable()
                .offset(x: 0.0, y: -27 + yOffset)
                .shadow(color: .gray, radius: 30)
            
            // Star (behind the head)
            Image("star")
                .resizable()
                .scaleEffect(starScale) // Apply scale effect
                .offset(x: 0, y: -40)
                .shadow(color:.shadowhead ,radius: 50)
            
            // Head
            VStack {
                Image("headGResp")
                    .resizable()
                    .scaleEffect(x: 1.1, y: 1.1)
                    .offset(x: -3, y: 6 + yOffset)
                    .shadow(color: .shadowhead, radius: 30)

                Slider(value: $degrees, in: -10.0...10.0)
                    .padding()
                    .hidden()
            }
        }
        .onAppear() {
            animateRotation()
        }
    }

    func animateRotation() {
        Timer.scheduledTimer(withTimeInterval: 1.8, repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: 1.5)) {
                degrees = degrees == 10.0 ? -10.0 : 10.0
            }
            withAnimation(Animation.linear(duration: 8)) {
                yOffset = yOffset == 30.0 ? -30.0 : 30.0
                
            }
            // Scale the star from 0 to 1 and then make it disappear
            withAnimation(Animation.easeInOut(duration: 4)) {
                starScale = 1.0
            }
        }
    }
    func animateScale() {
            withAnimation(Animation.easeInOut(duration: 8)) {
                starScale = 1.2 // Scale the star from 0 to 1 over 4 seconds
            }
        }
}

//struct GResp_Previews: PreviewProvider {
//    static var previews: some View {
//        GRespView()
//    }
//}


struct ResponseView: View{
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            PottyOutputView()
                .padding()
            
            
        }
    }
}

#Preview{
    ResponseView()
}
