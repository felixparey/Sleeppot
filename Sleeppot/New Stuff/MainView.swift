//
//  MainView.swift
//  Sleeppot
//
//  Created by Felix Parey on 24/10/23.
//

import SwiftUI




struct MainView: View {
    
    
    @State var userInputText = UserInput()
    @State var scenePresentedVM = ScenePresentedViewModel()
    @State var showClouds = false
    
    func presentClouds(){
        showClouds = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            showClouds = true
        }
    }
    
    func changeSceneWithDelay(scene: Int){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            scenePresentedVM.scenePresented = scene
        }
    }
    
    func setCloudsFalse(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showClouds = false
        }
    }
    
    var body: some View {
        
        let textEditor = TextEditorView()
        ZStack{
            VStack {
                Spacer()
                Image("backgroundImage")
                    .resizable()
                    .blur(radius: 2)
                    .scaleEffect(x: 1.3, y: 1.3)
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .onTapGesture {
                hideKeyboard()
                // scenePresentedVM.scenePresented = 0
            }
            VStack {
                Spacer()
                
                switch scenePresentedVM.scenePresented{
                    
                case 0:
                    IdleView()
                        .offset(y: -50)
                    
                case 1:
                    ZStack {
                        ChatView()
                            .offset(y: -110)
                            .onTapGesture {
                                hideKeyboard()
                                presentClouds()
                                changeSceneWithDelay(scene: 0)
                                setCloudsFalse()
                            }
                        // CloudView()
                        
                    }
                    
                case 2:
                    ResponseView()
                        .offset(y: -50)
                        .overlay(alignment: .topLeading) {
                            Button {
                                presentClouds()
                                changeSceneWithDelay(scene: 0)
                                setCloudsFalse()
                                
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.backward.circle")
                                        .font(.title)
                                        .foregroundStyle(Color("textBoxColor"))
                                        .padding()
                                        .clipShape(Circle())
                                    Spacer()
                                }
                            }
                        }
                    
                    
                    
                default:
                    IdleView()
                        .offset(y: -50)
                }
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .onTapGesture {
                hideKeyboard()
                //  scenePresentedVM.scenePresented = 0
            }
            
            
            
            if scenePresentedVM.scenePresented == 0 || scenePresentedVM.scenePresented == 1{
                
                VStack {
                    Spacer()
                    PottyIdleTextView()
                    textEditor
                        .onTapGesture() {
                            showClouds = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                scenePresentedVM.scenePresented = 1
                                        }
                            
                            
                        }
                    Button("GetResponse"){
                        hideKeyboard()
                        presentClouds()
                        changeSceneWithDelay(scene: 2)
                        print("Text: \(userInputText.userInput)")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            showClouds = false
                        }
                        
                        
                    }
                    .foregroundStyle(.white)
                }
                
            }
            if showClouds == true{
                CloudView()
            }
            
        }
    }
}

#Preview {
    MainView()
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct TextEditorView: View {
    @State var userInput = UserInput()
    @State var scenePresentedVM = ScenePresentedViewModel()
    
    func saveText(){
        userInput.savedText = userInput.userInput
        print(userInput.savedText)
    }
    
    var body: some View {
        TextEditor(text: $userInput.userInput)
            .placeholder(when: userInput.userInput.isEmpty, placeholder: {
                VStack{
                    Label("Tell me your feelings here...", systemImage: "pencil.line")
                        .foregroundStyle(Color.gray)
                        .padding([.top, .leading, .trailing], 7.0)
                    Spacer()
                }
            })
            .textFieldStyle(.roundedBorder)
            .foregroundStyle(Color("purpleTextColor"))
            .scrollContentBackground(.hidden)
            .background(Color("textBoxColor"))
            .frame(height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    saveText()
                    userInput.userInput = ""
                    hideKeyboard()
                }, label: {
                    Circle()
                        .frame(width: 30, height: 30)
                })
                .padding([.top, .trailing], 20.0)
            }
    }
}



