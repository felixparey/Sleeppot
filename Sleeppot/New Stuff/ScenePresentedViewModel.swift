//
//  ScenePresentedViewModel.swift
//  Sleeppot
//
//  Created by Felix Parey on 25/10/23.
//

import Foundation
import Observation

@Observable
class ScenePresentedViewModel{
    var scenePresented = 0
    var showClouds = false
    var counterForAnimation = 0
    var respInReverse = false
}
