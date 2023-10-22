//
//  ChangeSceneTestView.swift
//  Sleeppot
//
//  Created by Felix Parey on 22/10/23.
//

import SwiftUI

struct ChangeSceneTestView: View {
    
    @State private var opacityIdle = 1.0
    @State private var opacityChat = 0.0
    @State private var opacityITC = 0.0
 //   @State private var buttonIsPressed = false
    
    
    var body: some View {
        
        VStack {
            Button("Change"){
                if opacityIdle == 1.0{
               //     buttonIsPressed = true
                    opacityIdle = 0.0
                    opacityITC = 0.0
                    opacityChat = 1.0
              //      print(buttonIsPressed)
                    
                }else{
                    opacityIdle = 1.0
                    opacityChat = 0.0
               //     buttonIsPressed = false
              //      print(buttonIsPressed)
                }
                
            }
            SpriteViews(opacityIdle: $opacityIdle, opacityChat: $opacityChat)
        }
        
        
    }
}

#Preview {
    ChangeSceneTestView()
}
