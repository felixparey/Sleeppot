//
//  ContentView.swift
//  Sleeppot
//
//  Created by Felix Parey on 19/10/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    //    @StateObject
    @ObservedObject var viewModel = Controls()
    @State var userInputText = ""
    @FocusState private var isTextFieldFocused: Bool
    @ObservedObject var sceneIdleWrapper = SceneIdleWrapper()
    @ObservedObject var sceneChatWrapper = SceneChatWrapper()
    
    var body: some View {
        
        ZStack {
            Image("backgroundImage")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack{
                HStack {
                    Button("Chat"){
                        viewModel.scenePresented = 1
                    }
                    .foregroundStyle(.white)
                    
                    Button("Idle"){
                        viewModel.scenePresented = 0
//                        sceneIdle.isHidden = false
                    }
                    .foregroundStyle(.white)
                }
                
                    if viewModel.scenePresented == 0{
                            SpriteView(scene: sceneIdleWrapper.sceneIdle, options: [.allowsTransparency])
                        
                    }else if viewModel.scenePresented == 1{
                            SpriteView(scene: sceneChatWrapper.sceneChat, options: [.allowsTransparency])
                    }
                
                TextField("Insert Text Here", text: $userInputText)
                    .focused($isTextFieldFocused)
                    .background(Color("textBoxColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(Color("purpleTextColor"))
                    .padding()
                    .submitLabel(.done)
                    .onSubmit {
                        print("Gianrocco had a bachelor party yesterday")
                        isTextFieldFocused = false
                    }
                    .overlay(alignment: .trailing) {
                        Button {
                            print("Hello")
                        } label: {
                            Circle()
                                .frame(width: 30, height: 30)
                                .padding(.trailing, 20)
                        }
                    }
            }
            .padding()
        }.onTapGesture {
            isTextFieldFocused = false
        }
    }
}

#Preview {
    ContentView()
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
///PLACEHOLDER

//                        .placeholder(when: userInputText.isEmpty, placeholder: {
//                            Label("Tell me your feeling here", systemImage: "pencil.line")
//                                .foregroundStyle(Color.gray)
//                                .padding([.top, .leading, .trailing], 7.0)
//    })
