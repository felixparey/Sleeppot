//
//  ContentView.swift
//  Sleeppot
//
//  Created by Felix Parey on 19/10/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State var userInputText = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var chatReadingScene: SKScene {
        let scene = ReadingChatSzene()
        scene.size = CGSize(width: 216, height: 216)
        return scene
    }
    
    var body: some View {
        
        ZStack {
            Image("backgroundImage")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack{
                Spacer()
                SpriteView(scene: self.chatReadingScene, options: [.allowsTransparency])
                
                
                TextField("Insert Text Here", text: $userInputText)
                //                        .placeholder(when: userInputText.isEmpty, placeholder: {
                //                            Label("Tell me your feeling here", systemImage: "pencil.line")
                //                                .foregroundStyle(Color.gray)
                //                                .padding([.top, .leading, .trailing], 7.0)
                //    })
                    .focused($isTextFieldFocused)
                    .background(Color("textBoxColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(Color("purpleTextColor"))
                    .padding()
                    .submitLabel(.done)
                    .onSubmit {
                        isTextFieldFocused = false
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
