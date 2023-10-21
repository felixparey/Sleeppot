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
    @State var buttonOnePressed = false
                            
    
    let scene1 = PottyScene(size: CGSize(width: 216, height: 216))
    let scene2 = PottyIdleScene(size: CGSize(width: 216, height: 216))
    var body: some View {
        
        ZStack {
            Image("backgroundImage")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack{
                Button("Change") {
                    buttonOnePressed.toggle()
                   print(buttonOnePressed)
                }
                if buttonOnePressed{
                    SpriteView(scene: scene1, options: [.allowsTransparency])
                        .onAppear()
                }else{
                    SpriteView(scene: scene2, options: [.allowsTransparency])
                }
            //    SpriteView(scene: pottyScene, options: [.allowsTransparency])
                
                
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


