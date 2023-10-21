//
//  ViewModel.swift
//  Sleeppot
//
//  Created by Felix Parey on 21/10/23.
//

import Foundation

class SceneIdleWrapper: ObservableObject {
    @Published var sceneIdle = PottyIdleScene(size: CGSize(width: 216, height: 216))
}

class SceneChatWrapper: ObservableObject {
    @Published var sceneChat = PottyScene(size: CGSize(width: 216, height: 216))
}

