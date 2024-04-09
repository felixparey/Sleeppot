//
//  OnBoarding.swift
//  Sleeppot
//
//  Created by sara hu lihua on 31/10/23.
//


import SwiftUI
struct OnboardingStep2{
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps2 = [
    OnboardingStep2 (image: "capa1", title: "Welcome to Sleepot", description: "A soothing space for your \n thoughts, worries\n and solutions"),
    OnboardingStep2 (image: "capa2", title: "How does it work?", description: " " ),
    OnboardingStep2 (image: "capa3", title: "First you collect your \n toughts...", description: " "),
    OnboardingStep2 (image: "capa 4", title: "Then you write them \n down", description: " "),
    OnboardingStep2 (image: "capa 5", title: "And in the end, you \n get an advice!", description: " "),
    
]

// Array separato per le dimensioni e le posizioni delle immagini
private let imageSizes: [CGSize] = [
    CGSize(width: 230, height: 230),
    CGSize(width: 550, height: 550),
    CGSize(width: 300, height: 300),
    CGSize(width: 260, height: 260),
    CGSize(width: 350, height: 350)
]

private let imagePositions: [CGPoint] = [
    CGPoint(x: 0, y: 0),
    CGPoint(x: 0, y: 120),
    CGPoint(x: 0, y: 30),
    CGPoint(x: 10, y: 80),
    CGPoint(x: 0, y: 20)
]

struct ImageShadow {
    let color: Color
    let radius: CGFloat
}

private let imageShadows: [ImageShadow] = [
    ImageShadow(color: .shadowhead, radius: 25),
    ImageShadow(color: .shadowhead, radius: 15),
    ImageShadow(color: .shadowhead, radius: 30),
    ImageShadow(color: .shadowhead, radius: 40),
    ImageShadow(color: .shadowhead, radius: 70)
]

// Array separato per le posizioni del titolo
private let titlePositions: [CGPoint] = [
    CGPoint(x: 0, y: 50),
    CGPoint(x: 0, y: -520),
    CGPoint(x: 0, y: 50),
    CGPoint(x: 0, y: -300),
    CGPoint(x: 0, y: 60)
]


struct OnBoardingView2: View {
    @State private var currentStep = 0
    @AppStorage("usedcount") var usedcount = false

    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        ZStack {
            
            
            Color(Color("purpleTextColor")) // Imposto il colore di sfondo
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        self.currentStep = onBoardingSteps2.count - 1
//                    }) {
//                        Text("Skip")
//                            .padding(16)
//                            .foregroundColor(.white)
//                    }
//                }
                
                
                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingSteps2.count) { it in
                        VStack{
                            Image(onBoardingSteps2[it].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: imageSizes[it].width, height: imageSizes[it].height)
                                .shadow(color: imageShadows[it].color, radius: imageShadows[it].radius)
                                .offset(x: imagePositions[it].x, y: imagePositions[it].y)
                                .padding(.top,20)
                                .tag(it)
                            Text(onBoardingSteps2[it].title)
                                .font(.system(size: 35))
                                .padding(.top, titlePositions[it].y)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text(onBoardingSteps2[it].description)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.horizontal,32)
                                .padding(.top,1)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                
                HStack {
                    ForEach(0..<onBoardingSteps2.count) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.bottom, 24)

                Button(action: {
                    if self.currentStep < onBoardingSteps2.count - 1 {
                        self.currentStep += 1
                    } else {
                        // Avvia la logica per "Get Started"
                        usedcount.toggle()
                    }
                }) {
                    Text(currentStep < onBoardingSteps2.count - 1 ? "Next" : " Get Started")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(Color("purpleTextColor"))
                }
                .buttonStyle(PlainButtonStyle())
            } //: VSTACK
        } //:ZSTACK
    }
}
#Preview {
    OnBoardingView2()
}
