//
//  CloudView.swift
//  Sleeppot
//
//  Created by Felix Parey on 30/10/23.
//

import SwiftUI

struct CloudView: View {
    @State private var cloud1Offset = CGSize(width: -220, height: -20)
    @State private var cloud2Offset = CGSize(width: -220, height: -20)
    @State private var cloud3Offset = CGSize(width: 220, height: -40)
    
    var body: some View {
        ZStack {
            
                
        
            Image("cloud1")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .offset(cloud1Offset)
                .scaleEffect(4.5)
                .shadow(color: .black, radius: 80)
                .onAppear {
                    withAnimation(.easeOut(duration: 1)) {
                        cloud1Offset = CGSize(width: 80, height: -20)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 1)) {
                            cloud1Offset = CGSize(width: -320, height: 0)
                        }
                    }
                }
            
            Image("cloud2")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .offset(cloud2Offset)
                .scaleEffect(4.5)
                .shadow(color: .black, radius: 80)
                .onAppear {
                    withAnimation(.easeOut(duration: 1)) {
                        cloud2Offset = CGSize(width: 80, height: -20)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 1)) {
                            cloud2Offset = CGSize(width: -280, height: 0)
                        }
                    }
                }
            
            Image("cloud3")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .offset(cloud3Offset)
                .scaleEffect(4.5)
                .shadow(color: .black, radius: 80)
                .onAppear {
                    withAnimation(.easeOut(duration: 1)) {
                        cloud3Offset = CGSize(width: -80, height: -30)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 1)) {
                            cloud3Offset = CGSize(width: 280, height: 0)
                        }
                    }
                }
        }
    }
}

struct Cloud_Previews: PreviewProvider {
    static var previews: some View {
        CloudView()
    }
}
