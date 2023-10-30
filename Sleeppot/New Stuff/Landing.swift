//
//  Landing.swift
//  Sleeppot
//
//  Created by Felix Parey on 30/10/23.
//

import SwiftUI

struct Landing: View {
    
    @AppStorage("usedcount") private var usedcount = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom){
                TabView(){
                    
                    Image("onBoarding1")
                    Image("onBoarding2")
                    Image("onBoarding3")
                    Image("onBoarding4")
                    ZStack(alignment: .bottom) {
                        Image("onBoarding5")
                        Button(action: {
                            usedcount = 1
                        }, label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 50)
                                .padding()
                            
                                .overlay {
                                    Text("Get Started")
                                        .foregroundStyle(.white)
                                        .font(.title)
                                }
                                .safeAreaPadding(.bottom, 70)
                        })
                    }
                }
                .background(Color("purpleTextColor"))
                .ignoresSafeArea()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            .toolbar(content: {
                Button(action: {
                    usedcount = 1
                }, label: {
                    Text("Skip")
                        .font(.title2)
                })
            })
        }
    }
}

#Preview {
    Landing()
}
