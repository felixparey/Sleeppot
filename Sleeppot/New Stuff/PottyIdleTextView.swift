//
//  PottyIdleTextView.swift
//  Sleeppot
//
//  Created by Felix Parey on 24/10/23.
//

import SwiftUI

struct PottyIdleTextView: View {
    
    @State private var pottyText = "Hey Buddy, what's on your mind tonight?"
    
    var body: some View {
        
        
        ZStack {
            
            Text(pottyText)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            
//            Path { path in
//                path.move(to: CGPoint(x : 200, y : 500))
//                       path.addLine (to : CGPoint(x: 240, y : 550))
//                       path.addLine (to : CGPoint(x: 160, y : 550))
//                       path.addLine (to : CGPoint(x: 200, y : 500))
//                   }
//            .fill(.ultraThinMaterial)
//                   .offset(y:-200)
        }
        .padding(.horizontal)
        .offset(y: 20)
    }
}

#Preview {
    PottyIdleTextView()
}
