//
//  GRespView.swift
//  Sleeppot
//
//  Created by Felix Parey on 25/10/23.
//

import SwiftUI

struct GRespView: View {
    @State private var degrees = 0.0
    @State private var yOffset = 0.0
    @State private var starScale: CGFloat = 0.0 // Added scale state
    @State private var isLooping = false
    @Environment(ScenePresentedViewModel.self) private var scenePresented

    var body: some View {
        ZStack {
            // Body
            Image("bodyGResp")
                .resizable()
                .offset(x: 0.0, y: -27 + yOffset)
                .shadow(color: .gray, radius: 30)
                .scaleEffect(x:1.2,y:1.2)
            // Star (behind the head)
            Image("star")
                .resizable()
                .scaleEffect(starScale) // Apply scale effect
                .offset(x: 0, y: -40)
                .shadow(color:.shadowhead ,radius: 80)
            
            // Head
            VStack {
                Image("headGResp")
                    .resizable()
                    .scaleEffect(x: 1.3, y: 1.3)
                    .offset(x: -3, y: 0 + yOffset)
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
        
        var timeInterval = 0.0
        var counter = 0
        
        if scenePresented.scenePresented == 2{
            counter += 1
        }
        if counter == 0{
            timeInterval = 0
        }else{
            timeInterval = 1.8
        }
        
        
        Timer.scheduledTimer(withTimeInterval: TimeInterval(timeInterval), repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: 1.5)) {
                degrees = degrees == 10.0 ? -10.0 : 10.0
            }
            withAnimation(Animation.easeInOut(duration: 6)) {
                yOffset = yOffset == 50.0 ? -50.0 : 50.0
                
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
    @Environment(ScenePresentedViewModel.self) private var scenePresented
    
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            GRespView()
            
            VStack {
                PottyOutputView()
                    .padding()
//                Button(action: {
//                    
//                }, label: {
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(height: 50)
//                        .padding(.horizontal)
//                        .overlay {
//                            Text("Express more feelings")
//                                .font(.title2)
//                                .fontWeight(.semibold)
//                                .foregroundStyle(.white)
//                        }
//                        
//                })
            }
        }
    }
}

#Preview{
    ResponseView()
        .environment(ScenePresentedViewModel())
        .environment(UserInput())
        .environment(ViewModel())
}
