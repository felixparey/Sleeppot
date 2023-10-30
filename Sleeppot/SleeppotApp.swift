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
    @AppStorage("usedcount") var usedcount : Int = 0
    
    var body: some Scene {
        WindowGroup {
            if usedcount == 0{
                Landing()
            }else{
                MainView()
                    .environment(scenePresentedVM)
                    .environment(userInput)
                    .environment(viewModel)
            }
        }
    }
}
