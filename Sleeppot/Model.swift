//
//  ViewSceneConnection.swift
//  Sleeppot
//
//  Created by Felix Parey on 21/10/23.
//

import Foundation

//class Controls: ObservableObject {
//    var scenePresented: Int
//    var animationIdleIsRunning : Bool
//    var animationChatIsRunning : Bool
//    
//    init(scenePresented: Int, animationIdleIsRunning: Bool, animationChatIsRunning: Bool) {
//        self.scenePresented = scenePresented
//        self.animationIdleIsRunning = animationIdleIsRunning
//        self.animationChatIsRunning = animationChatIsRunning
//    }
//}

class Controls: ObservableObject{
    
    @Published var scenePresented = 0
    
//    init(scenePresented: Int) {
//        self.scenePresented = scenePresented
//    }
}



