//  SwiftUIView.swift
//  Sleepot
//
//  Created by Gianrocco Di Tomaso on 24/10/23.
//

import SwiftUI

struct RespView: View {
    let frameCount = 96
    
    @State private var currentFrame: Int = 0
    @State private var isAnimating: Bool = true // Added @State for animation control
    @State private var timer: Timer? // Added a Timer property
    @State private var timer2: Timer?
    @Environment(ScenePresentedViewModel.self) private var scenePresented

    var body: some View {
        
            GeometryReader { geometry in
                Image("gResp\(currentFrame)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(x: 1.2, y: 1.2)
                    .offset(x: 0, y: -40)
                    .shadow(color: .shadowhead, radius: 50)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onAppear {
                            startAnimation()       
            }
        }
        
    }

    func startAnimation() {
        isAnimating = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 24.0, repeats: true) { timer in
            currentFrame = (currentFrame + 1) % frameCount
            if currentFrame == frameCount - 1 {
                stopAnimation()
            }
        }
    }
    
    func startAnimationInReverse() {
        isAnimating = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 24.0, repeats: true) { timer in
            currentFrame = (currentFrame - 1) // Decrement the current frame
            if currentFrame <= 0 {
                // Stop the animation when you reach the beginning (frame 0)
                timer2 = Timer.scheduledTimer(withTimeInterval: 1.0 / 24.0, repeats: true) { timer in
                    currentFrame = (currentFrame + 1) % frameCount
                    if currentFrame == frameCount - 1 {
                        stopAnimation()
                    }
                }
            }
        }
    }

    func stopAnimation() {
        isAnimating = false
        timer?.invalidate()
        timer = nil
    }
}


struct Response2View: View{
    @Environment(ScenePresentedViewModel.self) private var scenePresented
    
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            RespView()
            
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
    Response2View()
        .environment(ScenePresentedViewModel())
        .environment(UserInput())
        .environment(ViewModel())
}
