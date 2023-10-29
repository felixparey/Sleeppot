//
//  SleeppotApp.swift
//  Sleeppot
//
//  Created by Felix Parey on 19/10/23.
//

import SwiftUI

@main
struct SleeppotApp: App {
    
    @State private var scenePresentedVM = ScenePresentedViewModel()
    @State private var userInput = UserInput()
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(scenePresentedVM)
                .environment(userInput)
                .environment(viewModel)
        }
    }
}
