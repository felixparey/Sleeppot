//
//  LandingPageView.swift
//  Sleeppot
//
//  Created by Felix Parey on 30/10/23.
//

import SwiftUI

struct OnboardingStep{
    let image: String
}

private let onBoardingSteps = [
    OnboardingStep (image: "onBoarding1"),
    OnboardingStep (image: "onBoarding2"),
    OnboardingStep (image: "onBoarding3"),
    OnboardingStep (image: "onBoarding4"),
    OnboardingStep (image: "onBoarding5"),
    
]

struct LandingPageView: View {
    @State private var currentStep = 0

    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        ZStack {
            Color("purpleTextColor") // Imposto il colore di sfondo
                .ignoresSafeArea(.all, edges: .all)

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.currentStep = onBoardingSteps.count - 1
                    }) {
                        Text("Skip")
                            .padding(16)
                            .foregroundColor(.white)
                    }
                }

                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingSteps.count) { it in
                        Image(onBoardingSteps[it].image)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity) // Occupa l'intera schermata
                            .clipped()
                            .edgesIgnoringSafeArea(.all)
                            .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                HStack {
                    ForEach(0..<onBoardingSteps.count) { it in
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
                    if self.currentStep < onBoardingSteps.count - 1 {
                        self.currentStep += 1
                    } else {
                        // Avvia la logica per "Get Started"
                    }
                }) {
                    Text(currentStep < onBoardingSteps.count - 1 ? "Next" : " Get Started")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .toolbar{
            Button("Hello"){
                
            }
        }
    }
}

#Preview {
    LandingPageView()
}
