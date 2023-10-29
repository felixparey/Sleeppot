//
//  PottyOutputView.swift
//  Sleeppot
//
//  Created by Felix Parey on 25/10/23.
//

import SwiftUI

struct PottyOutputView: View {
    
    @Environment(UserInput.self) private var outputText
    @Environment(ScenePresentedViewModel.self) private var scenePresentedVM
    @Environment(ViewModel.self) private var mlOutput
    
    
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            Text(mlOutput.MLmodelPrediction)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            
            Button(action: {
                
//Maybe not go back to chat but just get different random line
                scenePresentedVM.scenePresented = 1
                
            }, label: {
                Circle()
                
                    .frame(width: 40)
                    .overlay {
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(.white)
                    }
                    .offset(y: 30)
                    
            })
        }
    }
}

#Preview {
    PottyOutputView()
}
