//
//  SpriteViews.swift
//  Sleeppot
//
//  Created by Felix Parey on 22/10/23.
//

import SwiftUI
import SpriteKit

struct SpriteViews: View {
    
    
    @ObservedObject var sceneIdleWrapper = SceneIdleWrapper()
    @ObservedObject var sceneChatWrapper = SceneChatWrapper()
   // @ObservedObject var sceneITCWrapper = SceneITCWrapper()
   // @ObservedObject var buttonPressed = ButtonPressed()
    @Binding var opacityIdle : Double
    @Binding var opacityChat : Double
  //  @Binding var opacityITC : Double
  //  @Binding var buttonPressed : Bool
    
    
    var body: some View {
        ZStack {
            SpriteView(scene: sceneIdleWrapper.sceneIdle, transition: .fade(withDuration: 2.0), options: .allowsTransparency)
                .opacity(opacityIdle)
            
            SpriteView(scene: sceneChatWrapper.sceneChat, options: .allowsTransparency)
                .opacity(opacityChat)
            
//            if buttonPressed{
//                SpriteView(scene: sceneITCWrapper.sceneITC, options: .allowsTransparency)
//                    .opacity(opacityChat)
//            }
                
            
        }
    }
}

//#Preview {
//    SpriteViews(opacityIdle: $value)
//}
